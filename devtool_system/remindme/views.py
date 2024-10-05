from django.contrib.auth import login
from django.shortcuts import render, redirect, resolve_url
from django.views import View

## models
from .models import *

## form
from .forms import *

from django.utils.timezone import now

# Create your views here.

class HomePage(View):
    def get(self, request):
        return render(request, 'index.html')
    def post(self, request):
        pass
    
class RegisterView(View):
    def get(self, request):
        # if (request.user.is_authenticated):
        #     return redirect("home")
        form = RegisterForm()
        return render(request, "register.html", {
            "form": form,
            "now": now().date()
        })
    
    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("home") # กลับไปหน้าหลัก มีการ Setting.py อยู่แล้วจึงไม่จำเป็นต้อง Redirect อีก
        return render(request, "register.html", {
            "form": form,
            "now": now().date() # ถ้า form ผิดส่ง now date มาด้วย
        })

class TestView(View):
    def get(self, request):
        form = EventForm(user=request.user)
        base_url = request.build_absolute_uri('/')[:-1]
        return render(request, "test.html", {"form": form, "base_url": base_url})