from django.contrib.auth.forms import UserCreationForm
from django import forms

from django.utils.timezone import now, localtime
## models
from .models import *
from datetime import datetime, timedelta
from django.core.exceptions import ValidationError

class RegisterForm(UserCreationForm):
    class Meta:
        model = Users
        fields = ['username', 'birth_date', 'first_name', 'last_name']

    def clean_birth_date(self):
        dob = self.cleaned_data.get("birth_date")
        if dob > localtime(now()).date():
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
    class Meta:
        model = Events
        fields = ['name', 'description', 'noti_time', 'routine', 'family']
        widgets = {
            'name': forms.TextInput(attrs={
                'id': 'eventName',
                'placeholder': 'Event Name',
                'class': 'w-full text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition'
            }),
            'description': forms.Textarea(attrs={
                'id': 'eventDescription',
                'placeholder': 'Event Description',
                'class': 'w-full text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition',
                'rows': 3
            }),
            'noti_date': forms.DateInput(attrs={
                'type': 'date',
                'class': 'text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition'
            })
        }
    routine = forms.IntegerField(widget=forms.Select(attrs={
            'class': 'text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition'
        },choices=ROUTINE))
    noti_time = forms.TimeField(label="Notification Time",widget=forms.TimeInput(attrs={
            'id': 'eventTime',
            'type': 'time',
            'placeholder': 'Event Time',
            'class': 'text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition',
            'min': (localtime(now())+timedelta(minutes=1)).strftime("%H:%M"),
            'value': (localtime(now())+timedelta(minutes=1)).strftime("%H:%M")
        }))
    family = forms.ModelChoiceField(queryset=Family.objects.filter(id=None), help_text="Will make family's events, if selected.", widget=forms.Select(attrs={
            'class': 'w-fit text-brown-950 rounded-lg shadow-sm bg-[#f9fbfc] dark:bg-brown-200 border focus:border border-gray-300 dark:border-gray-600 focus:border-[#4c569b] py-2 px-3 transition'
        }))
    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user')  # Extract 'user' from kwargs
        super(EventsForm, self).__init__(*args, **kwargs)
        
        # Dynamically set the queryset for the select field based on the user
        self.fields['family'].queryset = Family.objects.filter(users=user)
