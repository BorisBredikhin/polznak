from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.core.management.base import BaseCommand, CommandError

from token_auth.models import Token

class Command(BaseCommand):
    help = "Resets the tokens for all users."

    def handle(self, *args, **options):
        message = ['\n']
        message.append('This will reset the tokens for ALL users in the database.'
                       'Are you sure you want to do this?\n\n'
                       "Type 'yes' to continue, or 'no' to cancel")
        if input("".join(message)) != 'yes':
            raise CommandError("Reset tokens cancelled.")

        for user in User.objects.all():
            Token.objects.filter(profile=user).delete()
            token = Token.objects.create(profile=user)
            print(
                f'Resetting token for user {token.profile}: {token=}')
