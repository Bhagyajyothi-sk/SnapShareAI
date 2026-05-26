import os
from dotenv import load_dotenv

load_dotenv()

MONGO_URL = os.getenv("MONGO_URL", "mongodb://localhost:27017")

DATABASE_NAME = "snapshare_ai"

JWT_SECRET = os.getenv("JWT_SECRET", "snapshare_secret_key")
JWT_ALGORITHM = "HS256"