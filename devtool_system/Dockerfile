FROM node:lts-alpine3.20
WORKDIR /src
COPY . .
RUN npm install
RUN npm run build

FROM python:3.11.10-alpine
WORKDIR /app

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

COPY . .
COPY --from=0 /src/static/tailwind/output.css /devtool_system/static/tailwind/output.css
RUN pip install -r requirements.txt

EXPOSE 8000