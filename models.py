from flask_sqlalchemy import SQLAlchemy
from main import app

db = SQLAlchemy(app)
db.reflect()

class HadithCollection(db.Model):
    __tablename__ = 'Collections'

    def serialize(self):
        return {
            'id': self.collectionID,
            'name': self.name,
            'title_en': self.englishTitle,
            'title_ar': self.arabicTitle,
            'num_hadith': self.numhadith,
            'total_hadith': self.totalhadith,
            'short_intro': self.shortintro,
            'status': self.status
        }
