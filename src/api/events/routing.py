from fastapi import APIRouter
from .schemas import EventSchema, EventListSchema, EventCreateSchema, EventUpdateSchema

router = APIRouter()

#/api/events
@router.get("/")
def read_events() -> EventListSchema:
    return {
        "results": [{"id": 1}, {"id": 2}, {"id": 3}],
        "count":3
    }

@router.post("/")
def create_event(payload:EventCreateSchema) -> EventSchema:
    print(payload)
    return {
        "id":123
    }

@router.get("/{event_id}")
def get_event(event_id: int) -> EventSchema:
    return {"id": event_id}


@router.put("/{event_id}")
def update_event(event_id: int, payload:EventUpdateSchema) -> EventSchema:
    print(payload)
    data = payload.model_dump()
    return {"id": event_id, **data}