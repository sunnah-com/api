from flask_sqlalchemy import SQLAlchemy
from main import app
from text_transform import cleanup_text, cleanup_en_text

db = SQLAlchemy(app)
db.reflect()

def is_number(s):
    try:
        int(s)
        return True
    except ValueError:
        return False


class HadithCollection(db.Model):
    __tablename__ = 'Collections'

    def serialize(self):
        return {
            'name': self.name,
            'hasBooks': self.hasbooks == "yes",
            'hasChapters': self.haschapters == "yes",
            'collection': [
                {
                    'lang': 'en',
                    'title': self.englishTitle,
                    'shortIntro': self.shortintro,
                },
                {
                    'lang': 'ar',
                    'title': self.arabicTitle,
                    'shortIntro': self.shortIntroArabic if hasattr(self, 'shortIntroArabic') else self.shortintro,
                }
            ],
            'totalHadith': self.totalhadith,
            'totalAvailableHadith': self.numhadith,
        }


class Book(db.Model):
    __tablename__ = 'BookData'

    id_number_map = {-1: "introduction", -35: "35b"}

    @staticmethod
    def get_number_from_id(book_id):
        # Logic for dealing with non-straightforward ourBookIDs
        book_number = Book.id_number_map.get(book_id, int(book_id))
        return str(book_number)

    @staticmethod
    def get_id_from_number(book_number):
        number_id_map = {v: k for k, v in Book.id_number_map.items()}

        if is_number(book_number):
            book_id = int(book_number)
        else:
            book_id = number_id_map.get(book_number)

        return str(book_id)

    def serialize(self):
        bookNumber = Book.get_number_from_id(self.ourBookID)
        return {
            'bookNumber': bookNumber,
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
            'hadithStartNumber': self.firstNumber,
            'hadithEndNumber': self.lastNumber,
            'numberOfHadith': self.totalNumber
        }


class Chapter(db.Model):
    __tablename__ = 'ChapterData'

    def serialize(self):
        bookNumber = Book.get_number_from_id(self.arabicBookID)
        return {
            'bookNumber': bookNumber,
            'chapterNumber': str(self.babID),
            'chapter': [
                {
                    'lang': 'en',
                    'chapterNumber': str(self.englishBabNumber),
                    'chapterTitle': self.englishBabName,
                    'intro': self.englishIntro,
                    'ending': self.englishEnding
                },
                {
                    'lang': 'ar',
                    'chapterNumber': str(self.arabicBabNumber),
                    'chapterTitle': self.arabicBabName,
                    'intro': self.arabicIntro,
                    'ending': self.arabicEnding
                }
            ]
        }


class Hadith(db.Model):
    __tablename__ = 'HadithTable'

    def serialize(self):
        return {
            'collection': self.collection,
            'bookNumber': self.bookNumber,
            'chapterNumber': str(self.babID),
            'hadithNumber': self.hadithNumber,
            'hadith': [
                {
                    'lang': 'en',
                    'chapterNumber': self.englishBabNumber,
                    'chapterTitle': self.englishBabName,
                    'urn': self.englishURN,
                    'body': cleanup_en_text(self.englishText),
                    'grade': self.englishgrade1,
                },
                {
                    'lang': 'ar',
                    'chapterNumber': self.arabicBabNumber,
                    'chapterTitle': self.arabicBabName,
                    'urn': self.arabicURN,
                    'body': cleanup_text(self.arabicText),
                    'grade': self.arabicgrade1,
                }
            ]
        }
