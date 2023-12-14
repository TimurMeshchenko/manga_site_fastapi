from sqlalchemy import Column, ForeignKey, Integer, String, BigInteger, Float, Table, desc
from sqlalchemy.orm import relationship

from database import Base

remanga_title_categories = Table('remanga_title_categories', Base.metadata,
    Column('id', BigInteger, primary_key=True),
    Column('title_id', BigInteger, ForeignKey('remanga_title.id')),
    Column('categories_id', BigInteger, ForeignKey('remanga_categories.id'))
)

remanga_title_genres = Table('remanga_title_genres', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('title_id', BigInteger, ForeignKey('remanga_title.id')),
    Column('genres_id', BigInteger, ForeignKey('remanga_genres.id'))
)

remanga_title_chapters = Table('remanga_title_chapters', Base.metadata,
    Column('id', BigInteger, primary_key=True),                               
    Column('title_id', BigInteger, ForeignKey('remanga_title.id')),
    Column('chapters_id', BigInteger, ForeignKey('remanga_chapters.id'))
)

# remanga_title_comments = Table('remanga_title_comments', Base.metadata,
#     Column('title_id', BigInteger, ForeignKey('remanga_title.id')),
#     Column('comment_id', BigInteger, ForeignKey('remanga_comment.id'))
# )

class Genres(Base):
    __tablename__ = 'remanga_genres'

    id = Column(BigInteger, primary_key=True)
    name = Column(String(100), default='')

class Categories(Base):
    __tablename__ = 'remanga_categories'

    id = Column(BigInteger, primary_key=True)
    name = Column(String(100), default='')

class Chapters(Base):
    __tablename__ = 'remanga_chapters'

    id = Column(BigInteger, primary_key=True)
    chapter = Column(Integer, default=0)
    tome = Column(Integer, default=0)

class Title(Base):
    __tablename__ = 'remanga_title'

    id = Column(BigInteger, primary_key=True)
    rus_name = Column(String(100), default='')
    dir_name = Column(String(100), default='')
    img_url = Column(String(100), default='')
    manga_type = Column(String(100), default='')
    avg_rating = Column(Float, default=0.0)
    count_rating = Column(Integer, default=0)
    issue_year = Column(Integer, default=0)
    count_bookmarks = Column(Integer, default=0)
    count_chapters = Column(Integer, default=0)
    description = Column(String(1500), default='')

    categories = relationship('Categories', secondary=remanga_title_categories, backref='remanga_title')
    genres = relationship('Genres', secondary=remanga_title_genres, backref='remanga_title')
    chapters = relationship('Chapters', secondary=remanga_title_chapters, backref='remanga_title')
    # comments = relationship('Comment', secondary=remanga_title_comments, backref='remanga_title')