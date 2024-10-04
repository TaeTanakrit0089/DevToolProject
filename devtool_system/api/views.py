from rest_framework.authtoken.models import Token
from django.views.decorators.csrf import csrf_exempt

from django.shortcuts import render, get_object_or_404
from .serializers import *
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import UserCreationForm

# from rest_framework.authentication import SessionAuthentication, BasicAuthentication
# from rest_framework.permissions import IsAuthenticated

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

from io import BytesIO

from rest_framework.parsers import JSONParser
from rest_framework.renderers import JSONRenderer

from json import loads

from remindme.forms import RegisterForm

# Create your views here.
class Register(APIView):
    def post(self, request):
        serializer = UserSerializer(data=request.data)
        form = RegisterForm(request.data)
        if form.is_valid():
            if serializer.is_valid():
                form.save()
                return Response(status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        return Response(loads(form.errors.as_json()), status=status.HTTP_400_BAD_REQUEST)

class Login(APIView):
    def post(self, request, format=None):
        try:
            username = request.data.get('username')
            password = request.data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                token = Token.objects.get_or_create(user=user)
                context = {
                    'token': str(token[0])
                }
                return Response(context)
        except Exception:
            return Response({'user': ['email or password incorrect.']}, status=status.HTTP_400_BAD_REQUEST)
        return Response({'user': ['email or password incorrect.']}, status=status.HTTP_400_BAD_REQUEST)