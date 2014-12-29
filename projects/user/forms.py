from django import forms
from django.contrib.auth.models import User   # fill in custom user info then save it 
from django.contrib.auth.forms import UserCreationForm
from captcha.fields import CaptchaField

class userRegistrationForm(UserCreationForm):
    email = forms.EmailField(required = True)
    first_name = forms.CharField(required = False)
    last_name = forms.CharField(required = False)
    birtday = forms.DateField(required = False)
    captcha = CaptchaField()


    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')


    def save(self,commit = True):   
        user = super(userRegistrationForm, self).save(commit = False)
        user.email = self.cleaned_data['email']
        user.first_name = self.cleaned_data['First name']
        user.last_name = self.cleaned_data['Last name']
        user.birthday = self.cleaned_data['Birthday']


        if commit:
            user.save()

        return user