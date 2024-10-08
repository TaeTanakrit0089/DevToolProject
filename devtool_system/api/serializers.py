from rest_framework import serializers
from remindme.models import *
from django.utils.timezone import now, localtime

class EventSerializer(serializers.ModelSerializer):
    class Meta:
        model = Events
        fields = ["id", "user", "name", "description", "noti_date", "noti_time", "routine", "family"]
    def validate(self, data):
        now_time = localtime(now())
        if not (data['noti_date'] >= now_time.date() and data['noti_time'] >= now_time.time()):
            serializers.ValidationError("Cannot add event to the past.")
        return data

class UsersSerializer(serializers.ModelSerializer):
    events_set = serializers.SerializerMethodField()
    
    class Meta:
        model = Users
        fields = ["id", "first_name", "last_name", "is_active", "birth_date", "events_set"]
    
    def get_events_set(self, instance):
        event = instance.events_set.all().order_by('noti_time')
        return EventSerializer(event, many=True).data

class FamilySerializer(serializers.ModelSerializer):
    display_users = UsersSerializer(source="users", read_only=True, many=True)
    events_set = EventSerializer(read_only=True, many=True)
    
    class Meta:
        model = Family
        fields = ["id", "name", "token", "users", "display_users", "events_set"]
        extra_kwargs = {
            'users': {'write_only': True}
        }