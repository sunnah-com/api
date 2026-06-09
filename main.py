from flask import Flask, request
from api_access import APIAccess

app = Flask(__name__)
api_access = APIAccess()

@app.before_request
def before_request():
    email = request.headers.get('X-Email')
    user_data = api_access.check_access(email)
    if user_data:
        if user_data['requests_made'] < user_data['max_requests_per_day']:
            api_access.update_requests(email)
        else:
            # Handle rate limit exceeded
            return 'Rate limit exceeded', 429
    else:
        # Handle unauthorized access
        return 'Unauthorized', 401

# Rest of the API endpoints