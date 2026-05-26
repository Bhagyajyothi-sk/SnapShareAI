from pydantic import BaseModel, EmailStr
from typing import Optional

class ContactCreate(BaseModel):
    name: str
    email: EmailStr
    phone: str

class FaceUploadResponse(BaseModel):
    message: str
    filename: str
    contact_id: str