FROM python:3.4

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN pip install django psycopg2 djangorestframework pygments python-dotenv
RUN python manage.py makemigrations
RUN python manage.py migrate
COPY . .

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "backend:8000"]
