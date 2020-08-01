#!/bin/sh
docker build -t php5.6 -f Dockerfile . \
&& docker-compose up -d && docker exec -it php5.6 /bin/bash