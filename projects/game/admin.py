from django.contrib import admin
from projects.game.models import *


class GameAdmin(admin.ModelAdmin):
    search_fields = ["title"]
    display_fields = "title created".split()
