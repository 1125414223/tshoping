# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0003_carts'),
    ]

    operations = [
        migrations.CreateModel(
            name='Orders',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('order_status', models.IntegerField(default=0)),
                ('goods_money', models.DecimalField(max_digits=10, decimal_places=2)),
                ('deliver_type', models.CharField(max_length=60, blank=True, null=True)),
                ('deliver_money', models.DecimalField(max_digits=10, decimal_places=2)),
                ('total_money', models.DecimalField(max_digits=10, decimal_places=2)),
                ('real_total_money', models.DecimalField(max_digits=10, decimal_places=2)),
                ('pay_type', models.CharField(max_length=20)),
                ('is_pay', models.BooleanField(default=False)),
                ('user_name', models.CharField(verbose_name='收货人名称', max_length=20)),
                ('user_phone', models.CharField(max_length=20)),
                ('address', models.CharField(max_length=50)),
                ('is_refund', models.BooleanField(default=False)),
                ('is_closed', models.BooleanField(default=False)),
                ('receive_time', models.DateTimeField(blank=True, null=True)),
                ('delivery_time', models.DateTimeField(blank=True, null=True)),
                ('expressld', models.CharField(max_length=50, blank=True, null=True)),
                ('express_no', models.CharField(max_length=50, blank=True, null=True)),
                ('create_time', models.DateTimeField(verbose_name='创建订单日期', auto_now=True)),
                ('shop', models.ForeignKey(to='shop.Shoping')),
                ('user', models.ForeignKey(to='shop.UserInfo')),
            ],
        ),
    ]
