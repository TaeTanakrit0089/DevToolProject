# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /devtool_system

COPY . .

RUN apt-get update && apt-get install -y libpq-dev && apt-get install -y nodejs && apt-get install -y npm

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN npm install

EXPOSE 8000

CMD ["npm", "run", "start"]
