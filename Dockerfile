FROM ubuntu:latest

USER root

RUN apt-get update && apt-get install -y python3.10 python3-pip

WORKDIR /app
COPY ./ ./

ADD manage.py manage.py

RUN python3 -m venv ./venv
RUN source tutorial-env/bin/activate

RUN python -m pip install -r requirements.txt

RUN pip freeze

ADD app app

EXPOSE 8080

RUN python manage.py runserver 8080
