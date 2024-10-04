from django.contrib.auth import login
from django.shortcuts import render, redirect
from django.views import View

## models
from .models import *

## form
from .forms import RegisterForm


# Create your views here.

class HomePage(View):
    def get(self, request):
        return render(request, 'index.html')
    
class RegisterView(View):
    def get(self, request):
        if (request.user.is_authenticated):
            return redirect("index")
        form = RegisterForm()
        return render(request, "register.html", {
            "form": form
        })
    
    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("index") # กลับไปหน้าหลัก มีการ Setting.py อยู่แล้วจึงไม่จำเป็นต้อง Redirect อีก
        return render(request, "register.html", {
            # "form": form
        })
