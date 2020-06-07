from flask import Flask, jsonify

app = Flask(__name__)
app.config.from_object('config.Config')

from models import db, HadithCollection, Book, Hadith

@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to sunnah.com API.</p>"

@app.route('/v1/collections', methods=['GET'])
def api_collections():
    queryset = HadithCollection.query.all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

@app.route('/v1/collections/<string:collection_name>', methods=['GET'])
def api_collection(collection_name):
    collection = HadithCollection.query.filter_by(name=collection_name).first_or_404()
    return jsonify(collection.serialize())

@app.route('/v1/collections/<string:collection_name>/books', methods=['GET'])
def api_collection_books(collection_name):
    queryset = Book.query.filter_by(collection=collection_name).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

@app.route('/v1/collections/<string:collection_name>/books/<int:book_id>', methods=['GET'])
def api_collection_book(collection_name, book_id):
    book = Book.query.filter_by(collection=collection_name, ourBookID=book_id).first_or_404()
    return jsonify(book.serialize())

@app.route('/v1/collections/<string:collection_name>/books/<int:book_id>/hadiths', methods=['GET'])
def api_hadiths(collection_name, book_id):
    queryset = Hadith.query.filter_by(collection=collection_name, bookID=book_id).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
