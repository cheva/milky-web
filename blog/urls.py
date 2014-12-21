from django.conf.urls import *
from blog.views import PostView, Main

urlpatterns = patterns("dbe.blog.views",
                       (r"^$", Main.as_view(), {}, "main"),
                       (r"^page/(?P<dpk>\d+)/$", Main.as_view(), {}, "page"),
                       (r"^post/(?P<dpk>\d+)/$", PostView.as_view(), {}, "post"),
)
