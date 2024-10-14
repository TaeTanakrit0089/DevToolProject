#!/bin/sh

python manage.py makemigrations
python manage.py migrate

python manage.py collectstatic --no-input

# --workers 3 
gunicorn devtool_system.wsgi:application --bind web:8000