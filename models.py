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
            'has_books': self.hasbooks == "yes",
            'has_chapters': self.haschapters == "yes",
            'collection': [
                {
                    'lang': 'en',
                    'title': self.englishTitle,
                    'short_intro': self.shortintro,
                },
                {
                    'lang': 'ar',
                    'title': self.arabicTitle,
                    'short_intro': self['shortIntroArabic'] if hasattr(self, 'shortIntroArabic') else self.shortintro,
                }
            ],
            'total_hadith': self.totalhadith,
            'total_available_hadith': self.numhadith,
        }


class Book(db.Model):
    __tablename__ = 'BookData'

    def serialize(self):
        return {
            'book_id': self.ourBookID,
            'book': [
                {
                    'lang': 'en',
                    'name': self.englishBookName,
                },
                {
                    'lang': 'ar',
                    'name': self.arabicBookName,
                }
            ],
            'hadith_start_number': self.firstNumber,
            'hadith_end_number': self.lastNumber,
            'number_of_hadith': self.totalNumber
        }


class Hadith(db.Model):
    __tablename__ = 'HadithTable'

    def serialize(self):
        return {
            'collection': self.collection,
            'book_id': self.bookID,
            'bab_number': str(self.babNumber),
            'hadith_number': self.hadithNumber,
            'hadith': [
                {
                    'lang': 'en',
                    'chapter_name': self.englishBabName,
                    'urn': self.englishURN,
                    'text': cleanup_en_text(self.englishText),
                    'grade': self.englishgrade1,
                },
                {
                    'lang': 'ar',
                    'chapter_name': self.arabicBabName,
                    'urn': self.arabicURN,
                    'text': cleanup_text(self.arabicText),
                    'grade': self.arabicgrade1,
                }
            ],
        }
