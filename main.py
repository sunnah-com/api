import functools
from flask import Flask, jsonify, request, abort
from sqlalchemy import func, or_
from werkzeug.exceptions import HTTPException

app = Flask(__name__)
app.config.from_object("config.Config")

from models import HadithCollection, Book, Chapter, Hadith


@app.before_request
def verify_secret():
    """
    Verify a flask - secret.

    Args:
    """
    if not app.debug and request.headers.get("x-aws-secret") != app.config["AWS_SECRET"]:
        abort(401)


@app.errorhandler(HTTPException)
def jsonify_http_error(error):
    """
    Return a json error message : class

    Args:
        error: (todo): write your description
    """
    response = {"error": {"details": error.description, "code": error.code}}

    return jsonify(response), error.code


def paginate_results(f):
    """
    Decorator to paginate results.

    Args:
        f: (todo): write your description
    """
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
        """
        Decorator for pagination the pagination.

        Args:
        """
        limit = int(request.args.get("limit", 50))
        page = int(request.args.get("page", 1))

        queryset = f(*args, **kwargs).paginate(page=page, per_page=limit, max_per_page=100)
        result = {
            "data": [x.serialize() for x in queryset.items],
            "total": queryset.total,
            "limit": queryset.per_page,
            "previous": queryset.prev_num,
            "next": queryset.next_num,
        }
        return jsonify(result)

    return decorated_function


def single_resource(f):
    """
    Decorator to make a single resource.

    Args:
        f: (todo): write your description
    """
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
        """
        Decorator for json - serializable function.

        Args:
        """
        result = f(*args, **kwargs).first_or_404()
        result = result.serialize()
        return jsonify(result)

    return decorated_function


@app.route("/", methods=["GET"])
def home():
    """
    Return the home directory

    Args:
    """
    return "<h1>Welcome to sunnah.com API.</h1>"


@app.route("/v1/collections", methods=["GET"])
@paginate_results
def api_collections():
    """
    Return a list of collections.

    Args:
    """
    return HadithCollection.query.order_by(HadithCollection.collectionID)


@app.route("/v1/collections/<string:name>", methods=["GET"])
@single_resource
def api_collection(name):
    """
    Return the collection collection.

    Args:
        name: (str): write your description
    """
    return HadithCollection.query.filter_by(name=name)


@app.route("/v1/collections/<string:name>/books", methods=["GET"])
@paginate_results
def api_collection_books(name):
    """
    Get collection collection collection collection collection.

    Args:
        name: (str): write your description
    """
    return Book.query.filter_by(collection=name, status=4).order_by(func.abs(Book.ourBookID))


@app.route("/v1/collections/<string:name>/books/<string:bookNumber>", methods=["GET"])
@single_resource
def api_collection_book(name, bookNumber):
    """
    Get collection collection.

    Args:
        name: (str): write your description
        bookNumber: (int): write your description
    """
    book_id = Book.get_id_from_number(bookNumber)
    return Book.query.filter_by(collection=name, status=4, ourBookID=book_id)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/hadiths", methods=["GET"])
@paginate_results
def api_collection_book_hadiths(collection_name, bookNumber):
    """
    Return a collection of collection_collection.

    Args:
        collection_name: (str): write your description
        bookNumber: (int): write your description
    """
    return Hadith.query.filter_by(collection=collection_name, bookNumber=bookNumber).order_by(Hadith.englishURN)


@app.route("/v1/collections/<string:collection_name>/hadiths/<string:hadithNumber>", methods=["GET"])
@single_resource
def api_collection_hadith(collection_name, hadithNumber):
    """
    Returns a collection collection collection.

    Args:
        collection_name: (str): write your description
        hadithNumber: (int): write your description
    """
    return Hadith.query.filter_by(collection=collection_name, hadithNumber=hadithNumber)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters", methods=["GET"])
@paginate_results
def api_collection_book_chapters(collection_name, bookNumber):
    """
    Get the book_collection for the given collection.

    Args:
        collection_name: (str): write your description
        bookNumber: (int): write your description
    """
    book_id = Book.get_id_from_number(bookNumber)
    return Chapter.query.filter_by(collection=collection_name, arabicBookID=book_id).order_by(Chapter.babID)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters/<float:chapterId>", methods=["GET"])
@single_resource
def api_collection_book_chapter(collection_name, bookNumber, chapterId):
    """
    Return a list of a given collection.

    Args:
        collection_name: (str): write your description
        bookNumber: (int): write your description
        chapterId: (todo): write your description
    """
    book_id = Book.get_id_from_number(bookNumber)
    return Chapter.query.filter_by(collection=collection_name, arabicBookID=book_id, babID=chapterId)


@app.route("/v1/hadiths/<int:urn>", methods=["GET"])
@single_resource
def api_hadith(urn):
    """
    Returns a : class : class ids.

    Args:
        urn: (str): write your description
    """
    return Hadith.query.filter(or_(Hadith.arabicURN == urn, Hadith.englishURN == urn))


@app.route("/v1/hadiths/random", methods=["GET"])
@single_resource
def api_hadiths_random():
    """
    Return a random random sequence.

    Args:
    """
    # TODO Make this configurable instead of hardcoding
    return Hadith.query.filter_by(collection="riyadussaliheen").order_by(func.rand())


if __name__ == "__main__":
    app.run(host="0.0.0.0")
