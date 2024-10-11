from django.urls import path
from .views import *

urlpatterns = [
    path("family/", FamilyList.as_view(), name="family_list"),
    path("family/<int:pk>/", FamilyAction.as_view(), name="family_action"),
    path("join/<str:token>/", JoinFamily.as_view(), name="join_family"),
    path("events/", EventList.as_view(), name="event_list"),
    path("events/<int:pk>/", EventAction.as_view(), name="events_action"),
    path("events/user/<int:year>/", user_event_year, name="event_user_year"),
    path("events/user/<int:year>/<int:month>/", user_event_month, name="event_user_month"),
    path("events/user/<int:year>/<int:month>/<int:day>/", user_event_day, name="event_user_day"),
    path("events/user/<int:year>/<int:month>/count/", user_event_month_count, name="event_user_count"),
    
    path("member/<int:familyID>/<int:userID>/", MemberAction.as_view(), name="member_action"),
]