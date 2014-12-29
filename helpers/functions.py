from projects.user.forms import *


def get_local_vars(request):
    local_vars = {}
    if "styleSheet" in request.COOKIES:
        local_vars['style_sheet'] = request.COOKIES["styleSheet"]
    local_vars["user_registration_form"] = UserRegistrationForm()

    return local_vars