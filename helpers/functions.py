def get_local_vars(request):
    local_vars = {}
    if "styleSheet" in request.COOKIES:
        local_vars['style_sheet'] = request.COOKIES["styleSheet"]
    return local_vars