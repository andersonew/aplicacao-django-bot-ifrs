# use base python image with python 2.7
FROM python:3.10.5

# set working directory to /app/
WORKDIR /app/

COPY ./requirements.txt ./

USER root

RUN pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . .

RUN python manage.py runserver 0.0.0.0:8080
