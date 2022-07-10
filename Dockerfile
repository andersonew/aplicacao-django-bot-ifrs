# use base python image with python 2.7
FROM python:3.10.5

# set working directory to /app/
WORKDIR /app/

USER root

RUN python3 -m venv ./venv
RUN venv\Scripts\activate.bat
RUN pip install Django
RUN pip install psycopg2
RUN pip install psycopg2-binary
RUN pip install Pillow

COPY . .

RUN python manage.py runserver 0.0.0.0:8080
