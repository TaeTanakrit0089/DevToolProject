# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /devtool_system

COPY . .

RUN pip install -r requirements.txt

EXPOSE 8000
