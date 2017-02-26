from .rds_config import *
from .db import MySQLDatabaseConnection
from peewee import Model, CharField, IntegerField, TextField

class MySQLModel(Model):
    class Meta:
        database = MySQLDatabaseConnection(DB_NAME, DB_HOST, DB_PORT, DB_USER, DB_PASS)


class CollectionsDAO(MySQLModel):
    collectionID = IntegerField(unique=True, primary_key=True)
    name = CharField(unique=True)
    type = CharField()
    englishTitle = CharField()
    arabicTitle = CharField()
    hasVolumes = CharField()
    hasBooks = CharField()
    hasChapters = CharField()
    numHadith = IntegerField()
    totalHadith = IntegerField(null=True)
    englishGrade1 = CharField(null=True)
    arabicGrade1 = CharField()
    annotation = CharField(null=True)
    shortIntro = TextField()
    about = TextField()
    status = CharField()
    numberingInfoDesc = TextField()

    class Meta:
        db_table = 'Collections'
