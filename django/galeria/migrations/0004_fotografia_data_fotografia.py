# Generated by Django 5.0.2 on 2024-02-16 01:54

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('galeria', '0003_fotografia_publicado'),
    ]

    operations = [
        migrations.AddField(
            model_name='fotografia',
            name='data_fotografia',
            field=models.DateTimeField(default=datetime.datetime(2024, 2, 16, 1, 54, 31, 914372, tzinfo=datetime.timezone.utc)),
        ),
    ]
