FROM ubuntu:latest

WORKDIR /app
COPY ./ ./

ADD manage.py manage.py

USER root

RUN apt-get update && apt-get install -y python3.10
RUN apt-get update

RUN apt install -y python3-pip

RUN python3 -m pip install -r requirements.txt

RUN pip freeze

ADD app app

EXPOSE 8080

RUN python manage.py runserver 8080
