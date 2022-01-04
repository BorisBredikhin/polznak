from typing import Optional

from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session

from chats.db import get_db, models
from starlette.websockets import WebSocket

app = FastAPI()


@app.get("/")
def read_root(db: Session = Depends(get_db)):
    users = db.get(models.PolznakEntitiesProfile, 55)
    return {"Hello": "World"}


@app.websocket("/ws")
async def websocket_endpoint(webscket: WebSocket):
    await webscket.accept()
