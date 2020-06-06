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

@app.route('/v1/collections/<string:name>', methods=['GET'])
def api_collection(name):
    collection = HadithCollection.query.filter_by(name=name).first_or_404()
    return jsonify(collection.serialize())

@app.route('/v1/collections/<string:name>/books', methods=['GET'])
def api_collection_books(name):
    queryset = Book.query.filter_by(collection=name).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

@app.route('/v1/collections/<string:collection_name>/books/<int:book_id>/hadiths', methods=['GET'])
def api_hadiths(collection_name, book_id):
    queryset = Hadith.query.filter_by(collection=collection_name, bookID=book_id).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
