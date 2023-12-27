from datetime import datetime, timezone
from fastapi import WebSocket
from sqlalchemy import Column
from sqlalchemy.orm import Session
from fastapi.templating import Jinja2Templates
from typing import Any, Dict, Optional, Union

from .models import Title, Title_rating, Comment, Comment_rating
from auth.utils import generate_csrf_token
from auth.schemas import User
from auth.models import User as User_model

def timesince(value: datetime) -> str:
    """
    Jinja2 filter that returns string representing time since 
    given datetime in natural language.
    """

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
    
def register_filters(templates: Jinja2Templates) -> None:
    """
    register Jinja2 filters 
    """
    templates.env.filters['timesince'] = timesince

def get_title_rating(db: Session, user_id: int, title_id: int) -> Optional[Title_rating]:
    return db.query(Title_rating).filter(Title_rating.user_id == user_id, Title_rating.title_id == title_id).first()

def get_user_title_comments_ratings_dict(db: Session, user_id: int, title_id: int) -> dict:
    """
    Get user-rated comments for a title in a dictionary to get a comment in O(1) in template
    """    
    
    comments_ratings = dict()
    
    user_title_comments_ratings = db.query(Comment_rating) \
    .filter(Comment_rating.user_id == user_id, 
            Comment_rating.title_id == title_id).all()

    for comment_rating in user_title_comments_ratings:
        comments_ratings[comment_rating.comment_id] = comment_rating.is_liked

    return comments_ratings

def get_title_by_id(db: Session, title_id: int) -> Optional[Title]:
    return db.query(Title).filter(Title.id == title_id).first()

async def set_and_send_websockets_csrf_token(websocket: WebSocket) -> None:
    websockets_csrf_token = generate_csrf_token()
    websocket.cookies["websockets_csrf_token"] = websockets_csrf_token

    await websocket.send_json({"websockets_csrf_token": websockets_csrf_token})

async def is_valid_websocket_csrf(websocket: WebSocket, data: Any) -> bool:
    received_websockets_csrf_token = data['websockets_csrf_token']
    stored_websockets_csrf_token = websocket.cookies['websockets_csrf_token']

    if received_websockets_csrf_token != stored_websockets_csrf_token:
        await websocket.close()
        return False 
    
    return True   

async def handler_websockets_bookmark(db: Session, connections: dict, data: dict) -> None:
    """
    Update the title and bookmarks page for the all user sessions
    """
    user = db.query(User_model).filter(User_model.id == data["user_id"]).first()
    title = get_title_by_id(db, data["title_id"])
    is_bookmark_added = title in user.bookmarks
                
    await change_bookmark(user, title, is_bookmark_added)
        
    db.commit()

    response = {
        "type": data["type"],
        "title_rus_name": title.rus_name,
        "title_dir_name": title.dir_name,
        "title_img_url": title.img_url,
        "is_bookmark_added": not is_bookmark_added,
    }

    await one_user_broadcast(connections, response, user.id)

async def change_bookmark(user: User, title: Title, is_bookmark_added: bool) -> None:
    if is_bookmark_added: 
        user.bookmarks.remove(title)
        title.count_bookmarks -= 1
    else: 
        user.bookmarks.append(title)
        title.count_bookmarks += 1

async def one_user_broadcast(connections: dict, response: dict, user_id: int) -> None:
    for session_id in connections:
        if session_id.split("-")[0] == str(user_id):
            await connections[session_id].send_json(response) 

async def handler_websockets_comment(db: Session, connections: dict, data: dict):
    """
    Update title comments for all sessions that are on the title
    """    
    user = db.query(User_model).filter(User_model.id == data["user_id"]).first()
    title = get_title_by_id(db, data["title_id"])

    max_comment_length = 500
    comment_content = data["content"][:max_comment_length]
    comment_object = Comment(author_id=user.id, title_id=title.id, 
                                                content=comment_content)
    db.add(comment_object)
    db.commit()
                
    response = {
        "type": data["type"],
        "content": comment_content,
        "user_id": user.id,
        "user_name": user.username,
        "user_avatar": user.avatar,
        "comment_id": comment_object.id
    }                

    await title_broadcast(connections, response, title.id)

async def title_broadcast(connections: dict, response: dict, title_id: int) -> None:
    for session_id in connections:
        if session_id.split("-")[1] == str(title_id):
            await connections[session_id].send_json(response) 

def change_rating(user: User, db: Session, fetch_data: dict) -> Dict[str, Any]:
    """
    Change the rating of a title by deleting or adding a new rating
    """        
    rating_str = [letter for letter in fetch_data["title_rating"] if letter.isdigit()]
    rating = int("".join(rating_str)) 
    title = get_title_by_id(db, fetch_data["title_id"])

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

def remove_rating(user: User, title: Title, db: Session, title_rating: Title_rating) -> None:
    if not title_rating: return

    count_rating_except_current = title.count_rating - 1 if title.count_rating > 1 else 1
    title.avg_rating = (title.avg_rating * title.count_rating - title_rating.rating) / count_rating_except_current
    title.count_rating -= 1

    db.delete(title_rating)

def add_rating(user: User, title: Title, db: Session, rating: int, is_same_title_rating_exists: bool) -> None:
    if (is_same_title_rating_exists): return

    title.avg_rating = (title.avg_rating * title.count_rating + rating) / (title.count_rating + 1)
    title.count_rating += 1
    title_rating_object = Title_rating(user_id=user.id, title_id=title.id, rating=rating)

    db.add(title_rating_object)

def rating_comment(user: User, db: Session, fetch_data: dict) -> Dict[str, Any]:
    """
    Change the rating of a comment by liking or disliking
    """      
    comment_rating_str = [letter for letter in fetch_data["action"] if letter.isdigit()]
    comment_rating = int("".join(comment_rating_str)) 
    comment = db.query(Comment).filter(Comment.id == comment_rating).first()

    comment_rating_object = db.query(Comment_rating).filter(Comment_rating.user_id == user.id, 
        Comment_rating.title_id == comment.title_id, Comment_rating.comment_id == comment.id).first()    
    
    is_same_comment_rating = is_same_comment_rating_exists(comment_rating_object, fetch_data["action"])

    remove_comment_rating(db, comment, comment_rating_object)
    add_comment_rating(db, comment, fetch_data["action"], user.id, is_same_comment_rating)

    db.commit()

    response = {
        'comment_likes': comment.likes,
        'comment_rating': None if is_same_comment_rating else fetch_data["action"]
    }

    return response

def is_same_comment_rating_exists(comment_rating_object: Comment_rating, action: str) -> Union[bool, Column[bool]]:
    if comment_rating_object:
        return not comment_rating_object.is_liked if 'dislike' in action else comment_rating_object.is_liked
    
    return False

def remove_comment_rating(db: Session, comment: Comment, comment_rating_object: Comment_rating) -> None:    
    if not comment_rating_object: return
        
    if comment_rating_object.is_liked:
        comment.likes -= 1
    else:
        comment.likes += 1

    db.delete(comment_rating_object)    

def add_comment_rating(db: Session, comment: Comment, action: str, user_id: int, is_same_comment_rating: bool) -> None:
    if (is_same_comment_rating): return

    is_liked = False

    if 'dislike' in action:
        comment.likes -= 1
    else:
        comment.likes += 1
        is_liked = True   
    
    comment_rating_object = Comment_rating(user_id=user_id, title_id=comment.title_id, comment_id=comment.id, is_liked=is_liked)

    db.add(comment_rating_object)    
        
