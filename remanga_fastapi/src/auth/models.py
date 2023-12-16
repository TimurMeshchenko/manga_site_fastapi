from sqlalchemy import Column, ForeignKey, Integer, String, BigInteger, Float, Table, TIMESTAMP, Boolean
from sqlalchemy.orm import relationship

from database import Base

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