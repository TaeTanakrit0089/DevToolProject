from rest_framework import serializers
from remindme.models import Users

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = "__all__"