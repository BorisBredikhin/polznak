import random
import string

import faker
import json
from api_types import JSONType, FakeUser

file = open('data.json', 'r')
data: JSONType = json.load(file)
file.close()

users = data['users']

fake_users: dict[int, FakeUser] = {}

fake = faker.Faker('ru')


def genrate_pwd():
    symbols = string.ascii_letters+string.digits+string.punctuation
    length = random.randint(8,20)
    return ''.join(random.choice(symbols) for _ in range(length))


for i in users:
    profile = fake.profile()
    fake_users[i] = {
        'first_name': fake.first_name_male() if profile['sex'] == "M" else fake.first_name_female(),
        'last_name': fake.last_name_male() if profile['sex'] == "M" else fake.last_name_female(),
        'username': profile['username'],
        'birth_date': profile['birthdate'].isoformat(),
        'gender': profile['sex'],
        'email': profile['mail'],
        'password': genrate_pwd()
    }

with open('fake_users.json', 'w') as f:
    f.write(json.dumps(
        {
            "users": fake_users
        },
        indent=4,
        ensure_ascii=False
    ))
