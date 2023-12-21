from sqlalchemy import Column, ForeignKey, Integer, String, BigInteger, Float, Table, Text, TIMESTAMP, Boolean
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

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

class Genres(Base):
    __tablename__ = 'remanga_genres'

    id = Column(BigInteger, primary_key=True)
    name = Column(String(100), default='')

class Categories(Base):
    __tablename__ = 'remanga_categories'

    id = Column(BigInteger, primary_key=True)
    name = Column(String(100), default='')

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
    chapters = relationship('Title_chapters', back_populates="title")
    comments = relationship('Comment', back_populates='title')


class Title_chapters(Base):
    __tablename__ = 'remanga_title_chapters'

    id = Column(BigInteger, primary_key=True)
    title_id = Column(BigInteger, ForeignKey('remanga_title.id'))
    chapter = Column(Integer, default=0)
    tome = Column(Integer, default=0)

    title = relationship('Title', back_populates='chapters')

class Title_rating(Base):
    __tablename__ = 'remanga_title_rating'

    id = Column(Integer, primary_key=True)
    user_id = Column(BigInteger, ForeignKey('user.id'))
    title_id = Column(BigInteger, ForeignKey('remanga_title.id'))
    rating = Column(Integer)

    user = relationship('User', backref='remanga_title_rating')
    title = relationship('Title', backref="remanga_title_rating")

class Comment(Base):
    __tablename__ = 'remanga_comment'

    id = Column(Integer, primary_key=True)
    author_id = Column(BigInteger, ForeignKey('user.id'))
    title_id = Column(BigInteger, ForeignKey('remanga_title.id'))
    content = Column(Text)
    created_at = Column(TIMESTAMP(timezone=True), default=func.now())
    likes = Column(Integer, default=0)

    author = relationship('User', backref='remanga_comment')
    title = relationship('Title', back_populates='comments')

class Comment_rating(Base):
    __tablename__ = 'remanga_comment_rating'

    id = Column(Integer, primary_key=True)
    user_id = Column(BigInteger, ForeignKey('user.id'))
    title_id = Column(BigInteger, ForeignKey('remanga_title.id'))
    comment_id = Column(BigInteger, ForeignKey('remanga_comment.id'))
    is_liked = Column(Boolean)

    user = relationship('User', backref='remanga_comment_rating')
    title = relationship('Title', backref='remanga_comment_rating')
    comment = relationship('Comment', backref='remanga_comment_rating')    