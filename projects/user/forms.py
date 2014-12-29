from django import forms
from django.contrib.auth.models import User
from captcha.fields import CaptchaField
from django.contrib.auth.forms import UserCreationForm


class UserRegistrationForm(UserCreationForm):
    email = forms.EmailField(required=True)
    first_name = forms.CharField(required=False)
    last_name = forms.CharField(required=False)
    birthday = forms.DateField(required=False)
    captcha = CaptchaField()

    error_css_class = 'class-error'
    required_css_class = 'class-required'

    def __init__(self, *args, **kwargs):
        super(UserRegistrationForm, self).__init__(*args, **kwargs)
        # adding css classes to widgets without define the fields:
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

    def as_bs(self):
        # new output for bootstrap:
        return self._html_output(
            normal_row=u'<div%(html_class_attr)s>%(label)s %(field)s'
                       + u'%(errors)s'
                       + u'%(help_text)s</div><br />',
            error_row=u'<b class="error">%s</b>',
            help_text_html=u'<small class="help-text">%s</small>',
            row_ender='</div>',
            errors_on_separate_row=False)

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

    def save(self, commit=True):
        user = super(UserRegistrationForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.birthday = self.cleaned_data['birthday']

        if commit:
            user.save()

        return user