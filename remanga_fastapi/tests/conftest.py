import pytest
from typing import AsyncGenerator
from httpx import AsyncClient
from sqlalchemy import create_engine, MetaData
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator, Any

from src.database import get_db, engine, DATABASE_URL_TEST
from src.main import app

engine_test = create_engine(DATABASE_URL_TEST)

TestingSessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine_test)

@pytest.fixture(scope="function")
def db() -> Generator[Session, Any, None]:
    try:
        db = TestingSessionLocal()
        yield db
    finally:
        db.close()

app.dependency_overrides[get_db] = db

@pytest.fixture
async def ac() -> AsyncGenerator[AsyncClient, None]:
    async with AsyncClient(app=app, base_url="http://test") as ac:
        yield ac

@pytest.fixture(autouse=True, scope='session')
def prepare_database() -> Generator[None, Any, None]:
    with engine.begin():
        metadata = MetaData()
        metadata.reflect(engine)
        metadata.create_all(bind=engine_test)
    yield
    with engine.begin():
       metadata.drop_all(bind=engine_test)