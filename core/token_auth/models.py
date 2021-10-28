from django.contrib.auth.models import User
from django.db import models
import secrets

from django.db.models.signals import post_save
from django.dispatch import receiver



class Token(models.Model):
    key = models.CharField(max_length=64, primary_key=True)
    profile = models.OneToOneField(User, related_name="token", on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)

    def save(self, *args, **kwargs):
        if not self.key:
            self.key = self.generate_key()
        return super(Token, self).save(*args, **kwargs)

    def generate_key(self):
        return secrets.token_hex(32)

    def __unicode__(self):
        return self.key

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Token(profile=instance).save()
