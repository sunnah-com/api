from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class HadithCollection(db.Model):
    __tablename__ = 'Collections'
    collectionID = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    collectiontype = db.Column('type', db.String(30), nullable=False)
    englishTitle = db.Column(db.String(200), nullable=False)
    arabicTitle = db.Column(db.String(400), nullable=False)
    hasvolumes = db.Column(db.String(3), nullable=False)
    hasbooks = db.Column(db.String(3), nullable=False)
    haschapters = db.Column(db.String(3), nullable=False, default='yes')
    numhadith = db.Column(db.Integer, nullable=False)
    totalhadith = db.Column(db.Integer)
    englishgrade1 = db.Column(db.String(100))
    arabicgrade1 = db.Column(db.String(200), nullable=False)
    annotation = db.Column(db.String(300))
    shortintro = db.Column(db.Text, nullable=False)
    about = db.Column(db.Text, nullable=False)
    status = db.Column(db.String(50), nullable=False)
    numberinginfodesc = db.Column(db.Text, nullable=False)

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
