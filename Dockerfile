# use base python image with python 2.7
FROM python:2.7

# set working directory to /app/
WORKDIR /app/

COPY ./requirements.txt ./

USER root

RUN pip install -r requirements.txt

# copy code base to the image
COPY . .

RUN python manage.py runserver 0.0.0.0:8080
