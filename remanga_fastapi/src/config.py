from database import SessionLocal

use_rabbitmq = True

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()