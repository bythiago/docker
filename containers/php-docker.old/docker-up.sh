docker build -t php7.1 -f Dockerfile . \
&& docker-compose up -d && docker exec -it php7.1 bash
