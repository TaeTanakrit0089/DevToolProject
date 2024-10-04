# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y libpq-dev

WORKDIR /app

COPY . .

RUN pip install --upgrade pip
RUN pip install django psycopg2-binary python-dotenv djangorestframework pygments

RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "web:8000"]
