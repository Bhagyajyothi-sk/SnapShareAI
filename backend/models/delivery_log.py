from pydantic import BaseModel
from typing import List


class DeliveryLog(BaseModel):

    filename: str

    matched_people: List[str]

    total_faces_detected: int