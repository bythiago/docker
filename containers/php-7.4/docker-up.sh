#!/bin/sh

docker build -t php7.4 -f Dockerfile . \
&& docker-compose up -d --no-recreate && docker exec -it php7.4 bash