import json
import requests

from api_types import FakeUser

file = open('fake_users.json', 'r', encoding="utf8")
data = json.load(file)
file.close()

users: dict = data['users']

i = 0

for uid, user in users.items():
    requests.post('http://localhost:8000/api/register/', user)
    print(i, len(users))
    i+=1
