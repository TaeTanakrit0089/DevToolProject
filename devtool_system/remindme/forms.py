from django.contrib.auth.forms import UserCreationForm
from django import forms

from django.utils.timezone import now
## models
from .models import *
from datetime import datetime
from django.core.exceptions import ValidationError

class RegisterForm(UserCreationForm):
    class Meta:
        model = Users
        fields = ['username', 'birth_date', 'first_name', 'last_name']

    def clean_birth_date(self):
        dob = self.cleaned_data.get("birth_date")
        if dob > now().date():
            raise ValidationError(
                "Date Of Birth Must Not Be Future"
            )
        return dob
    

class EventsForm(forms.ModelForm):
    ROUTINE = {
        0: 'Once',
        1: 'Daily',
        2: 'Weekly',
        3: 'Monthly',
        4: 'Annually'
    }
    routine = forms.IntegerField(widget=forms.Select(attrs={'class': 'w-full text-black p-2 border border-brown-700 rounded'},choices=ROUTINE))
    noti_time = forms.TimeField(label="Notification Time",widget=forms.TimeInput(attrs={
            'id': 'eventTime',
            'type': 'time',
            'placeholder': 'Event Time',
            'class': 'w-full text-black p-2 border border-brown-700 rounded'
        }))
    class Meta:
        model = Events
        fields = ['name', 'description', 'noti_time', 'routine', 'family']
        widgets = {
            'name': forms.TextInput(attrs={
                'id': 'eventName',
                'placeholder': 'Event Name',
                'class': 'w-full text-black p-2 border border-brown-700 rounded'
            }),
            'description': forms.Textarea(attrs={
                'id': 'eventDescription',
                'placeholder': 'Event Description',
                'class': 'w-full text-black p-2 border border-brown-700 rounded',
                'rows': 3
            }),
            'noti_date': forms.DateInput(attrs={
                'type': 'date',
                'class': 'w-full text-black p-2 border border-brown-700 rounded'
            }),
            'family': forms.Select(attrs={
                'class': 'w-full text-black p-2 border border-brown-700 rounded'
            }),
        }
    
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user')  # Extract 'user' from kwargs
        super(EventsForm, self).__init__(*args, **kwargs)
        
        # Dynamically set the queryset for the select field based on the user
        self.fields['family'].queryset = Family.objects.filter(users=user)
