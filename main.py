from flask import Flask, jsonify
from flask_swagger import swagger

app = Flask(__name__)
app.config.from_object('config.Config')

from models import db, HadithCollection, Book, Hadith

@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to sunnah.com API.</p>"

@app.route("/v1/spec")
def spec():
    swag = swagger(app)
    swag['info']['version'] = "1.0"
    swag['info']['title'] = "Sunnah.com API"
    return jsonify(swag)

@app.route('/v1/collections', methods=['GET'])
def api_collections():
    queryset = HadithCollection.query.order_by(HadithCollection.collectionID).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

@app.route('/v1/collections/<string:collection_name>', methods=['GET'])
def api_collection(collection_name):
    """
        Get collection by name
        ---
        definitions:
          - schema:
              id: Collection
              properties:
                name:
                 type: string
                 description: the Collection's name
        parameters:
           - name: name
             in: path
             description: name of collection
             required: true
             type: string
        responses:
          200:
            description: A collection
            schema:
              $ref: "#/definitions/Collection"
        """
    collection = HadithCollection.query.filter_by(name=collection_name).first_or_404()
    return jsonify(collection.serialize())

@app.route('/v1/collections/<string:collection_name>/books', methods=['GET'])
def api_collection_books(collection_name):
    queryset = Book.query.filter_by(collection=collection_name).order_by(Book.ourBookID).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

@app.route('/v1/collections/<string:collection_name>/books/<int:book_id>', methods=['GET'])
def api_collection_book(collection_name, book_id):
    book = Book.query.filter_by(collection=collection_name, ourBookID=book_id).first_or_404()
    return jsonify(book.serialize())

@app.route('/v1/collections/<string:collection_name>/books/<int:book_id>/hadiths', methods=['GET'])
def api_collection_book_hadiths(collection_name, book_id):
    queryset = Hadith.query.filter_by(collection=collection_name, bookID=book_id).order_by(Hadith.arabicURN).all()
    results = [x.serialize() for x in queryset]
    return jsonify(results)

if __name__ == '__main__':
    app.run(host='0.0.0.0')
