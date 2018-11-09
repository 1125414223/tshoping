from django.conf.urls import url,include
from shop.views import *
urlpatterns = [
    url(r'^index$',index),
    url(r'^yzm$',createImage),
    url(r'^login_from$',login_from,name='login_from'),
    url(r'isyzm',isyzm),
    url(r'^login$',login,name='login'),
    url(r'^register_from$',register_from),
    url(r'^register$',register),
    url(r'^detail/(?P<sid>\d+)$',detail),
    url(r'^list(?P<pagepi>\d*)/(?P<sid>\d+)$',list),
    url(r'^cart$',cart),
    url(r'^cart_num$',cart_num),
    url(r'^place_order$',place_order),
    url(r'^user_center_info$',user_center_info),
    url(r'^user_center_order$',user_center_order),
    url(r'^user_center_site$',user_center_site),
    url(r'^zhifu$',zhifu),
    url(r'^zhifu_from',zhifu_from),
]