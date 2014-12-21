from django.conf.urls import patterns
from blog.views import *

urlpatterns = patterns('',
                       (r'^$', list_view, {}, 'main'),
                       (r'^post/(?P<pk>\d+)/$', detail_view, {}, 'post'),
                       (r'^post/(?P<pk>\d+)/comment/$', post_comment, {}, 'comment'),
)
