from rest_framework import serializers
from remindme.models import *
class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Events
        fields = ["id", "user", "name", "description", "noti_date", "noti_time", "routine", "family"]

class UsersSerializer(serializers.ModelSerializer):
    events_set = EventSerializer(read_only=True, many=True)
    
    class Meta:
        model = Users
        fields = ["id", "first_name", "last_name", "is_active", "birth_date", "events_set"]

class FamilySerializer(serializers.ModelSerializer):
    display_users = UsersSerializer(source="users", read_only=True, many=True)
    events_set = EventSerializer(read_only=True, many=True)
    
    class Meta:
        model = Family
        fields = ["id", "name", "token", "users", "display_users", "events_set"]
        extra_kwargs = {
            'users': {'write_only': True}
        }