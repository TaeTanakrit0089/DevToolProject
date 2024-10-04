# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /devtool_system

COPY . .

RUN apt-get update && apt-get install -y libpq-dev && apt-get install -y nodejs && apt-get install -y npm && apt-get install -y nginx

RUN unlink /etc/nginx/sites-enabled/default
RUN yes | cp -rf reverse-proxy.conf /etc/nginx/sites-available/reverse-proxy.conf
RUN ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
RUN yes | cp -rf nginx.conf /etc/nginx/nginx.conf

COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN npm install

EXPOSE 8000

CMD ["npm", "run", "build"]
