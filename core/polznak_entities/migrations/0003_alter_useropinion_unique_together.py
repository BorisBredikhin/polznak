# Generated by Django 3.2.8 on 2021-11-11 12:01

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('polznak_entities', '0002_auto_20211106_1014'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='useropinion',
            unique_together={('post', 'sender')},
        ),
    ]