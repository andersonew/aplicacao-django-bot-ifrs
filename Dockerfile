FROM ubuntu:latest

WORKDIR /app

ADD manage.py manage.py

RUN sudo apt install python3-pip

RUN sudo apt-get update

RUN sudo apt install python3-django

RUN sudo apt install python3-djangorestframework

RUN sudo apt install python3-psycopg2

RUN pip install Pillow

ADD app app

EXPOSE 8080
