# from django.template import RequestContext
# from django.db.models import Q
import json
from django.shortcuts import get_object_or_404
from django.shortcuts import render
from django.shortcuts import redirect
from django.http import HttpResponse
from django.template import loader
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import messages
from projects.blog.forms import *
from helpers import functions


def list_view(request, page_num=1):
    """
    Post list view with comments count and paginator
    :param request:
    :param page_num:
    :return render():
    """
    template = 'blog/list.jinja2'
    local_vars = functions.get_local_vars(request)
    post_list = Post.objects.order_by('-created')
    paginator = Paginator(post_list, 10)
    try:
        post_list = paginator.page(page_num)
    except PageNotAnInteger:
        # If page is not an integer, deliver first page.
        post_list = paginator.page(1)
    except EmptyPage:
        # If page is out of range (e.g. 9999), deliver last page of results.
        post_list = paginator.page(paginator.num_pages)
    return render(request, template, locals())

