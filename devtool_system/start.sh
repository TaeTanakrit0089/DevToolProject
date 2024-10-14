#!/bin/sh

python manage.py makemigrations
python manage.py migrate

# Wait for the NPM build to complete
while [ ! -f /app/.tailwind_build_complete ]; do
  echo "Waiting for npm build to complete..."
  sleep 1
done

python manage.py collectstatic --no-input

# --workers 3 
gunicorn devtool_system.wsgi:application --bind web:8000