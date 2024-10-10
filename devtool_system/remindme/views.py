from django.contrib.auth import login
from django.shortcuts import render, redirect, resolve_url, get_object_or_404
from django.views import View
from django.http import JsonResponse

## models
from .models import *

## form
from .forms import *

from django.utils.timezone import now, timedelta, localtime
from dateutil.relativedelta import relativedelta
from django.db.models import Q

# Create your views here.
def update_events():
    now_time = localtime(now())
    events = Events.objects.filter(routine__range=(1, 4)).filter(Q(noti_date__lt=now_time.date()) | Q(noti_date__lte=now_time.date(), noti_time__lt=now_time.time()))
    for event in events:
        plus_time = (now_time.date()-event.noti_date) + timedelta(days=1)
        if event.routine == 2:
            plus_time = timedelta(weeks=1)
        elif event.routine == 3:
            plus_time = relativedelta(months=1)
        elif event.routine == 4:
            plus_time = relativedelta(years=1)
        event.noti_date += plus_time
        event.save()

class HomePage(View):
    def get(self, request):
        return render(request, 'index.html')
    def post(self, request):
        pass
    
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
        update_events()
        form = EventsForm(user=request.user)
        return render(request, "calendar.html", {'form': form})

    def post(self, request):
        form = EventsForm(request.POST, user=request.user)
        print(f"form is valid: {form.is_valid()}")
        print(form.errors)  

        if form.is_valid():
            new_event = form.save(commit=False)
            new_event.user = request.user
            new_event.noti_date = request.POST.get('noti_date')
            new_event.save()
            return redirect('calendar_page')
        return render(request, "calendar.html", {'form': form})

class FamilyView(View):
    def get(self, request):
        user_families = Family.objects.filter(users=request.user)
        # print("User families:", user_families)
        # print("Current user:", request.user)
        return render(request, "family.html", {'user_families': user_families})
    
    def post(self, request, name):
        try:
            family = Family.objects.create(name=name)
            family.users.add(request.user)
            return JsonResponse({'message': f'Family "{family.name}" created successfully.', 'name': family.name}, status=201)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
        
    def put(self, request, token):
        try:
            family = get_object_or_404(Family, token=token)
            family.users.add(request.user)
            return JsonResponse({'message': f'You have joined the family "{family.name}".'}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    
    def delete(self, request, family_id):
        if request.method == 'DELETE':
            family = get_object_or_404(Family, id=family_id)
            family.delete()
            return JsonResponse({'message': f'Family "{family.name}" deleted successfully.'}, status=200)
        return JsonResponse({'error': 'Invalid request method.'}, status=405)

class TestView(View):
    def get(self, request):
        form = EventsForm(user=request.user)
        base_url = request.build_absolute_uri('/')[:-1]
        return render(request, "test.html", {"form": form, "base_url": base_url})
