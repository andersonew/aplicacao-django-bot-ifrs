# use base python image with python 2.7
FROM python:3.10

# set working directory to /app/
WORKDIR .
ADD . .
USER root

RUN pip install Django
RUN pip install psycopg2
RUN pip install psycopg2-binary
RUN pip install Pillow

RUN python manage.py runserver 0.0.0.0:8080
