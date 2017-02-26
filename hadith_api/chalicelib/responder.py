from json import dumps
from functools import wraps

def HandleResponse(func):
    @wraps(func)
    def wrapped(*args, **kwargs):
        payload = {}
        payload.setdefault('status', 'success')
        payload.setdefault('message', '')
        payload.setdefault('content', {})
        try:
            payload['content'] = func(*args, **kwargs)
        except Exception as e:
            payload['status'] = 'failed'
            payload['message'] = repr(e)
        finally:
            response = dumps(payload)
        return response
    return wrapped
