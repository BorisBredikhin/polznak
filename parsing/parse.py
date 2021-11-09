import typing
from collections import deque
from typing import Union
import json
import requests

access_token = "" # get it here: https://oauth.vk.com/authorize?client_id=7992889&redirect_uri=localhost&scope=10242&response_type=token

MAX_NOTES = 1000
START_USER = None
FILENAME = "data.json"

class CopyHistory(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    attachments: list[dict]
    post_source: dict


class NoteItem(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    copy_history: list[CopyHistory]
    can_delete: int
    can_pin: int
    can_archive: bool
    is_archived: bool
    post_source: dict
    comments: dict
    likes: dict
    reports: dict
    views: dict
    is_favorite: bool
    donut: dict
    short_text_rate: float
    hash: str

class NotesResponse(typing.TypedDict):
    count: int
    items: list[NoteItem]


class RawNotesResponse(typing.TypedDict):
    response: NotesResponse

class Note(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    likes: dict

def get_notes_of_user(user_id: str) -> RawNotesResponse:
    return requests.get("https://api.vk.com/method/wall.get", {
        "v": "5.131",
        'access_token': access_token,
        'owner_id': user_id,
    }).json()

def get_notes_with_long_text(
        notes: RawNotesResponse,
        minimal_text_length: int = 20
) -> typing.Iterable[Note]:
    if 'error' in notes.keys():
        return
    for note in notes["response"]["items"]:
        if len(note["text"]) >= minimal_text_length:
            yield note

def get_likes(item_id: int) -> list[int]:
    return requests.get("https://api.vk.com/method/likes.getList", {
        "v": "5.131",
        'access_token': access_token,
        'type': "post",
        "item_id": item_id
    }).json()['response']["items"]


user_queue: deque[Union[str, int, None]] = deque()
user_queue.append(START_USER)
user_queue.append(8423123)
user_queue.append(146737204)
user_queue.append(5152425)
user_queue.append(150572556)
user_queue.append(208660858)
user_queue.append(481752039)
user_queue.append(13459300)
user_queue.append(3945237)
user_queue.append(338031983)
visited_users: set[str] = set()

parsed_notes: list = []

while len(user_queue)>0 and len(parsed_notes) < MAX_NOTES:
    current_user = user_queue.popleft()

    if current_user in visited_users:
        continue
    visited_users.add(current_user)

    notes: RawNotesResponse = get_notes_of_user(current_user)

    notes_queue: deque[Note] = deque(get_notes_with_long_text(notes))


    while len(notes_queue) > 0 and len(parsed_notes) < MAX_NOTES:
        current_note = notes_queue.popleft()
        likes = get_likes(current_note['id'])
        if len(likes)==0:
            continue
        user_queue.extend(likes)
        parsed_notes.append({
            'id': current_note['id'],
            'from_id': current_note['from_id'],
            'owner_id': current_note['owner_id'],
            'date': current_note['date'],
            'text': current_note['text'],
            'liked_by': likes
        })
    print(len(parsed_notes),MAX_NOTES, sep='/')

with open(FILENAME, 'w') as f:
    f.write(json.dumps(
        {
            "users": list(visited_users),
            "notes": parsed_notes
        },
        indent=4,
        ensure_ascii=False
    ))
