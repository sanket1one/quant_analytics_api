from pydantic import BaseModel
from typing import List, Optional


class EventSchema(BaseModel):
    id: int
    page: Optional[str] = ""

class EventListSchema(BaseModel):
    results: List[EventSchema]
    count: int

class EventCreateSchema(BaseModel):
    path: str

class EventUpdateSchema(BaseModel):
    description: str