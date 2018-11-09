from django.contrib import admin
from .models import *
# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ["user_name","login_name","getSex","login_name","create_time",]

class ShopingTypeAdmin(admin.ModelAdmin):
    list_display = ["sname","ssort","isDelete","shopType",]

class ShopingAdmin(admin.ModelAdmin):
    list_display = ["visit_num","shop_name","market_price","shop_price","shop_stock","shop_unit","is_sale","create_time","sale_num",]

class UserAddressAdmin(admin.ModelAdmin):
    list_display = ["getuname","user_name","user_phone",'areald1',"is_defult","create_time",]




admin.site.register(UserInfo,UserAdmin)
admin.site.register(UserAddress,UserAddressAdmin)
admin.site.register(ShopingType,ShopingTypeAdmin)
admin.site.register(Shoping,ShopingAdmin)