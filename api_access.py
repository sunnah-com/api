class APIAccess:
    def __init__(self):
        self.users = self.load_users()

    def load_users(self):
        users = {}
        with open('users.txt', 'r') as f:
            for line in f:
                username, email, max_requests_per_second, max_requests_per_day, languages = line.strip().split(':')
                users[email] = {
                    'max_requests_per_second': int(max_requests_per_second),
                    'max_requests_per_day': int(max_requests_per_day),
                    'languages': languages.split(','),
                    'requests_made': 0
                }
        return users

    def check_access(self, email):
        if email in self.users:
            return self.users[email]
        return None

    def update_requests(self, email):
        if email in self.users:
            self.users[email]['requests_made'] += 1
            if self.users[email]['requests_made'] > self.users[email]['max_requests_per_day']:
                # Handle rate limit exceeded
                pass
        else:
            # Handle unauthorized access
            pass