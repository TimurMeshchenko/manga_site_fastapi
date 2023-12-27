from fastapi import FastAPI, Request, Response
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager
from asyncio import get_event_loop
from typing import Generator, Any
import os

from catalog.router import router as catalog_router
from title.router import router as title_router
from auth.router import router as auth_router
from profile.router import router as profile_router
from bookmarks.router import router as bookmarks_router
from search.router import router as search_router

from auth.utils import is_valid_csrf
from auth.exceptions import invalid_csrf_token
from config import Config

@asynccontextmanager
async def lifespan(app: FastAPI) -> Generator:   
    config = Config()
    loop = get_event_loop()

    await loop.create_task(config.connect_rabbitmq())
    
    config.check_redis_connection()
    
    yield

app = FastAPI(lifespan=lifespan)
    
app.include_router(catalog_router)
app.include_router(title_router)
app.include_router(auth_router)
app.include_router(profile_router)
app.include_router(bookmarks_router)
app.include_router(search_router)

origins = [
    "http://localhost",
    "http://localhost:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

is_pytest_run = not os.path.exists("static")
path_to_src = "../src/" if is_pytest_run else ""

app.mount("/static", StaticFiles(directory=f"{path_to_src}static"), name="static")
app.mount("/media", StaticFiles(directory=f"{path_to_src}media"), name="media")

@app.middleware("http")
async def add_validate_csrf(request: Request, call_next: Any) -> Response:
    if request.method in ["POST", "PUT"]:
        if not is_valid_csrf(request):
            return invalid_csrf_token()
    
    response = await call_next(request)

    return response
