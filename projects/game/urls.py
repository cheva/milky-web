from django.conf.urls import patterns
from projects.blog.views import *

urlpatterns = patterns('',
                       (r'^$', list_view, {}, 'main'),
)
