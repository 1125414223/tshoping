# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0004_orders'),
    ]

    operations = [
        migrations.AddField(
            model_name='userinfo',
            name='user_addres',
            field=models.CharField(max_length=20, blank=True, null=True),
        ),
    ]
