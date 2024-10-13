FROM python:3.11
WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY . .
#COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000