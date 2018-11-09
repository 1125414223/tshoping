from django.shortcuts import render,redirect
from django.template import loader,RequestContext
# Create your views here.
from django.http import HttpResponse
from PIL import ImageDraw,ImageFont,Image
from django.utils.six import BytesIO
from django.http import JsonResponse
from django.core.paginator import Paginator
from .models import *

def index(request):

    countx={}
    uid = request.session.get("userid")
    #获取会员资料
    if uid==None:
       countx["user"]=None
    else:
        user=UserInfo.objects.get(id=uid)
        countx["user"]=user
    #获取商品类型
    shoptypelist=ShopingType.objects.filter(ssort=1)[:6]
    countx['shoptypelist']=shoptypelist
    countx["shoptypes"]=ShopingType.objects.filter(shop_show=1,ssort=2)[:4]


    return render(request, "shop/index.html",countx)

def login_from(request):

    return  render(request,"shop/login.html")
#创建验证码
def createImage(request):
    # 引入随机函数模块
    import random
    # 定义变量，用于画面的背景色、宽、高
    bgcolor = (random.randrange(20, 100), random.randrange(
        20, 100), 0)
    width = 100
    height = 25
    # 创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    # 创建画笔对象
    draw = ImageDraw.Draw(im)
    # 调用画笔的 point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
    fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
    draw.point(xy, fill=fill)
    # 定义验证码的备选值
    str1 = '123456789'  # 随机选取 4 个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    # 构造字体对象，ubuntu 的字体路径为“/usr/share/fonts/truetype/freefont”
    font = ImageFont.truetype('FreeMono.ttf', 23)
    # ttf='/usr/share/fonts/truetype/ttf-khmeros-core/KhmerOS.ttf' #font=ImageFont.truetype(ttf,14)
    # 构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    # 绘制 4 个字深圳信盈达科技有限公司 web 服务器

    draw.text((5, 2), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, 2), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, 2), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, 2), rand_str[3], font=font, fill=fontcolor)
    # 释放画笔
    del draw
    # 存入 session，用于做进一步验证
    request.session['verifycode'] = rand_str
    # 内存文件操作
    buf = BytesIO()
    # 将图片保存在内存中，文件类型为 png
    im.save(buf, 'png')
    # 将内存中的图片数据返回给客户端，MIME 类型为图片 png
    return HttpResponse(buf.getvalue(), 'image/png')

def isyzm(request):
    uyzm=request.GET.get("yzm")
    hyzmm=request.session.get("verifycode")

    if uyzm==hyzmm:

        return JsonResponse({'flog':1})
    else:
        return JsonResponse({'flog':0})

#登入
def login(request):
    uname=request.POST.get("username")
    upassword=request.POST.get("password")
    user_list=UserInfo.objects.all()
    for user in user_list:
        if user.login_name==uname and user.login_pwd==upassword:
            request.session["username"]=user.user_name
            request.session["userid"] = user.id

            return redirect("/index")

    return redirect("/login_from")

def register_from(request):

    return render(request,'shop/register.html')
# 注册
def register(request):
    #得到帐号密码
    login_name=request.POST.get("username")
    login_password=request.POST.get("password")
    umail=request.POST.get("mail")
    #创建对象user
    user=UserInfo()
    user.user_name=login_name
    user.login_name=login_name
    user.login_pwd=login_password
    user.user_qq="111"
    user.save()
    return render(request,'shop/login.html',{'user':user})

#商品详情页
def detail(request,sid):
    content = {}
    # 得到分类列表
    shoptypelist = ShopingType.objects.filter(ssort=1)[:6]
    shop=Shoping.objects.get(id=sid)
    #  如果访问数为null那么在第一次访问就初始化1
    if shop.visit_num==None:
        shop.visit_num=1
    else:
        shop.visit_num=shop.visit_num+1
    shop.save()
    uid = request.session.get("userid")
    # 获取会员资料
    if uid == None:
        content["user"] = None
    else:
        user = UserInfo.objects.get(id=uid)
        content["user"] = user
    content["shop"]=shop
    content["shoptypelist"]=shoptypelist
    browse=request.session.get("browse","")
    browse+="%s@"%str(shop.id)
    request.session["browse"]=browse
    return render(request, 'shop/detail.html', content)

def list(request,sid,pagepi):
    # 根据ID得到商品分类
    shoptype=ShopingType.objects.get(id=sid)
    content={}
    content['shoptype']=shoptype
    jiage=request.GET.get("jiage")
    renqi=request.GET.get("renqi")
    page =None
    if jiage!=None:
        # 根据商品分类得到分类下面的所有商品放到Paginator里进行分页，2代表每俩条数据为一页,如果按照价格排序那么就按照价格排序
        page = Paginator(shoptype.shoping_set.all().order_by("shop_price"), 2)
    elif renqi!=None:
        # 根据商品分类得到分类下面的所有商品放到Paginator里进行分页，2代表每俩条数据为一页,如果按照价格排序那么就按照价格排序
        page = Paginator(shoptype.shoping_set.all().order_by("-visit_num"), 2)
    else:

        # 根据商品分类得到分类下面的所有商品放到Paginator里进行分页，2代表每俩条数据为一页
        page = Paginator(shoptype.shoping_set.all(), 2)
    #如果页码为空或者小于1那么默认为1
    if pagepi=="" or int(pagepi)<1:
        pagepi=1
    #如果果传过来的页码大于实际页码那么就重新定义他的值为最大页码
    elif int(pagepi)>page.num_pages:
        pagepi=page.num_pages
    #根据页码得到数据集
    list2=page.page(pagepi)
    #得到页码总列表
    plist=page.page_range
    content["list2"]=list2
    content["plist"]=plist
    content['pagepi']=pagepi
    #商品类别
    shoptypelist = ShopingType.objects.filter(ssort=1)[:6]
    content['shoptypelist'] = shoptypelist
    #根据访问量排序得到俩个最高点击量的商品最为推荐商品
    rec_shop=Shoping.objects.all().order_by("-visit_num")[:2]
    content["rec_shop"]=rec_shop
    uid = request.session.get("userid")
    # 获取会员资料
    if uid == None:
        content["user"] = None
    else:
        user = UserInfo.objects.get(id=uid)
        content["user"] = user
    return render(request,'shop/list.html',content)

# 购物车
def cart(request):
    content={}
    #判断访问的客户端是否登入状态
    uid=request.session.get("userid")
    user =None
    #如果没有登入那么跳转到登入界面
    if uid == None:
        content["user"] = None
        return redirect("/login_from")
    else:
        user = UserInfo.objects.get(id=uid)
        content["user"] = user
    sid=request.GET.get("sid")
    num=request.GET.get("num")
    #如果sid不为空，那么客户是请求把商品加入购物车
    if sid!=None:

        cart1 = Carts.objects.filter(shop_id=sid)
        #如果用户的购物车部位空那么进入判断要添加的商品是否存在购物车。
        if cart1.__len__()!=0:
            for c in cart1:
                #如果该用户的购物车已经存在商品，那么商品数量累加。
                if c.shop_id==int(sid):

                    c.cart_num=c.cart_num+1
                    c.save()
                #如果用户的购物车不存在该商品。那么添加新的记录。
                else:
                    cr=Carts()
                    cr.shop_id=sid
                    cr.user_id=user.id
                    cr.cart_num=num
                    cr.save()
        #如果用户的购物车为空的那么直接添加商品
        else:
            cr = Carts()
            cr.shop_id = sid
            cr.user_id = user.id
            cr.cart_num = num
            cr.save()
    cid = request.GET.get("cid")
    #如果传过来的购物车ID不为空，那么进行删除操作
    if cid!=None:
        cr2=Carts.objects.get(id=cid)
        cr2id=cr2.id
        cr2.delete()
    content["cartlist"]=user.carts_set.all()
    return render(request,"shop/cart.html",content)

#更新购物车的商品数量
def cart_num(request):

    cid=request.GET.get("cid")
    num=request.GET.get("num")
    if cid!=None:
        carts=Carts.objects.get(id=cid)
        carts.cart_num=int(num)
        carts.save()

    return redirect("/cart")

#订单提交
def place_order(request):
    content = {}
    cart_list=[]
    #获取用户选中的商品
    str_cid=request.GET.get("cidList")
    cid_list=str_cid.split(",")

    for i in cid_list:
        if i!="":
           cart_list.append(Carts.objects.get(id=i))
    user=UserInfo.objects.get(id=request.session.get("userid"))
    content["address"] = UserAddress.objects.filter(user_id=user.id,is_defult=True)[0]
    content["cart_list"]=cart_list
    content["user"]=user
    psum=0 #订单总价
    for cart in cart_list:
        psum+=cart.cart_num*cart.shop.shop_price  #用户提交过来的商品数量加单价
    content["psum"]=psum
    content["snumber"] = cart_list.__len__()
    content["cid_list"]=str_cid
    return render(request,"shop/place_order.html",content)

#个人信息显示
def user_center_info(request):
    content = {}
    # 判断访问的客户端是否登入状态
    uid = request.session.get("userid")
    user = None
    # 如果没有登入那么跳转到登入界面
    if uid == None:
        content["user"] = None
        return redirect("/login_from")
    else:
        user = UserInfo.objects.get(id=uid)

    content["user"] = user
    str_shopid=request.session.get("browse")
    shop_list=[]
    if str_shopid!=None:
        str_shopid=str_shopid.split("@")
        for sid in str_shopid:
            if sid!="":
                shop_list.append(Shoping.objects.get(id=sid))


    content["shop_list"]=shop_list
    return render(request,"shop/user_center_info.html",content)

#用户订单显示
def user_center_order(request):


    return render(request,"shop/user_center_order.html")
#用户收货地址显示s
def user_center_site(request):


    return render(request,"shop/user_center_site.html")
#跳转到请求支付页面
def zhifu(request):
    tr_cid = request.GET.get("cid")
    print(tr_cid)
    return render(request,"shop/zhifu.html",{"cid":tr_cid})

def zhifu_from(request):
    tr_cid = request.POST.get("cid")

    # return redirect("/user_center_order")
    return HttpResponse(tr_cid)
