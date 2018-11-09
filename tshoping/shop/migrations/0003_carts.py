# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0002_shoping_shop_detail'),
    ]

    operations = [
        migrations.CreateModel(
            name='Carts',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('cart_num', models.IntegerField()),
                ('shop', models.ForeignKey(to='shop.Shoping')),
                ('user', models.ForeignKey(to='shop.UserInfo')),
            ],
        ),
    ]
