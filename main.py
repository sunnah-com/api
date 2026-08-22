import functools
from flask import Flask, jsonify, request, abort
from sqlalchemy import and_, func, or_
from werkzeug.exceptions import HTTPException

app = Flask(__name__)
app.config.from_object("config.Config")

from models import HadithCollection, Book, Chapter, Hadith

# sunnah.com publishes these as standalone collections, but their hadiths are
# stored as books of `forty`, so every lookup must also match the book.
COLLECTION_ALIASES = {
    "nawawi40": ("forty", "1"),
    "qudsi40": ("forty", "2"),
    "shahwaliullah40": ("forty", "3"),
}


def resolve_collection(name):
    """Return the collection and book that store the hadiths of `name`."""
    return COLLECTION_ALIASES.get(name, (name, None))


def serialize_as(name):
    """Echo the requested name so an alias response never reports `forty`."""
    return {"collection": name} if name in COLLECTION_ALIASES else {}


def alias_collection(name):
    """Build the collection resource of an alias from its book row."""
    collection, book_number = COLLECTION_ALIASES[name]
    book = Book.query.filter_by(collection=collection, status=4, ourBookID=book_number).first()

    if book is None:
        return None

    return {
        "name": name,
        "hasBooks": "no",
        "hasChapters": "no",
        "collection": [
            {"lang": "en", "title": book.englishBookName, "shortIntro": ""},
            {"lang": "ar", "title": book.arabicBookName, "shortIntro": ""},
        ],
        "totalHadith": book.totalNumber,
        "totalAvailableHadith": book.totalNumber,
    }


def resolve_book_collection(name, book_id):
    """Resolve `name`, rejecting a book that is not the alias's own."""
    collection, book_number = resolve_collection(name)

    if book_number is not None and book_id != book_number:
        abort(404)

    return collection


def ref_condition(collection, hadith_number):
    """Build the filter matching one `collection:hadithNumber` reference."""
    name, book_number = resolve_collection(collection)
    condition = and_(Hadith.collection == name, Hadith.hadithNumber == hadith_number)
    return condition if book_number is None else and_(condition, Hadith.bookNumber == book_number)


def ref_match(results, collection, hadith_number):
    """Find the hadith matching one reference, scoped to an alias's own book."""
    name, book_number = resolve_collection(collection)

    for h in results:
        if h.collection == name and h.hadithNumber == hadith_number and book_number in (None, h.bookNumber):
            return h

    return None


@app.before_request
def verify_secret():
    if not app.debug and request.headers.get("x-aws-secret") != app.config["AWS_SECRET"]:
        abort(401)


@app.errorhandler(HTTPException)
def jsonify_http_error(error):
    response = {"error": {"details": error.description, "code": error.code}}

    return jsonify(response), error.code


def unpack_query(result):
    """Allow a route to return a query, or a (query, serialize kwargs) pair."""
    return result if isinstance(result, tuple) else (result, {})


def paginate_results(f):
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
        limit = int(request.args.get("limit", 50))
        page = int(request.args.get("page", 1))

        query, opts = unpack_query(f(*args, **kwargs))
        queryset = query.paginate(page=page, per_page=limit, max_per_page=100)
        result = {
            "data": [x.serialize(**opts) for x in queryset.items],
            "total": queryset.total,
            "limit": queryset.per_page,
            "previous": queryset.prev_num,
            "next": queryset.next_num,
        }
        return jsonify(result)

    return decorated_function


def single_resource(f):
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
        query, opts = unpack_query(f(*args, **kwargs))
        result = query.first_or_404().serialize(**opts)
        return jsonify(result)

    return decorated_function


def paginate_items(items):
    """Paginate a serialized list the way `paginate_results` paginates a query."""
    limit = min(int(request.args.get("limit", 50)), 100)
    page = int(request.args.get("page", 1))
    start = (page - 1) * limit
    window = items[start:][:limit]

    if limit < 1 or page < 1 or (not window and page != 1):
        abort(404)

    return jsonify(
        {
            "data": window,
            "total": len(items),
            "limit": limit,
            "previous": page - 1 if page > 1 else None,
            "next": page + 1 if start + limit < len(items) else None,
        }
    )


@app.route("/", methods=["GET"])
def home():
    return "<h1>Welcome to sunnah.com API.</h1>"


@app.route("/v1/collections", methods=["GET"])
def api_collections():
    items = [x.serialize() for x in HadithCollection.query.order_by(HadithCollection.collectionID)]
    stored = {x["name"] for x in items}
    aliases = [alias_collection(name) for name in COLLECTION_ALIASES if name not in stored]
    return paginate_items(items + [x for x in aliases if x is not None])


@app.route("/v1/collections/<string:name>", methods=["GET"])
def api_collection(name):
    row = HadithCollection.query.filter_by(name=name).first()
    result = row.serialize() if row is not None else alias_collection(name) if name in COLLECTION_ALIASES else None

    if result is None:
        abort(404)

    return jsonify(result)


@app.route("/v1/collections/<string:name>/books", methods=["GET"])
@paginate_results
def api_collection_books(name):
    collection, book_number = resolve_collection(name)
    query = Book.query.filter_by(collection=collection, status=4).order_by(func.abs(Book.ourBookID))
    return query if book_number is None else query.filter_by(ourBookID=book_number)


@app.route("/v1/collections/<string:name>/books/<string:bookNumber>", methods=["GET"])
@single_resource
def api_collection_book(name, bookNumber):
    book_id = Book.get_id_from_number(bookNumber)
    collection = resolve_book_collection(name, book_id)
    return Book.query.filter_by(collection=collection, status=4, ourBookID=book_id)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/hadiths", methods=["GET"])
@paginate_results
def api_collection_book_hadiths(collection_name, bookNumber):
    collection = resolve_book_collection(collection_name, bookNumber)
    query = Hadith.query.filter_by(collection=collection, bookNumber=bookNumber).order_by(Hadith.englishURN)
    return query, serialize_as(collection_name)


@app.route("/v1/collections/<string:collection_name>/hadiths/<string:hadithNumber>", methods=["GET"])
@single_resource
def api_collection_hadith(collection_name, hadithNumber):
    collection, book_number = resolve_collection(collection_name)
    # `forty` numbers each of its books from 1, so order to keep the pick stable
    query = Hadith.query.filter_by(collection=collection, hadithNumber=hadithNumber).order_by(Hadith.englishURN)

    if book_number is not None:
        query = query.filter_by(bookNumber=book_number)

    return query, serialize_as(collection_name)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters", methods=["GET"])
@paginate_results
def api_collection_book_chapters(collection_name, bookNumber):
    book_id = Book.get_id_from_number(bookNumber)
    collection = resolve_book_collection(collection_name, book_id)
    return Chapter.query.filter_by(collection=collection, arabicBookID=book_id).order_by(Chapter.babID)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters/<float:chapterId>", methods=["GET"])
@single_resource
def api_collection_book_chapter(collection_name, bookNumber, chapterId):
    book_id = Book.get_id_from_number(bookNumber)
    collection = resolve_book_collection(collection_name, book_id)
    return Chapter.query.filter_by(collection=collection, arabicBookID=book_id, babID=chapterId)


@app.route("/v1/hadiths", methods=["GET"])
@paginate_results
def api_hadiths():
    query = Hadith.query

    # Apply filters based on query parameters
    collection = request.args.get("collection")
    if collection:
        name, book_number = resolve_collection(collection)
        query = query.filter_by(collection=name)
        if book_number is not None:
            query = query.filter_by(bookNumber=book_number)

    book_number = request.args.get("bookNumber")
    if book_number:
        query = query.filter_by(bookNumber=book_number)

    chapter_id = request.args.get("chapterId")
    if chapter_id:
        query = query.filter_by(babID=float(chapter_id))

    hadith_number = request.args.get("hadithNumber")
    if hadith_number:
        query = query.filter_by(hadithNumber=hadith_number)

    # Order by URN for consistent results
    return query.order_by(Hadith.englishURN), serialize_as(collection)


@app.route("/v1/hadiths/<int:urn>", methods=["GET"])
@single_resource
def api_hadith(urn):
    return Hadith.query.filter(or_(Hadith.arabicURN == urn, Hadith.englishURN == urn))

@app.route("/v1/hadiths/urns", methods=["GET"])
def api_hadiths_by_urns():
    # Enforce: urns must appear only once (no ?urns=1&urns=2)
    if len(request.args.getlist("urns")) != 1:
        abort(
            400,
            "Query parameter 'urns' must be provided exactly once. Example: ?urns=305,306",
        )

    urns_param = request.args.get("urns", "").strip()
    if not urns_param:
        abort(400, "Query parameter 'urns' is required. Example: ?urns=305,306")

    # Parse comma-separated URNs
    parts = [p.strip() for p in urns_param.split(",") if p.strip()]
    if not parts:
        abort(400, "Query parameter 'urns' is required. Example: ?urns=305,306")

    urns = []
    invalid = []
    seen = set()

    for p in parts:
        try:
            u = int(p)
        except (TypeError, ValueError):
            invalid.append(p)
            continue
        if u not in seen:
            seen.add(u)
            urns.append(u)

    if invalid:
        abort(400, f"Invalid URN(s): {', '.join(map(str, invalid))}")

    MAX_URNS = 100
    if len(urns) > MAX_URNS:
        abort(400, f"Too many URNs (max {MAX_URNS}).")

    results = (
        Hadith.query.filter(
            or_(Hadith.englishURN.in_(urns), Hadith.arabicURN.in_(urns))
        )
        .all()
    )

    by_eng = {h.englishURN: h for h in results}
    by_ar = {h.arabicURN: h for h in results}

    data = []
    missing = []
    for u in urns:
        h = by_eng.get(u) or by_ar.get(u)
        if h is None:
            missing.append(u)
        else:
            data.append(h.serialize())

    return jsonify({"count": len(data), "missing": missing, "data": data})


@app.route("/v1/hadiths/refs", methods=["GET"])
def api_hadiths_by_refs():
    # Enforce: refs must appear only once (no ?refs=a&refs=b)
    if len(request.args.getlist("refs")) != 1:
        abort(
            400,
            "Query parameter 'refs' must be provided exactly once. Example: ?refs=bukhari:1,bukhari:2",
        )

    refs_param = request.args.get("refs", "").strip()
    if not refs_param:
        abort(400, "Query parameter 'refs' is required. Example: ?refs=bukhari:1,bukhari:2")

    # Parse comma-separated collection:hadithNumber refs
    parts = [p.strip() for p in refs_param.split(",") if p.strip()]
    if not parts:
        abort(400, "Query parameter 'refs' is required. Example: ?refs=bukhari:1,bukhari:2")

    refs = []
    invalid = []
    seen = set()

    for p in parts:
        if ":" not in p:
            invalid.append(p)
            continue

        collection, hadith_number = [x.strip() for x in p.split(":", 1)]
        if not collection or not hadith_number:
            invalid.append(p)
            continue

        ref = (collection, hadith_number)
        if ref not in seen:
            seen.add(ref)
            refs.append(ref)

    if invalid:
        abort(400, f"Invalid ref(s): {', '.join(invalid)}")

    MAX_REFS = 100
    if len(refs) > MAX_REFS:
        abort(400, f"Too many refs (max {MAX_REFS}).")

    results = Hadith.query.filter(or_(*[ref_condition(c, n) for c, n in refs])).order_by(Hadith.englishURN).all()

    data = []
    missing = []
    for collection, hadith_number in refs:
        h = ref_match(results, collection, hadith_number)
        if h is None:
            missing.append(f"{collection}:{hadith_number}")
        else:
            data.append(h.serialize(**serialize_as(collection)))

    return jsonify({"count": len(data), "missing": missing, "data": data})


@app.route("/v1/hadiths/random", methods=["GET"])
@single_resource
def api_hadiths_random():
    collection = request.args.get("collection", "riyadussalihin")
    return Hadith.query.filter_by(collection=collection).order_by(func.rand())


if __name__ == "__main__":
    app.run(host="0.0.0.0")
