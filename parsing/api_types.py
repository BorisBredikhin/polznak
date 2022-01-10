import datetime
import typing

import requests


class CopyHistory(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    attachments: list
    post_source: dict


class NoteItem(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    copy_history: list
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
    items: list


class RawNotesResponse(typing.TypedDict):
    response: NotesResponse


class APINote(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    text: str
    liked_by: list


class Note(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    likes: dict


class JSONType(typing.TypedDict):
    users: list
    notes: list

class FakeUser(typing.TypedDict):
    first_name: str
    last_name: str
    username: str
    birth_date: datetime.date
    gender: str
    email: str
    password: str

def get_token(author: FakeUser) -> str:
    return requests.post('http://localhost:8000/api-token-auth/', {
        'username': author['username'],
        'password': author['password']
    }).json()['token']

def create_post(token: str, title: str, content: str):
    return requests.post('http://localhost:8000/api/posts/', {
        'title': title,
        'content': content
    }, headers={'Authorization': f'Token {token}'}).json()


def like_post(token, post_id, grade):
    requests.post('http://localhost:8000/api/likes/', {
        'post_id': int(post_id),
        'grade': int(grade),
    }, headers={'Authorization': f'Token {token}'})
