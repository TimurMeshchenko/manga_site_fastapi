from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware

from catalog.router import router as catalog_router
from title.router import router as title_router
from auth.router import router as auth_router
from profile.router import router as profile_router
from bookmarks.router import router as bookmarks_router
from search.router import router as search_router

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")
app.mount("/media", StaticFiles(directory="media"), name="media")

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
