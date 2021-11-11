from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from rest_framework.authtoken.models import Token


class InterestArea(models.Model):
    name = models.CharField(verbose_name=_('Title'), max_length=50)

    class Meta:
        verbose_name = _("interest area")
        verbose_name_plural = _("interest areas")


class Language(models.Model):
    language_code = models.CharField(verbose_name=_('language_code'), max_length=5)

    class Meta:
        verbose_name = _("language")
        verbose_name_plural = _("languages")


class Profile(models.Model):
    GENDER_CHOICES = [
        ('M', _("Male")),
        ('F', _('Female'))
    ]

    user = models.OneToOneField(User, on_delete=models.CASCADE)

    gender = models.CharField(max_length=1, choices=GENDER_CHOICES, blank=True)
    birth_date = models.DateField(null=True, blank=True, verbose_name=_("Birthday"))
    details = models.TextField(blank=True, verbose_name=_("Additional information"))
    interests = models.ManyToManyField('InterestArea')
    knows_languages = models.ManyToManyField('Language', verbose_name=_("Knows languages"))


# noinspection PyUnusedLocal
@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
        Token.objects.create(user=instance)


# noinspection PyUnusedLocal
@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


class Post(models.Model):
    creator = models.ForeignKey('Profile', on_delete=models.CASCADE)
    title = models.CharField(max_length=128)
    content = models.TextField(help_text="Содержимое поста")
    created_at = models.DateTimeField(auto_now=True, verbose_name=_("Created at"))
    likes = models.IntegerField(default=0)
    dislikes = models.IntegerField(default=0)


class Conversation(models.Model):
    participants = models.ManyToManyField('Profile')
    initiator = models.ForeignKey('Post', on_delete=models.CASCADE)


class Message(models.Model):
    conversation = models.ForeignKey('Conversation', on_delete=models.CASCADE)
    sender = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='sender')
    body = models.TextField()
    seen_by = models.ManyToManyField('Profile', through='MessageSeenByProfile', related_name='seen_by')
    send_at = models.DateTimeField(auto_now=True, verbose_name=_("Send at"))


class MessageSeenByProfile(models.Model):
    profile = models.ForeignKey(Profile, on_delete=models.CASCADE)
    message = models.ForeignKey(Message, on_delete=models.CASCADE)
    seen_at = models.DateTimeField(auto_now=True, verbose_name=_("Seen at"))


class Comment(models.Model):
    post = models.ForeignKey('Post', on_delete=models.CASCADE)
    sender = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='comment_sender')
    body = models.TextField()
    send_at = models.DateTimeField(auto_now=True, verbose_name=_("Send at"))


class UserOpinion(models.Model):
    OPINION_CHOICES = [
        (-1, _("Dislike")),
        (1, _('Like'))
    ]

    post = models.ForeignKey('Post', on_delete=models.CASCADE)
    sender = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='like_sender')
    opinion = models.IntegerField(default=0, choices=OPINION_CHOICES)

    class Meta:
        unique_together = (('post', 'sender'),)


# noinspection PyUnusedLocal
@receiver(post_save, sender=UserOpinion)
def save_user_opinon(sender: UserOpinion, **kwargs):
    post = sender.post
    if sender.opinion>0:
        post.likes+=1
    else:
        post.dislikes+=1
    post.save()

class Grades(models.Model):
    GRADE_CHOICES = [
        (1, _("1")),
        (2, _("2")),
        (3, _("3")),
        (4, _("4")),
        (5, _("5"))
    ]

    conversation = models.ForeignKey('Conversation', on_delete=models.CASCADE)
    user_given = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='user_given')
    user_received = models.ForeignKey('Profile', on_delete=models.CASCADE, related_name='user_received')
    grade = models.IntegerField(choices=GRADE_CHOICES) # todo: delete choices and add validator
