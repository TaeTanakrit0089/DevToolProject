# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y libpq-dev

# 2. Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Copy the requirements file into the container
COPY requirements.txt /app/

# 5. Install the required dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# 6. Copy the rest of the Django project code into the container
COPY . /app/

# 9. Expose the port that Django will run on (default is 8000)
EXPOSE 8000

RUN python manage.py migrate

# 10. Use the entrypoint script to start the container
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
