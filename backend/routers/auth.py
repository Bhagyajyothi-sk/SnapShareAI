from fastapi import APIRouter
from backend.models.user import UserRegister, UserLogin
from backend.services.auth_service import hash_password, verify_password
from backend.database import db

router = APIRouter(
    prefix="/auth",
    tags=["Authentication"]
)

users_collection = db["users"]

@router.get("/")
def auth_home():
    return {
        "message": "Auth Router Working"
    }

@router.post("/register")
def register_user(user: UserRegister):

    hashed_password = hash_password(user.password)

    user_data = {
        "name": user.name,
        "email": user.email,
        "password": hashed_password
    }

    users_collection.insert_one(user_data)

    return {
        "message": "User registered successfully",
        "user": {
            "name": user.name,
            "email": user.email
        }
    }
    
@router.post("/login")
def login_user(user: UserLogin):

    existing_user = users_collection.find_one({
        "email": user.email
    })

    if not existing_user:
        return {
            "message": "User not found"
        }

    password_correct = verify_password(
        user.password,
        existing_user["password"]
    )

    if not password_correct:
        return {
            "message": "Invalid password"
        }

    return {
        "message": "Login successful",
        "user": {
            "name": existing_user["name"],
            "email": existing_user["email"]
        }
    }