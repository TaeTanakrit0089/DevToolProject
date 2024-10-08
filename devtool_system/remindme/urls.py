from django.urls import path
from . import views
from .views import *

urlpatterns = [
    path("", HomePage.as_view(), name="home"),
    path("calendar/", CalendarView.as_view(), name="calendar_page"),
    # path("calendar/events/<str:date>/", GetEventsByDateView.as_view(), name='events_by_date'),
    path("family/", FamilyView.as_view(), name="family"),
    path("test/", TestView.as_view(), name="test"),
]