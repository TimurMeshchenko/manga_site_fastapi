from sqlalchemy import Column, ForeignKey, Integer, String, BigInteger, Float, Table, TIMESTAMP, Boolean
from sqlalchemy.orm import relationship

from database import Base

user_bookmarks = Table('user_bookmarks', Base.metadata,
    Column('id', BigInteger, primary_key=True),                             
    Column('user_id', BigInteger, ForeignKey('user.id')),
    Column('title_id', BigInteger, ForeignKey('remanga_title.id'))
)

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

    bookmarks = relationship('Title', secondary=user_bookmarks, backref='user')