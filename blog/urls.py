from django.conf.urls import *
from blog.views import *

urlpatterns = patterns('',
                       (r'^$', ListView.as_view(), {}, 'main'),
                       (r'^page/(?P<page>\d+)/$', ListView.as_view(), {}, 'page'),
                       (r'^post/(?P<pk>\d+)/$', DetailView.as_view(), {}, 'post'),
                       (r'^post/(?P<pk>\d+)/comment/$', post_comment, {}, 'comment'),
)
