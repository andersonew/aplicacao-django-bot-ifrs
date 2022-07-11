FROM python:3.8

WORKDIR /app

ADD requirements.txt requirements.txt

ADD manage.py manage.py

RUN pip install -r requirements.txt

ADD app app

EXPOSE 8080

CMD ["python", "manage.py", "runserver"]
