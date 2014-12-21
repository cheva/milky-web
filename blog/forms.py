from django.forms import *
from blog.models import *
from captcha.fields import CaptchaField


class CommentForm(ModelForm):
    captcha = CaptchaField()

    class Meta:
        model = Comment
        exclude = ["post"]

    def clean_author(self):
        return self.cleaned_data.get("author") or "Anonymous"
