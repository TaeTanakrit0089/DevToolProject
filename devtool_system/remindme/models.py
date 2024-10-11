from django.db import models
from django.contrib.auth.models import User, AbstractUser

# เพิ่ม Birthdate
class Users(AbstractUser):
    birth_date = models.DateField()

# Create your models here.
class Family(models.Model):
    name = models.CharField(max_length=200)
    token = models.CharField(max_length=6) # TOKEN for Invite
    color = models.CharField(max_length=6, default="5f3c3e") # Selected color by user
    users = models.ManyToManyField(Users)

    def __str__(self):
        return self.name
    
    class Meta:
        ordering = ['id']
    
class Events(models.Model):
    ROUTINE = {
        0: 'once',
        1: 'daily',
        2: 'weekly',
        3: 'monthly',
        4: 'annually'
    }
    user = models.ForeignKey(Users, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    noti_date = models.DateField()
    noti_time = models.TimeField()
    routine = models.IntegerField(choices=ROUTINE, default=0)
    family = models.ForeignKey(Family, null=True, on_delete=models.CASCADE)
    create_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return "%s %s %s"%(self.name, self.noti_date, self.noti_time)
    
    class Meta:
        ordering = ['noti_date', 'noti_time']