import os
from dotenv import load_dotenv

load_dotenv(".env.local")


class Config(object):
    JSON_SORT_KEYS = False
    AWS_SECRET = "{AWS_SECRET}".format(**os.environ)
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://{MYSQL_USER}:{MYSQL_PASSWORD}@{MYSQL_HOST}/{MYSQL_DATABASE}".format(**os.environ)
