from .models import CollectionsDAO
from .responder import HandleResponse

@HandleResponse
def get_collections(*args, **kwargs):
    return [x._data for x in CollectionsDAO.select()]
