FROM ubuntu:latest

USER root

WORKDIR /app
COPY ./ ./

ADD manage.py manage.py

RUN sudo apt update
RUN sudo apt install python3-pip

RUN python3 -m venv tutorial-env
RUN source tutorial-env/bin/activate

RUN python -m pip install -r requirements.txt

RUN pip freeze

ADD app app

EXPOSE 8080

RUN python manage.py runserver 8080
