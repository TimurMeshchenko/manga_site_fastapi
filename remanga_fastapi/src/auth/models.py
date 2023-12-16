from sqlalchemy import Column, ForeignKey, Integer, String, BigInteger, Float, Table, TIMESTAMP, Boolean
from sqlalchemy.orm import relationship

from database import Base

remanga_title_comments_ratings_comments_likes = Table('remanga_title_comments_ratings_comments_likes', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('title_comments_ratings_id', BigInteger, ForeignKey('remanga_title_comments_ratings.id')),
    Column('comment_id', BigInteger, ForeignKey('remanga_comment.id'))
)

remanga_title_comments_ratings_comments_dislikes = Table('remanga_title_comments_ratings_comments_dislikes', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('title_comments_ratings_id', BigInteger, ForeignKey('remanga_title_comments_ratings.id')),
    Column('comment_id', BigInteger, ForeignKey('remanga_comment.id'))
)

user_titles = Table('user_titles', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('user_id', BigInteger, ForeignKey('user.id')),
    Column('title_id', BigInteger, ForeignKey('remanga_title.id'))
)

user_ratings = Table('user_ratings', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('user_id', BigInteger, ForeignKey('user.id')),
    Column('rating_id', BigInteger, ForeignKey('remanga_rating.id'))
)

user_titles_comments_ratings = Table('user_titles_comments_ratings', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('user_id', BigInteger, ForeignKey('user.id')),
    Column('title_comments_ratings_id', BigInteger, ForeignKey('remanga_title_comments_ratings.id'))
)

class Rating(Base):
    __tablename__ = 'remanga_rating'
   
    id = Column(BigInteger, primary_key=True)
    title_id = Column(Integer, default=0)
    rating = Column(Integer, default=0)

class Title_comments_ratings(Base):
    __tablename__ = 'remanga_title_comments_ratings'

    id = Column(BigInteger, primary_key=True)
    title_id = Column(Integer, default=0)
    comments_likes = relationship('Comment', secondary=remanga_title_comments_ratings_comments_likes, backref='comments_likes')
    comments_dislikes = relationship('Comment', secondary=remanga_title_comments_ratings_comments_dislikes, backref='comments_dislikes')

class User(Base):
    __tablename__ = 'user'

    id = Column(BigInteger, primary_key=True)
    password = Column(String(128), default='')
    last_login = Column(TIMESTAMP(timezone=True))
    is_superuser = Column(Boolean, default=False)
    username = Column(String(150), default='')
    first_name = Column(String(150), nullable=True)
    last_name = Column(String(150), nullable=True)
    email = Column(String(254), nullable=True)
    is_staff = Column(Boolean, default=False)
    is_active = Column(Boolean, default=False)
    date_joined = Column(TIMESTAMP(timezone=True))
    avatar = Column(String(100), default='')

    titles = relationship('Title', secondary=user_titles, backref='user')
    ratings = relationship('Rating', secondary=user_ratings, backref='user')
    titles_comments_ratings = relationship('Title_comments_ratings', secondary=user_titles_comments_ratings, backref='user')
