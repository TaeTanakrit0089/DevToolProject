from django.shortcuts import render
from django import views


# Create your views here.

class HomePage(views.View):
    def get(self, request):
        return render(request, 'index.html')