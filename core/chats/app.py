from typing import Optional

from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from chats.db import get_db, models

app = FastAPI()


@app.get("/")
def read_root(db: Session = Depends(get_db)):
    users = db.get(models.PolznakEntitiesProfile, 55)
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}


