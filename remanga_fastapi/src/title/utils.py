from datetime import datetime, timezone
from fastapi import WebSocket
from sqlalchemy.orm import Session

from .models import Title, Title_rating
from auth.utils import generate_csrf_token
from auth.schemas import User

def timesince(value):
    now = datetime.now(timezone.utc)
    diff = now - value
    days = diff.days
    hours, remainder = divmod(diff.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)

    if days > 0:
        return f"{days} days ago"
    elif hours > 0:
        return f"{hours} hours ago"
    elif minutes > 0:
        return f"{minutes} minutes ago"
    else:
        return "0 minutes ago"
    
def register_filters(templates):
    templates.env.filters['timesince'] = timesince

def get_title_rating(db: Session, user_id: int, title_id: int):
    return db.query(Title_rating).filter(Title_rating.user_id == user_id, Title_rating.title_id == title_id).first()

def get_title_comments_ratings(current_user, title_id):
    for title_comments_ratings in current_user.titles_comments_ratings:
        if title_comments_ratings.title_id == title_id:
            return title_comments_ratings
        
    return None

async def set_and_send_websockets_csrf_token(websocket: WebSocket):
    websockets_csrf_token = generate_csrf_token()
    websocket.cookies["websockets_csrf_token"] = websockets_csrf_token

    await websocket.send_json({"websockets_csrf_token": websockets_csrf_token})

async def is_valid_websocket_csrf(websocket: WebSocket, data):
    received_websockets_csrf_token = data['websockets_csrf_token']
    stored_websockets_csrf_token = websocket.cookies['websockets_csrf_token']

    if received_websockets_csrf_token != stored_websockets_csrf_token:
        await websocket.close()
        return False 
    
    return True   

async def change_bookmark(user: User, title: Title, is_bookmark_added: bool):
    if is_bookmark_added: 
        user.bookmarks.remove(title)
        title.count_bookmarks -= 1
    else: 
        user.bookmarks.append(title)
        title.count_bookmarks += 1

async def title_broadcast(connections: dict, response: dict, title_id: int):
    for session_id in connections:
        if session_id.split("-")[1] == str(title_id):
            await connections[session_id].send_json(response) 

async def one_user_broadcast(connections: dict, response: dict, user_id: int):
    for session_id in connections:
        if session_id.split("-")[0] == str(user_id):
            await connections[session_id].send_json(response) 

def change_rating(user: User, db: Session, fetch_data: dict):
    rating_str = [letter for letter in fetch_data["title_rating"] if letter.isdigit()]
    rating = int("".join(rating_str)) 
        
    title = db.query(Title).filter(Title.id == fetch_data["title_id"]).first()
    title_rating = get_title_rating(db, user.id, title.id)
    is_same_title_rating_exists = title_rating.rating == rating if title_rating else False 

    remove_rating(user, title, db, title_rating)
    add_rating(user, title, db, rating, is_same_title_rating_exists)
        
    db.commit()
    
    title_rating = get_title_rating(db, user.id, title.id)

    response = {
        'avg_rating': title.avg_rating,
        'count_rating': title.count_rating,
        'title_rating': title_rating.rating if title_rating else "None"
    }

    return response

def remove_rating(user: User, title: Title, db: Session, title_rating: Title_rating):
    if not title_rating: return

    count_rating_except_current = title.count_rating - 1 if title.count_rating > 1 else 1
    title.avg_rating = (title.avg_rating * title.count_rating - title_rating.rating) / count_rating_except_current
    title.count_rating -= 1

    db.delete(title_rating)

def add_rating(user: User, title: Title, db: Session, rating: int, is_same_title_rating_exists: bool):
    if (is_same_title_rating_exists): return

    title.avg_rating = (title.avg_rating * title.count_rating + rating) / (title.count_rating + 1)
    title.count_rating += 1
    title_rating_object = Title_rating(user_id=user.id, title_id=title.id, rating=rating)

    db.add(title_rating_object)