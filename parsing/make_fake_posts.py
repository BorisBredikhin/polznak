import json
from api_types import JSONType, FakeUser, get_token, create_post

file = open('data.json', 'r')
data: JSONType = json.load(file)
file.close()

users = data['users']
posts = data['notes']
del data

file = open('fake_users.json', 'r')
data2 = json.load(file)
file.close()

fusers : dict[str, FakeUser] = data2['users']
tokens: dict[str, str] = {}

for n, post in enumerate(posts):
    author = fusers[str(post['from_id'])]
    # print(post)
    # print(author)

    token = tokens.get(str(post['from_id']), get_token(author))
    create_post(token, post['text'][:10], post['text'])

    print(n, len(posts), sep='/')

