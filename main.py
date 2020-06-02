import flask
from flask import jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

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
    return jsonify(collections())

@app.route('/v1/collections/<int:collection_id>', methods=['GET'])
def api_collection(collection_id):
    result = [collection for collection in collections() if collection['collection_id'] == collection_id ]
    return jsonify(result)

@app.route('/v1/collections/<int:collection_id>/books/<int:book_id>/hadiths', methods=['GET'])
def api_hadiths(collection_id, book_id):
    result = [hadith for hadith in hadiths if hadith['collection_id'] == collection_id and hadith['book_id'] == book_id]
    return jsonify(result)

def collections():
    return [collection(hadith) for hadith in hadiths]

def collection(hadith):
    return {'collection': hadith['collection'], 'collection_id': hadith['collection_id']}

app.run(
    host='0.0.0.0'
)
