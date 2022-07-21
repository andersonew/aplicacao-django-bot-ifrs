FROM alpine:3.16

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app

COPY ./ ./

ADD manage.py manage.py

USER root

RUN pip install django

RUN pip install djangorestframework

RUN pip install django-filter

RUN pip install markdown

RUN pip install Pillow

RUN pip install psycopg2-binary

ADD app app

EXPOSE 8080
