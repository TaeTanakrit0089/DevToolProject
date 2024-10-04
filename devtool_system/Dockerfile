# 1. Use an official Python runtime as a parent image
FROM python:3.11-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /devtool_system

COPY . /devtool_system/

RUN apt-get update && apt-get install -y libpq-dev

COPY ./requirements.txt .
RUN pip install -r requirements.txt
