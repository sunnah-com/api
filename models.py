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

    id_number_map = {-1: "introduction", -35: "35b"}

    def serialize(self):
        # Logic for dealing with non-straightforward ourBookIDs
        bookNumber = self.id_number_map.get(self.ourBookID, str(self.ourBookID))
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
        return {
            'chapterNumber': str(self.babID),
            'chapter': [
                {
                    'lang': 'ar',
                    'bookId': str(self.arabicBookID),
                    'chapterNumber': str(self.arabicBabNumber),
                    'chapterTitle': self.arabicBabName,
                    'intro': self.arabicIntro,
                    'ending': self.arabicEnding
                },
                {
                    'lang': 'en',
                    'bookId': str(self.englishBookID),
                    'chapterNumber': str(self.englishBabNumber),
                    'chapterTitle': self.englishBabName,
                    'intro': self.englishIntro,
                    'ending': self.englishEnding
                }
            ]
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
