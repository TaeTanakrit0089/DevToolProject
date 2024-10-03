from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Family(models.Model):
    name = models.CharField(max_length=200)
    token = models.CharField(max_length=10) # TOKEN for Invite
    user = models.ManyToManyField(User)
    
class Events(models.Model):
    ROUTINE = {
        0: 'once',
        1: 'daily',
        2: 'weekly',
        3: 'monthly',
        4: 'annually'
    }
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    noti_date = models.DateField()
    noti_time = models.TimeField()
    routine = models.IntegerField(choices=ROUTINE, default=0)
    family = models.ForeignKey(Family, null=True, on_delete=models.CASCADE)
    create_at = models.DateTimeField(auto_now_add=True)