#!/bin/sh

# wait for PSQL server to start
while ! curl --max-time 30 http://db:5432/ 2>&1 | grep '52'
do
    echo "Waiting for database..."
    sleep 1
done

echo "Database is ready"
cd app

# start development server on public ip interface, on port 8000
python3 manage.py runserver 8080

