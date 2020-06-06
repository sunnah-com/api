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

class Book(db.Model):
    __tablename__ = 'BookData'

    def serialize(self):
        return {
            'collection': self.collection,
            'book_id': self.ourBookID,
            'book_id_en': str(self.englishBookID),
            'book_number_en': self.englishBookNumber,
            'book_name_en': self.englishBookName,
            'book_id_ar': str(self.arabicBookID),
            'book_number_ar': self.arabicBookNumber,
            'book_name_ar': self.arabicBookName,
            'first_number': self.firstNumber,
            'last_number': self.lastNumber,
            'total_number': self.totalNumber
        }

class Hadith(db.Model):
    __tablename__ = 'HadithTable'

    def serialize(self):
        return {
            'collection': self.collection,
            'book_id': self.bookID,
            'bab_number': str(self.babNumber),
            'hadith_number': self.hadithNumber,
            'our_hadith_number': self.ourHadithNumber,
            'urn_en': self.englishURN,
            'bab_name_en': self.englishBabName,
            'text_en': self.englishText,
            'urn_ar': self.arabicURN,
            'bab_name_ar': self.arabicBabName,
            'text_ar': self.arabicText,
            'xrefs': self.xrefs
        }
