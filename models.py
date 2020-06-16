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

    def serialize(self):
        # Logic for dealing with non-straightforward ourBookIDs
        bookNumber = str(self.ourBookID)
        if self.ourBookID == -1:
            bookNumber = "introduction"
        elif self.ourBookID = -35:
            bookNumber = "35b"

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


class Hadith(db.Model):
    __tablename__ = 'HadithTable'

    def serialize(self):
        return {
            'collection': self.collection,
            'bookNumber': self.bookNumber,
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
            ],
        }
