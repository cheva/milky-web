from django.shortcuts import render

def main(request):
    """
    Innex page
    :param request:
    :return render():
    """
    template = 'main/index.jinja'
    test = 'test'
    return render(request, template, locals())
