from fastapi import APIRouter, UploadFile, File
from backend.models.contact import ContactCreate, FaceUploadResponse
from backend.database import db
import shutil
from bson import ObjectId
from backend.services.face_service import generate_face_encoding

router = APIRouter(
    prefix="/contacts",
    tags=["Contacts"]
)

contacts_collection = db["contacts"]


@router.get("/")
def get_contacts():

    contacts = list(
        contacts_collection.find({})
    )

    for contact in contacts:
        contact["_id"] = str(contact["_id"])

    return {
        "contacts": contacts
    }


@router.post("/")
def create_contact(contact: ContactCreate):

    contact_data = {
        "name": contact.name,
        "email": contact.email,
        "phone": contact.phone
    }

    result = contacts_collection.insert_one(contact_data)

    contact_data["_id"] = str(result.inserted_id)

    return {
        "message": "Contact added successfully",
        "contact": contact_data
    }


@router.post("/face/{contact_id}")
def upload_face(
    contact_id: str,
    file: UploadFile = File(...)
):

    file_path = f"backend/uploads/{file.filename}"

    # Save uploaded image
    with open(file_path, "wb") as buffer:
        shutil.copyfileobj(file.file, buffer)

    # Generate face encoding
    face_encoding = generate_face_encoding(file_path)

    # Check if face detected
    if face_encoding is None:
        return {
            "error": "No face detected in image"
        }

    # Store encoding in MongoDB
    contacts_collection.update_one(
        {"_id": contact_id},
        {
            "$set": {
                "face_encoding": face_encoding,
                "face_image": file.filename
            }
        }
    )

    face_encoding = generate_face_encoding(file_path)

    contacts_collection.update_one(
        {"_id": ObjectId(contact_id)},
        {
            "$set": {
                "face_encoding": face_encoding
            }
        }
    )

    return {
        "message": "Face uploaded successfully",
        "filename": file.filename,
        "contact_id": contact_id,
        "face_encoding_saved": True
    }
    
@router.delete("/{contact_id}")
def delete_contact(contact_id: str):

    contacts_collection.delete_one(
        {"_id": ObjectId(contact_id)}
    )

    return {
        "message": "Contact deleted successfully"
    }
    
@router.put("/{contact_id}")
def update_contact(
    contact_id: str,
    contact: ContactCreate
):

    contacts_collection.update_one(
        {"_id": ObjectId(contact_id)},
        {
            "$set": {
                "name": contact.name,
                "email": contact.email,
                "phone": contact.phone
            }
        }
    )

    return {
        "message": "Contact updated successfully"
    }