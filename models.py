from flask_sqlalchemy import SQLAlchemy
from main import app

db = SQLAlchemy(app)
db.reflect()

class HadithCollection(db.Model):
    __tablename__ = 'Collections'

    def serialize(self):
        return {
            'name': self.name,
            'has_books': self.hasbooks,
            'title_en': self.englishTitle,
            'title_ar': self.arabicTitle,
            'num_hadith': self.numhadith,
            'total_hadith': self.totalhadith,
            'has_chapters': self.haschapters,
            'short_intro': self.shortintro,
        }

class Book(db.Model):
    __tablename__ = 'BookData'

    def serialize(self):
        return {
            'book_id': self.ourBookID,
            'book_name_en': self.englishBookName,
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
            'bab_name_en': self.englishBabName,
            'text_en': self.englishText,
            'urn_ar': self.arabicURN,
            'bab_name_ar': self.arabicBabName,
            'text_ar': self.arabicText,
            'grade_ar': self.arabicgrade1,
            'grade_en': self.englishgrade1,
        }
