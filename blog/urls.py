from django.conf.urls import *
from blog.views import *

urlpatterns = patterns('',
                       (r'^$', Main.as_view(), {}, 'main'),
                       (r'^page/(?P<dpk>\d+)/$', Main.as_view(), {}, 'page'),
                       (r'^post/(?P<dpk>\d+)/$', PostView.as_view(), {}, 'post'),
                       (r'^post/(?P<post_id>\d+)/comment/$', post_comment, {}, 'comment'),
)
