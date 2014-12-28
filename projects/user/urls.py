from django.conf.urls import patterns
from projects.user.views import *

urlpatterns = patterns('',
                       (r'^$', index, {}, 'index'),
                       (r'^login/$', login, {}, 'login'),
)
