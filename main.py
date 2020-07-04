import functools
from flask import Flask, jsonify, request, abort
from sqlalchemy import func
from werkzeug.exceptions import HTTPException


app = Flask(__name__)
app.config.from_object("config.Config")

from models import HadithCollection, Book, Chapter, Hadith


@app.before_request
def verify_secret():
    if not app.debug and request.headers.get("x-aws-secret") != app.config["AWS_SECRET"]:
        abort(401)


@app.errorhandler(HTTPException)
def jsonify_http_error(error):
    response = {"error": {"details": error.description, "code": error.code}}

    return jsonify(response), error.code


def paginate_results(f):
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
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
    @functools.wraps(f)
    def decorated_function(*args, **kwargs):
        result = f(*args, **kwargs).first_or_404()
        result = result.serialize()
        return jsonify(result)

    return decorated_function


@app.route("/", methods=["GET"])
def home():
    return "<h1>Welcome to sunnah.com API.</h1>"


@app.route("/v1/collections", methods=["GET"])
@paginate_results
def api_collections():
    return HadithCollection.query.order_by(HadithCollection.collectionID)


@app.route("/v1/collections/<string:name>", methods=["GET"])
@single_resource
def api_collection(name):
    return HadithCollection.query.filter_by(name=name)


@app.route("/v1/collections/<string:name>/books", methods=["GET"])
@paginate_results
def api_collection_books(name):
    return Book.query.filter_by(collection=name).order_by(func.abs(Book.ourBookID))


@app.route("/v1/collections/<string:name>/books/<string:bookNumber>", methods=["GET"])
@single_resource
def api_collection_book(name, bookNumber):
    book_id = Book.get_id_from_number(bookNumber)
    return Book.query.filter_by(collection=name, ourBookID=book_id)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/hadiths", methods=["GET"])
@paginate_results
def api_collection_book_hadiths(collection_name, bookNumber):
    return Hadith.query.filter_by(collection=collection_name, bookNumber=bookNumber).order_by(Hadith.englishURN)


@app.route("/v1/collections/<string:collection_name>/hadiths/<string:hadithNumber>", methods=["GET"])
@single_resource
def api_collection_hadith(collection_name, hadithNumber):
    return Hadith.query.filter_by(collection=collection_name, hadithNumber=hadithNumber)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters", methods=["GET"])
@paginate_results
def api_collection_book_chapters(collection_name, bookNumber):
    book_id = Book.get_id_from_number(bookNumber)
    return Chapter.query.filter_by(collection=collection_name, arabicBookID=book_id).order_by(Chapter.babID)


@app.route("/v1/collections/<string:collection_name>/books/<string:bookNumber>/chapters/<float:chapterId>", methods=["GET"])
@single_resource
def api_collection_book_chapter(collection_name, bookNumber, chapterId):
    book_id = Book.get_id_from_number(bookNumber)
    return Chapter.query.filter_by(collection=collection_name, arabicBookID=book_id, babID=chapterId)


@app.route("/v1/hadiths/random", methods=["GET"])
@single_resource
def api_hadiths_random():
    # TODO Make this configurable instead of hardcoding
    return Hadith.query.filter_by(collection="riyadussaliheen").order_by(func.rand())


if __name__ == "__main__":
    app.run(host="0.0.0.0")
