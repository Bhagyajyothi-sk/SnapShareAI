from fastapi import APIRouter
from backend.database import db

router = APIRouter(
    prefix="/delivery",
    tags=["Delivery"]
)

delivery_logs_collection = db["delivery_logs"]


@router.get("/logs")
def get_delivery_logs():

    logs = list(
        delivery_logs_collection.find({})
    )

    for log in logs:
        log["_id"] = str(log["_id"])

    return {
        "delivery_logs": logs
    }