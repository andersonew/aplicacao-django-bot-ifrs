FROM alpine:3.16

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

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
