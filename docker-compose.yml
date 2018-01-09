version: '3.3'

services:

  db:
    build: db
    image: dockersamples/k8s-wordsmith-db

  words:
    build: words
    image: dockersamples/k8s-wordsmith-api
    deploy:
      replicas: 5

  web:
    build: web
    image: dockersamples/k8s-wordsmith-web
    ports:
     - "8080:80"