from django.contrib.auth import login
from django.shortcuts import render, redirect
from django.views import View
from django.http import JsonResponse

## models
from .models import *

## form
from .forms import *

from django.utils.timezone import now


# Create your views here.

class HomePage(View):
    def get(self, request):
        return render(request, 'index.html')
    
class RegisterView(View):
    def get(self, request):
        if (request.user.is_authenticated):
            return redirect("home")
        form = RegisterForm()
        return render(request, "register.html", {
            "form": form,
            "now": now().date()
        })
    
    def post(self, request):
        form = RegisterForm(request.POST)
        print('username=', form['username'])
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("home") # กลับไปหน้าหลัก มีการ Setting.py อยู่แล้วจึงไม่จำเป็นต้อง Redirect อีก
        return render(request, "register.html", {
            "form": form,
            "now": now().date() # ถ้า form ผิดส่ง now date มาด้วย
        })
    
class CalendarView(View):
    def get(self, request):
        form = EventsForm()
        return render(request, "calendar.html", {'form': form})

    def post(self, request):
        form = EventsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('calendar_page')
        return render(request, "calendar.html", {'form': form})

class GetEventsByDateView(View):
    def get(self, request, date):
        # ค้นหากิจกรรมในวันที่ระบุ
        events = list(Events.objects.filter(noti_date=date).values('noti_time', 'name', 'description'))

        for event in events:
            event['noti_time'] = event['noti_time'].strftime("%H:%M")  # แปลงเป็นสตริง เช่น '16:00'

        if not events:  # ถ้าไม่มีข้อมูล
            return JsonResponse([], safe=False)  # ส่งกลับเป็นลิสต์ว่าง

        return JsonResponse(events, safe=False)  # ส่งกลับข้อมูลกิจกรรม
