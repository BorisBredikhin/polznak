# Generated by Django 3.2.10 on 2022-01-04 16:21

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('polznak_entities', '0004_alter_grades_grade'),
    ]

    operations = [
        migrations.AlterField(
            model_name='conversation',
            name='initiator',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='polznak_entities.post'),
        ),
    ]
