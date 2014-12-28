from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib import auth
from helpers import functions


def index(request):
    """
    Index page
    :param request:
    :return render():
    """
    template = 'user/index.jinja'
    local_vars = functions.get_local_vars(request)
    return render(request, template, locals())


def login(request):
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            # User exists and active
            auth.login(request, user)
            error_message = 'Ok!'
        else:
            # Not active or not exists
            error_message = 'Login error!'
    else:
        # Empty POST
        error_message = "Wrong request!"
    local_vars = functions.get_local_vars(request)
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))