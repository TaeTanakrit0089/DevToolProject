FROM lts-alpine3.20
WORKDIR /src
COPY . .
RUN npm install
RUN npm run build

FROM python:3.11.10-alpine
WORKDIR /devtool_system

COPY . .
COPY --from=0 /src/static/tailwind/output.css /devtool_system/static/tailwind/output.css
RUN pip install -r requirements.txt

EXPOSE 8000
CMD [ "py", "manage.py", "runserver" ]