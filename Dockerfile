FROM ubuntu:latest

USER root

WORKDIR /app
COPY ./ ./

ADD manage.py manage.py

RUN apt-get update 

RUN apt-get install python

RUN python3 -m venv tutorial-env
RUN venv/Scripts/activate.bat

RUN python -m pip install -r requirements.txt

RUN pip freeze

ADD app app

EXPOSE 8080

RUN python manage.py runserver 8080
