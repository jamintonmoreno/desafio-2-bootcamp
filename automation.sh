#!/bin/bash

chmod u+x automation.sh

mkdir -p tempdir/static tempdir/templates
cd tempdir
git init 
git remote add origin https://github.com/jamintonmoreno/desafio-2-bootcamp.git
git add .
git commit -m "ADD: Inicio de la app"
git pull origin master

touch Dockerfile

echo "FROM python" >> Dockerfile
echo "RUN pip install flask" >> Dockerfile
echo "COPY ./static /home/myapp/static/" >> Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> Dockerfile
echo "COPY desafio2_app.py /home/myapp/" >> Dockerfile
echo "EXPOSE 5050" >> Dockerfile
echo "CMD python3 /home/myapp/desafio2_app.py" >> Dockerfile

docker build -t desafio2_app .
docker run -t -d -p 5050:5050 --name nombreapprunning desafio2_app
docker ps -a
