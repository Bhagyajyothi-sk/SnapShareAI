from fastapi import APIRouter
from backend.database import db

router = APIRouter(
    prefix="/dashboard",
    tags=["Dashboard"]
)

contacts_collection = db["contacts"]
delivery_logs_collection = db["delivery_logs"]


@router.get("/stats")
def get_dashboard_stats():

    total_contacts = contacts_collection.count_documents({})

    total_scans = delivery_logs_collection.count_documents({})

    logs = list(
        delivery_logs_collection.find({})
    )

    total_matches = 0

    for log in logs:

        matched_people = log.get(
            "matched_people",
            []
        )

        total_matches += len(
            matched_people
        )

    return {
        "total_contacts": total_contacts,
        "total_scans": total_scans,
        "total_matches": total_matches
    }