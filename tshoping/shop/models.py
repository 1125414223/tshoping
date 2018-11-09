from django.db import models
import django.utils.timezone as timezone
import datetime
# Create your models here.
#用户表
class UserInfo(models.Model):
    login_name=models.CharField('登入名',max_length=20)#登入帐号
    login_pwd=models.CharField(max_length=50)#密码
    user_sex=models.BooleanField(default=True)#用户性别
    user_type=models.BooleanField(default=True)#用户类型
    user_name=models.CharField('用户名',max_length=20)#用户昵称
    user_qq=models.CharField(max_length=20,null=True,blank=True)
    user_phone=models.CharField(max_length=20,null=True,blank=True)#用户电话
    user_total_score=models.IntegerField(default=0,null=True,blank=True)#用户历史积分
    user_status=models.BooleanField(default=True)#帐号状态
    isDelete=models.BooleanField(default=True)#逻辑删除
    user_addres=models.CharField(max_length=20,null=True,blank=True)
    last_time=models.DateField(null=True,blank=True)#最后登入时间
    create_time=models.DateTimeField('创建日期',auto_now=timezone.now)#注册日期


    def __str__(self):
        return self.user_name

    def getSex(self):
        if self.user_sex:
            return "男"
        else:
            return "女"
    getSex.short_description = '性别'

#用户收货地址表
class UserAddress(models.Model):
    user=models.ForeignKey('UserInfo')#会员Id
    user_name=models.CharField('收货人名称',max_length=20) #收货人名称
    user_phone=models.CharField(max_length=20)#收货人手机
    areald1=models.CharField(max_length=20)#地址所属省
    areald2=models.CharField(max_length=20)#地址所属市
    areald3=models.CharField(max_length=20)#地址所属县级
    communityld=models.CharField(max_length=20)#地址社区
    address=models.CharField(max_length=50) #详情地址
    post_code=models.CharField(max_length=20) #邮编
    is_defult=models.BooleanField(default=False)#是否默认地址
    create_time = models.DateTimeField('创建日期', auto_now=timezone.now)  # 注册日期

    def getuname(self):
        return UserInfo.objects.get(id=self.user_id).user_name
    def __str__(self):
        return self.user_name

    getuname.short_description = '会员'

#商品类型表
class ShopingType(models.Model):
    sname=models.CharField('商品类别名称',max_length=20)   #商品类型名称
    ssort=models.IntegerField('排序')             #排序
    create_time = models.DateTimeField('创建日期', auto_now=timezone.now)  # 注册日期
    isDelete = models.BooleanField(default=True)  # 逻辑删除
    style=models.CharField(max_length=20,null=True,blank=True)
    simage=models.ImageField(upload_to="",null=True,blank=True)
    shop_show = models.IntegerField(null=True, blank=True)
    shopType=models.ForeignKey("ShopingType",null=True,blank=True)       #父类别
    def __str__(self):
        return self.sname

class Shoping(models.Model):
    shop_sn=models.IntegerField('商品编号') #商品编号
    shop_name=models.CharField('商品名称',max_length=20) #商品名称
    shop_intro=models.CharField(max_length=100) #商品简介
    shop_text=models.TextField()  #商品详情介绍
    shop_img=models.ImageField(upload_to="",null=True,blank=True) #商品图片
    shop_detail=models.ImageField(upload_to="",null=True,blank=True) # 详情图片
    market_price=models.DecimalField('市场价格',max_digits=10,decimal_places=2) #市场价格
    shop_price=models.DecimalField('门店价格',max_digits=10,decimal_places=2) #门店价格
    warn_stock=models.IntegerField() #预警库存
    shop_stock=models.IntegerField('商品总库存')    #商品总库存
    shop_unit=models.CharField('商品单位',max_length=10) #商品单位
    is_sale=models.BooleanField('是否上架',default=True) #是否上架
    is_best=models.BooleanField(default=True) #是否精品
    sale_num=models.IntegerField('总销量数',null=True,blank=True) #总销量数
    visit_num=models.IntegerField(null=True,blank=True) #访问数量
    appraise_num=models.IntegerField(null=True,blank=True) #评价数量
    create_time = models.DateTimeField('创建日期', auto_now=timezone.now)  # 注册日期
    shopin_type=models.ForeignKey("ShopingType") #商品类别
    shop_show=models.IntegerField(null=True,blank=True)
    def __str__(self):
        return self.shop_name

# 购物车
class Carts(models.Model):
    user=models.ForeignKey("UserInfo")   #用户ID
    shop=models.ForeignKey("Shoping")
    cart_num=models.IntegerField()

#订单表
class Orders(models.Model):
    user = models.ForeignKey("UserInfo") #用户ID
    shop=models.ForeignKey("Shoping") #商品ID
    order_status=models.IntegerField(default=0) #订单状态 -3:用户拒收 -2:未付款的订单 -1：用户取消 0:待发货 1:配送中 2:用户确认收货
    goods_money=models.DecimalField(max_digits=10,decimal_places=2)#商品总金额
    deliver_type=models.CharField(max_length=60,null=True,blank=True) #收货方式
    deliver_money=models.DecimalField(max_digits=10,decimal_places=2)#运费
    total_money=models.DecimalField(max_digits=10,decimal_places=2)#订单总金额
    real_total_money=models.DecimalField(max_digits=10,decimal_places=2)#实际订单总金额
    pay_type=models.CharField(max_length=20)#支付方式
    is_pay=models.BooleanField(default=False) #是否支付
    user_name = models.CharField('收货人名称', max_length=20)  # 收货人名称
    user_phone = models.CharField(max_length=20)  # 收货人手机
    address = models.CharField(max_length=50)  # 详情地址
    is_refund=models.BooleanField(default=False)  #是否退款
    is_closed=models.BooleanField(default=False)  #订单是否完成
    receive_time=models.DateTimeField(null=True,blank=True) #收货时间
    delivery_time=models.DateTimeField(null=True,blank=True) #发货时间
    expressld=models.CharField(max_length=50,null=True,blank=True)   #快递公司id
    express_no=models.CharField(max_length=50,null=True,blank=True) #快递单号
    create_time=models.DateTimeField('创建订单日期',auto_now=True) #下单时间








