from django.contrib.auth.forms import UserCreationForm
from django import forms

from django.utils.timezone import now
## models
from .models import Users
from datetime import datetime
from django.core.exceptions import ValidationError

class RegisterForm(UserCreationForm):
    class Meta:
        model = Users
        fields = ['username','birth_date', 'first_name', 'last_name']

    def clean_birth_date(self):
        dob = self.cleaned_data.get("birth_date")
        if dob > now().date():
            raise ValidationError(
                "Date Of Birth Must Not Be Future"
            )
        return dob
    
