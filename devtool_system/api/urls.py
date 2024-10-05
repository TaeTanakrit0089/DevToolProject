from django.urls import path
from .views import *

urlpatterns = [
    path("family/", FamilyList.as_view(), name="family_list"),
    path("family/<int:pk>/", FamilyAction.as_view(), name="family_action"),
    path("join/<str:token>/", JoinFamily.as_view(), name="join_family"),
    path("events/", EventList.as_view(), name="event_list"),
    path("events/<int:pk>/", EventAction.as_view(), name="events_action"),
]