FROM docker:latest

# add the docker-compose.yml file to the current working directory
WORKDIR /
ADD . /

# install docker-compose
RUN \
  apk add --update --no-cache python3 && \
  pip3 install docker-compose

RUN docker-compose up -d
