from django.urls import path
from . import views
from .views import *

urlpatterns = [
    path("", HomePage.as_view(), name="home"),
    path("calendar/", CalendarView.as_view(), name="calendar_page"),
    # path("calendar/events/<str:date>/", GetEventsByDateView.as_view(), name='events_by_date'),

    path("family/", FamilyView.as_view(), name="family"), # GET method
    path("family/create/<str:name>/", FamilyView.as_view(), name='create_family'), # POST method
    path('family/join/<str:token>/', FamilyView.as_view(), name='join_family'), # PUT method for joining family
    path("family/delete/<int:family_id>/", FamilyView.as_view(), name="family"), # DELETE method

    path('editfamily/<int:family_id>/remove-member/<int:user_id>/', FamilyMemberView.as_view(), name='remove_family_member'),
    path("test/", TestView.as_view(), name="test"),
]