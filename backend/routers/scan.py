from fastapi import APIRouter, UploadFile, File

import shutil

from backend.database import db

from backend.services.face_service import (
    get_faces_from_image,
    compare_faces
)

from backend.services.email_service import (
    send_photo_email
)

router = APIRouter(
    prefix="/scan",
    tags=["Scan"]
)

contacts_collection = db["contacts"]

delivery_logs_collection = db[
    "delivery_logs"
]


@router.post("/")
def scan_group_photo(
    file: UploadFile = File(...)
):

    file_path = (
        f"backend/uploads/{file.filename}"
    )

    # Save uploaded group image
    with open(file_path, "wb") as buffer:

        shutil.copyfileobj(
            file.file,
            buffer
        )

    # Detect all faces
    faces = get_faces_from_image(
        file_path
    )

    matched_contacts = []

    # Get all contacts
    contacts = list(
        contacts_collection.find({})
    )

    # Compare detected faces
    for detected_face in faces:

        for contact in contacts:

            if (
                "face_encoding"
                not in contact
            ):
                continue

            is_match = compare_faces(
                contact["face_encoding"],
                detected_face
            )

            if is_match:

                already_added = any(

                    existing["email"]
                    == contact["email"]

                    for existing
                    in matched_contacts
                )

                if not already_added:

                    matched_contacts.append(
                        {
                            "name":
                                contact["name"],

                            "email":
                                contact["email"]
                        }
                    )

                    # Send automatic email
                    send_photo_email(

                        receiver_email=
                            contact["email"],

                        contact_name=
                            contact["name"],

                        image_path=
                            file_path
                    )

    # Save delivery log
    delivery_log = {

        "filename":
            file.filename,

        "matched_people": [

            person["name"]

            for person
            in matched_contacts
        ],

        "total_faces_detected":
            len(faces)
    }

    delivery_logs_collection.insert_one(
        delivery_log
    )

    return {

        "message":
            "Group photo scanned successfully",

        "filename":
            file.filename,

        "faces_detected":
            len(faces),

        "matched_contacts":
            matched_contacts,

        "emails_sent":
            len(matched_contacts)
    }