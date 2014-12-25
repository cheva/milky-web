from django.shortcuts import render


def index(request):
    """
    Index page
    :param request:
    :return render():
    """
    template = 'main/index.jinja'
    test = 'test'
    return render(request, template, locals())
