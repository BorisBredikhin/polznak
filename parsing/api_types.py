import datetime
import typing


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


class APINote(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    text: str
    liked_by: list[int]


class Note(typing.TypedDict):
    id: int
    from_id: int
    owner_id: int
    date: int
    post_type: str
    text: str
    likes: dict


class JSONType(typing.TypedDict):
    users: list[int]
    notes: list[APINote]

class FakeUser(typing.TypedDict):
    first_name: str
    last_name: str
    username: str
    birth_date: datetime.date
    gender: str
    email: str
    password: str
