from singleton import Singleton
from peewee import MySQLDatabase


class MySQLDatabaseConnection(MySQLDatabase):
    __metaclass__ = Singleton

    def __init__(self, database, host, port, user, passwd):
        overrides = {
            'host': host,
            'port': port,
            'user': user,
            'passwd': passwd
        }
        super(MySQLDatabaseConnection, self).__init__(database, **overrides)
        self.connect()
