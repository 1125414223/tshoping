# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Shoping',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('shop_sn', models.IntegerField(verbose_name='商品编号')),
                ('shop_name', models.CharField(verbose_name='商品名称', max_length=20)),
                ('shop_intro', models.CharField(max_length=100)),
                ('shop_text', models.TextField()),
                ('shop_img', models.ImageField(blank=True, null=True, upload_to='')),
                ('market_price', models.DecimalField(verbose_name='市场价格', max_digits=10, decimal_places=2)),
                ('shop_price', models.DecimalField(verbose_name='门店价格', max_digits=10, decimal_places=2)),
                ('warn_stock', models.IntegerField()),
                ('shop_stock', models.IntegerField(verbose_name='商品总库存')),
                ('shop_unit', models.CharField(verbose_name='商品单位', max_length=10)),
                ('is_sale', models.BooleanField(verbose_name='是否上架', default=True)),
                ('is_best', models.BooleanField(default=True)),
                ('sale_num', models.IntegerField(verbose_name='总销量数', blank=True, null=True)),
                ('visit_num', models.IntegerField(blank=True, null=True)),
                ('appraise_num', models.IntegerField(blank=True, null=True)),
                ('create_time', models.DateTimeField(verbose_name='创建日期', auto_now=True)),
                ('shop_show', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ShopingType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('sname', models.CharField(verbose_name='商品类别名称', max_length=20)),
                ('ssort', models.IntegerField(verbose_name='排序')),
                ('create_time', models.DateTimeField(verbose_name='创建日期', auto_now=True)),
                ('isDelete', models.BooleanField(default=True)),
                ('style', models.CharField(max_length=20, blank=True, null=True)),
                ('simage', models.ImageField(blank=True, null=True, upload_to='')),
                ('shop_show', models.IntegerField(blank=True, null=True)),
                ('shopType', models.ForeignKey(blank=True, null=True, to='shop.ShopingType')),
            ],
        ),
        migrations.CreateModel(
            name='UserAddress',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('user_name', models.CharField(verbose_name='收货人名称', max_length=20)),
                ('user_phone', models.CharField(max_length=20)),
                ('areald1', models.CharField(max_length=20)),
                ('areald2', models.CharField(max_length=20)),
                ('areald3', models.CharField(max_length=20)),
                ('communityld', models.CharField(max_length=20)),
                ('address', models.CharField(max_length=50)),
                ('post_code', models.CharField(max_length=20)),
                ('is_defult', models.BooleanField(default=False)),
                ('create_time', models.DateTimeField(verbose_name='创建日期', auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, serialize=False, auto_created=True)),
                ('login_name', models.CharField(verbose_name='登入名', max_length=20)),
                ('login_pwd', models.CharField(max_length=50)),
                ('user_sex', models.BooleanField(default=True)),
                ('user_type', models.BooleanField(default=True)),
                ('user_name', models.CharField(verbose_name='用户名', max_length=20)),
                ('user_qq', models.CharField(max_length=20, blank=True, null=True)),
                ('user_phone', models.CharField(max_length=20, blank=True, null=True)),
                ('user_total_score', models.IntegerField(blank=True, null=True, default=0)),
                ('user_status', models.BooleanField(default=True)),
                ('isDelete', models.BooleanField(default=True)),
                ('last_time', models.DateField(blank=True, null=True)),
                ('create_time', models.DateTimeField(verbose_name='创建日期', auto_now=True)),
            ],
        ),
        migrations.AddField(
            model_name='useraddress',
            name='user',
            field=models.ForeignKey(to='shop.UserInfo'),
        ),
        migrations.AddField(
            model_name='shoping',
            name='shopin_type',
            field=models.ForeignKey(to='shop.ShopingType'),
        ),
    ]
