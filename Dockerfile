FROM alpine:3.16

WORKDIR /app

COPY ./ ./

ADD manage.py manage.py

USER root

RUN apt install python3-django

RUN apt install python3-djangorestframework

RUN apt install python3-psycopg2

RUN pip install Pillow

ADD app app

EXPOSE 8080
