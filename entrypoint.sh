#!/usr/bin/env bash

# Wait for the PostgreSQL server to be available
while ! nc -z $DB_HOST 5432; do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

# Apply database migrations
python manage.py migrate

# Start Django server
exec "$@"
