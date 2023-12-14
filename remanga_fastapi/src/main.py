from fastapi import Depends, FastAPI
from fastapi.staticfiles import StaticFiles

from catalog.router import router as catalog_router
from title.router import router as title_router
from auth.router import router as auth_router

app = FastAPI()

app.mount("/static", StaticFiles(directory="static"), name="static")
app.mount("/media", StaticFiles(directory="media"), name="media")

app.include_router(catalog_router)
app.include_router(title_router)
app.include_router(auth_router)