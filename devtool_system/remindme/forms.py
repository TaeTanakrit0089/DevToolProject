from django.contrib.auth.forms import UserCreationForm
from django import forms

from django.utils.timezone import now
## models
from .models import Users, Events
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
    

class EventsForm(forms.ModelForm):
    class Meta:
        model = Events
        fields = ['name', 'description', 'noti_date', 'noti_time', 'routine', 'family']
        widgets = {
            'name': forms.TextInput(attrs={
                'id': 'eventName',
                'placeholder': 'Event Name',
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded'
            }),
            'noti_time': forms.TimeInput(attrs={
                'id': 'eventTime',
                'placeholder': 'Event Time',
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded'
            }),
            'description': forms.Textarea(attrs={
                'id': 'eventDescription',
                'placeholder': 'Event Description',
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded',
                'rows': 3
            }),
            'noti_date': forms.DateInput(attrs={
                'type': 'date',
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded'
            }),
            'routine': forms.Select(attrs={
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded'
            }),
            'family': forms.Select(attrs={
                'class': 'w-full mb-4 p-2 border border-brown-700 rounded'
            }),
        }
