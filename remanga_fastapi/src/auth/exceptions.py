from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

def invalid_user_data():
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Incorrect username or password",
    )

def username_taken():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Username is taken'
    )

def different_passwords():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Passwords didn’t match'
    )

def invalid_email():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Invalid email'
    )

def invalid_username():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Invalid username. </br>\
            Username must be 3-20 characters long </br>\
            and matches (a-z, A-Z, 0-9) or _'
    )

def invalid_password():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Invalid password. </br>\
            Password must be minimum 6 characters long </br>\
            and matches (a-z, A-Z, 0-9, _@$!%*?&-)'
    )

def empty_username():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST,
        detail='Empty username'
    )   

def invalid_csrf_token():
    return JSONResponse(
        status_code=status.HTTP_403_FORBIDDEN,
        content={"detail": "CSRF token missing"}
    )

def invalid_token():
    raise HTTPException(
        status_code=status.HTTP_400_BAD_REQUEST, 
        detail="Invalid token"
    )

def email_not_exists():
    raise HTTPException(
        status_code=status.HTTP_404_NOT_FOUND, 
        detail="There is no user with this email."
    )
