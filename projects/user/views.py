from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib import messages
from django.contrib import auth
from helpers import functions
from projects.user.forms import *


def index(request):
    """
    Index page
    :param request:
    :return render():
    """
    # @todo create static user page
    messages.warning(request, '<h4>@todo create static user page!</h4>')
    template = 'user/index.jinja'
    local_vars = functions.get_local_vars(request)
    return render(request, template, locals())


def cabinet(request, pk):
    """
    Personal cabinet page
    :param request:
    :return render():
    """
    # @todo create cabinet page
    messages.warning(request, '<h4>@todo create cabinet page!</h4>')
    template = 'user/index.jinja'
    local_vars = functions.get_local_vars(request)
    return render(request, template, locals())


def login(request):
    """
    Login controller
    :param request:
    :return HttpResponseRedirect();
    """
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None and user.is_active:
            # User exists and active
            auth.login(request, user)
            messages.success(request, '<h4>Successfully logged in!</h4>Congratulations!')
        else:
            # Not active or not exists or wrong password
            if user is not None:
                messages.error(request, '<h4>Login error!</h4>User is not active.')
            else:
                messages.error(request, '<h4>Login error!</h4>User is not registered or password error.')
    else:
        # Empty POST
        # @todo create static login page
        messages.warning(request, '<h4>@todo create static login page!</h4>')
        template = 'user/index.jinja'
        local_vars = functions.get_local_vars(request)
        return render(request, template, locals())

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def register(request):
    template = 'user/index.jinja'
    if request.method == 'POST':
        form = UserRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, '<h4>Successfully registered!</h4>Congratulations!')
            return HttpResponseRedirect('user:index')
        else:
            # now redirect to static registration page with errors
            messages.error(request, '<h4>Registration error!</h4>User registration error.')
    else:
        # Empty POST
        # @todo create static registration page
        messages.warning(request, '<h4>@todo create static registration page!</h4>')
    local_vars = functions.get_local_vars(request)
    return render(request, template, locals())