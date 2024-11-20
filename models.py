from flask_sqlalchemy import SQLAlchemy
from main import app
from text_transform import cleanup_text, cleanup_en_text, cleanup_chapter_title, cleanup_en_chapter_title
import json


db = SQLAlchemy(app)
db.reflect()


def is_number(s):
    try:
        int(s)
        return True
    except ValueError:
        return False


class HadithCollection(db.Model):
    __tablename__ = "Collections"

    def serialize(self):
        return {
            "name": self.name,
            "hasBooks": self.includesBooks,
            "hasChapters": self.includesChapters,
            "collection": [
                {"lang": "en", "title": self.englishTitle, "shortIntro": self.shortintro},
                {"lang": "ar", "title": self.arabicTitle, "shortIntro": self.shortIntroArabic if hasattr(self, "shortIntroArabic") else self.shortintro},
            ],
            "totalHadith": self.totalhadith,
            "totalAvailableHadith": self.numhadith,
        }


class Book(db.Model):
    __tablename__ = "BookData"

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
            "bookNumber": bookNumber,
            "book": [{"lang": "en", "name": self.englishBookName}, {"lang": "ar", "name": self.arabicBookName}],
            "hadithStartNumber": self.firstNumber,
            "hadithEndNumber": self.lastNumber,
            "numberOfHadith": self.totalNumber,
        }


class Chapter(db.Model):
    __tablename__ = "ChapterData"

    def serialize(self):
        bookNumber = Book.get_number_from_id(self.arabicBookID)
        return {
            "bookNumber": bookNumber,
            "chapterId": str(self.babID),
            "chapter": [
                {
                    "lang": "en",
                    "chapterNumber": str(self.englishBabNumber),
                    "chapterTitle": cleanup_en_chapter_title(self.englishBabName),
                    "intro": cleanup_en_text(self.englishIntro),
                    "ending": cleanup_en_text(self.englishEnding),
                },
                {
                    "lang": "ar",
                    "chapterNumber": str(self.arabicBabNumber),
                    "chapterTitle": cleanup_chapter_title(self.arabicBabName),
                    "intro": cleanup_text(self.arabicIntro),
                    "ending": cleanup_text(self.arabicEnding),
                },
            ],
        }


class Hadith(db.Model):
    __tablename__ = "HadithTable"

    rel_collection = db.relationship(
        "HadithCollection", primaryjoin="Hadith.collection == HadithCollection.name", foreign_keys="Hadith.collection", lazy="joined"
    )

    def get_grade(self, field_name):
        grade_val = getattr(self, field_name)
        if not grade_val:
            return []

        # If the field has a json value, return it
        # Otherwise build same data structure from individual string fields
        try:
            vals = json.loads(grade_val)
            return [dict((k, x[k]) for k in ("graded_by", "grade")) for x in vals]
        except ValueError:
            return [{"graded_by": getattr(self.rel_collection, field_name), "grade": grade_val}]

    def serialize(self):
        grades = {"en": self.get_grade("englishgrade1"), "ar": self.get_grade("arabicgrade1")}

        return {
            "collection": self.collection,
            "bookNumber": self.bookNumber,
            "chapterId": str(self.babID),
            "hadithNumber": self.hadithNumber,
            "hadith": [
                {
                    "lang": "en",
                    "chapterNumber": self.englishBabNumber,
                    "chapterTitle": cleanup_en_chapter_title(self.englishBabName),
                    "urn": self.englishURN,
                    "body": cleanup_en_text(self.englishText),
                    "grades": grades["en"],
                },
                {
                    "lang": "ar",
                    "chapterNumber": self.arabicBabNumber,
                    "chapterTitle": cleanup_chapter_title(self.arabicBabName),
                    "urn": self.arabicURN,
                    "body": cleanup_text(self.arabicText),
                    "grades": grades["ar"],
                },
            ],
        }
