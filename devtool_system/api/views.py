from django.shortcuts import render, get_object_or_404
from .serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from remindme.models import *
from django.core.exceptions import PermissionDenied
from django.utils.decorators import method_decorator

from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated

from io import BytesIO

from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer

from json import loads

from string import ascii_letters
from random import randint
def random_string(length=0):
    text = ""
    random_ = ascii_letters+"0123456789"
    for _ in range(length):
        text += random_[randint(0, 61)]
    return text

def get_token_family():
    token = random_string(6)
    while Family.objects.filter(token=token).count():
        token = random_string(6)
    return token

def check_family(pk, user):
    try:
        family = Family.objects.get(pk=pk)
        return user.id in family.users.values_list("id", flat=True)
    except Family.DoesNotExist:
        return False

def check_event(pk, user):
    try:
        event = Events.objects.get(pk=pk)
        return user.id == event.user.id or event.family in user.family_set.values_list("id", flat=True)
    except Events.DoesNotExist:
        return False

# Create your views here.
class FamilyList(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    # Get ALL FAMILY
    def get(self, request):
        family = Family.objects.filter(users=request.user)
        serializer = FamilySerializer(family, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    # Initial Family / Create Family
    def post(self, request):
        # example request.data
        # {
        #     "users": [1],
        #     "name": "test Family"
        # }
        request.data['token'] = get_token_family()
        serializer = FamilySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class FamilyAction(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    # Get one family
    def get(self, request, pk):
        if not check_family(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        family = get_object_or_404(Family, pk=pk)
        serializer = FamilySerializer(family)
        return Response(serializer.data)
    
    # Update family's name
    def patch(self, request, pk):
        # example request.data
        # {
        #     "name": "test Family2"
        # }
        if not check_family(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        request.data['token'] = get_token_family()
        family = get_object_or_404(Family, pk=pk)
        serializer = FamilySerializer(family, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    # Delete family's name
    def delete(self, request, pk):
        if not check_family(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        family = get_object_or_404(Family, pk=pk)
        family.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class JoinFamily(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    def post(self, request, token):
        try:
            family = Family.objects.get(token=token)
            family.users.add(request.user)
            return Response(status=status.HTTP_200_OK)
        except Family.DoesNotExist:
            return Response({"detail": "There's a wrong token"}, stauts=status.HTTP_400_BAD_REQUEST)

class EventList(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    # Get all events
    def get(self, request):
        event = Events.objects.filter(user=request.user)
        serializer = EventSerializer(event, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    # Create event
    def post(self, request):
        # example request.data
        # {
        #     "user": 1,
        #     "name": "event",
        #     "noti_date": "2024-01-01",
        #     "noti_time": "11:00:00",
        #     "description": "str", Optional
        #     "family": int, Optional
        # }
        serializer = EventSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response()
        return Response(serializer.errors, stauts=status.HTTP_400_BAD_REQUEST)
    
class EventAction(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]
    
    # Get one event
    def get(self, request, pk):
        if not check_event(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        event = get_object_or_404(Events, pk=pk)
        serializer = EventSerializer(event)
        return Response(serializer.data)
    
    # Update one event
    def patch(self, request, pk):
        # example request.data Optional
        # {
        #     "name": "event",
        #     "noti_date": "2024-03-01",
        #     "noti_time": "11:00:00",
        #     "family": 1,
        #     "routine": 1
        # }
        if not check_event(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        event = get_object_or_404(Events, pk=pk)
        serializer = EventSerializer(event, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    # Delete one event
    def delete(self, request, pk):
        if not check_event(pk, request.user):
            return Response(status=status.HTTP_403_FORBIDDEN)

        event = get_object_or_404(Events, pk=pk)
        event.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)