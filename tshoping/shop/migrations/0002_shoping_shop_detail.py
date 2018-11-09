# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='shoping',
            name='shop_detail',
            field=models.ImageField(blank=True, null=True, upload_to=''),
        ),
    ]
