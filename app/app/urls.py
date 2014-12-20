from django.conf.urls import patterns, include, url
from django.contrib import admin
from app.admin import *

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'app.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^adm.*/', include(admin.site.urls)),
)
