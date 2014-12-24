from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
                       url(r'^admin/', include(admin.site.urls)),
                       url(r'^captcha/', include('captcha.urls')),
                       url(r'^$', include('projects.main.urls', namespace='main')),
                       url(r'^blog/', include('projects.blog.urls', namespace='blog')),
)
