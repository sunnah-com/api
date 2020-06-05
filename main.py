from flask import Flask, jsonify
from models import db, HadithCollection

app = Flask(__name__)
app.config.from_object('config.Config')
db.init_app(app)

hadiths = [
    {'id': 1,
     'collection_id': 1,
     'collection': 'Sahih al-Bukhari',
     'book_id': 1,
     'book': 'Revelation',
     'chapter_id': 1,
     'chapter': 'How the Divine Revelation started being revealed to Allah\'s Messenger',
     'text': 'I heard Allah\'s Messenger (ﷺ) saying, "The reward of deeds depends upon the intentions and every person will get the reward according to what he has intended. So whoever emigrated for worldly benefits or for a woman to marry, his emigration was for what he emigrated for."'}
]

@app.route('/', methods=['GET'])
def home():
    return "<h1>Welcome to sunnah.com API.</p>"

@app.route('/v1/collections', methods=['GET'])
def api_collections():
    queryset = HadithCollection.query.all()
    collections = [x.serialize() for x in queryset]
    return jsonify(collections)

@app.route('/v1/collections/<int:collection_id>', methods=['GET'])
def api_collection(collection_id):
    collection = HadithCollection.query.get_or_404(collection_id)
    return jsonify(collection.serialize())

@app.route('/v1/collections/<int:collection_id>/books/<int:book_id>/hadiths', methods=['GET'])
def api_hadiths(collection_id, book_id):
    result = [hadith for hadith in hadiths if hadith['collection_id'] == collection_id and hadith['book_id'] == book_id]
    return jsonify(result)


if __name__ == '__main__':
    app.run(host='0.0.0.0')
