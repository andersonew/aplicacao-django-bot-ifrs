#!/bin/sh


while ! curl --max-time 30 http://db:5432/ 2>&1 | grep '52'
do
    echo "Aguardando o banco de dados..."
    sleep 1
done

echo "Database is ready"
cd principal


python manage.py makemigrations principal
echo "Created migrations"

python manage.py migrate
echo "Migrated DB to latest version"

python manage.py runserver 0.0.0.0:8080