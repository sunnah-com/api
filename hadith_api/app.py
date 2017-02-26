from chalice import Chalice
from chalicelib.collections import get_collections

app = Chalice(app_name='hadith_api')

@app.route('/collections')
def index():
    return get_collections()
