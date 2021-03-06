import json
import random

from api_types import JSONType, FakeUser, get_token, like_post

file = open('data.json', 'r', encoding="utf8")
data: JSONType = json.load(file)
file.close()

users = data['users']
posts = data['notes']
del data

file = open('fake_users.json', 'r', encoding="utf8")
data2 = json.load(file)
file.close()

file = open('post_ids.json', 'r', encoding="utf8")
data3 = json.load(file)
file.close()

fusers: dict = data2['users']
tokens: dict = {}
ids: dict = data3['ids']

for n, post in enumerate(posts):
    for like in post['liked_by']:
        token = tokens.get(str(like), get_token(fusers[str(like)]))
        like_post(token, ids[str(post['id'])], random.choice([-1, 1]))

    print(n, len(posts), sep='/')

