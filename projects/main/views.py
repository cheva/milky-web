from django.shortcuts import render
from helpers import functions


def index(request):
    """
    Index page
    :param request:
    :return render():
    """
    template = 'main/index.jinja'
    local_vars = functions.get_local_vars(request)
    return render(request, template, locals())
