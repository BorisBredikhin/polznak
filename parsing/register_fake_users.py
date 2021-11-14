import json
import requests

from api_types import FakeUser

file = open('fake_users.json', 'r')
data = json.load(file)
file.close()

users: dict[str, FakeUser] = data['users']

i = 0

for uid, user in users.items():
    requests.post('http://0.0.0.0:8000/api/register/', user)
    print(i, len(users))
    i+=1
