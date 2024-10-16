from django.utils.timezone import now, localtime
from rest_framework import serializers

from remindme.models import *


class UsersSerializer(serializers.ModelSerializer):
    events_set = serializers.SerializerMethodField()

    class Meta:
        model = Users
        fields = ["id", "first_name", "last_name", "is_active", "birth_date", "events_set"]

    def get_events_set(self, instance):
        event = instance.events_set.all().order_by('noti_time')
        return EventSerializer(event, many=True).data


class FamilySerializer2(serializers.ModelSerializer):
    class Meta:
        model = Family
        fields = ["id", "name", "color"]


class UsersSerializer2(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = ["id", "first_name", "last_name"]


class EventSerializer(serializers.ModelSerializer):
    display_family = FamilySerializer2(source="family", read_only=True)
    display_user = UsersSerializer2(source="user", read_only=True)

    class Meta:
        model = Events
        fields = ["id", "user", "name", "description", "noti_date", "noti_time", "routine", "family", "display_family",
                  "display_user"]
        extra_kwargs = {
            'family': {'write_only': True},
            'user': {'write_only': True}
        }

    def validate(self, data):
        now_time = localtime(now())
        if (data['noti_date'] < now_time.date() or (
                data['noti_date'] <= now_time.date() and data['noti_time'] < now_time.time())) and data['routine'] == 0:
            raise serializers.ValidationError("Cannot add event to the past.")
        return data


class FamilySerializer(serializers.ModelSerializer):
    display_users = UsersSerializer(source="users", read_only=True, many=True)
    events_set = EventSerializer(read_only=True, many=True)

    class Meta:
        model = Family
        fields = ["id", "name", "token", "users", "display_users", "events_set", "color"]
        extra_kwargs = {
            'users': {'write_only': True}
        }
