from django.contrib.auth.forms import UserCreationForm
from .models import Users

class RegisterForm(UserCreationForm):
    class Meta:
        model = Users
        fields = ['birth_date', 'first_name', 'last_name']