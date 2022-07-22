FROM ubuntu:latest

WORKDIR /app
COPY ./ ./

ADD manage.py manage.py

USER root

RUN apt-get update && apt-get install -y python3.10
RUN apt-get update

RUN apt install -y python3-pip

RUN apt install python3-django
RUN python3 pip install Pillow
RUN python3 pip install psycopg2-binary
RUN python3 pip install djangorestframework
RUN python3 pip install django-filter
RUN python3 pip install markdown
RUN pip freeze

ADD app app

EXPOSE 8080

RUN python manage.py runserver 8080
