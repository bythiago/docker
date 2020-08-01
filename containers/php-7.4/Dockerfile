FROM php:7.4-apache

ADD ./public/install.sh /tmp/install.sh
RUN bash /tmp/install.sh

ADD ./public/after.sh /tmp/after.sh
RUN bash /tmp/after.sh

# docker rm -f $(docker ps -a -q); 
# docker rmi $(docker images -q);