import typing

import requests

access_token = "..." # get it here: https://oauth.vk.com/authorize?client_id=7992889&redirect_uri=localhost&scope=10242&response_type=token


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

class NotesInnerResponse(typing.TypedDict):
    count: int
    items: list[NoteItem]


class NotesResponse(typing.TypedDict):
    response: NotesInnerResponse


notes: NotesResponse = requests.get("https://api.vk.com/method/wall.get", {
    "v": "5.131",
    'access_token': access_token,
    'user_id': '191923465',#'150572556'
}).json()

print(notes)
