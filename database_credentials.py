import configparser

def get_db_credentials():
    config = configparser.ConfigParser()
    config.read("credentials.database")
    return config['default']
