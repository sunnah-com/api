from flask_sqlalchemy import SQLAlchemy
from main import app
from text_transform import cleanup_text, cleanup_en_text

db = SQLAlchemy(app)
db.reflect()

class HadithCollection(db.Model):
    __tablename__ = 'Collections'

    def serialize(self):
        return {
            'name': self.name,
            'short_intro': self.shortintro,
            'has_books': self.hasbooks == "yes",
            'has_chapters': self.haschapters == "yes",
            'title_en': self.englishTitle,
            'title_ar': self.arabicTitle,
            'total_hadith': self.totalhadith,
            'numhadith': self.numhadith,
        }

class Book(db.Model):
    __tablename__ = 'BookData'

    def serialize(self):
        return {
            'book_id': self.ourBookID,
            'name_en': self.englishBookName,
            'name_ar': self.arabicBookName,
            'first_hadith_number': self.firstNumber,
            'last_hadith_number': self.lastNumber,
            'total_hadith_number': self.totalNumber
        }

class Hadith(db.Model):
    __tablename__ = 'HadithTable'

    def serialize(self):
        return {
            'collection': self.collection,
            'book_id': self.bookID,
            'bab_number': str(self.babNumber),
            'bab_name_en': self.englishBabName,
            'bab_name_ar': self.arabicBabName,
            'hadith_number': self.hadithNumber,
            'urn_ar': self.arabicURN,
            'text_en': cleanup_en_text(self.englishText),
            'text_ar': cleanup_text(self.arabicText),
            'grade_ar': self.arabicgrade1,
            'grade_en': self.englishgrade1,
        }
