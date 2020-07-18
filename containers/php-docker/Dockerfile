FROM php:7.4-apache

ADD ./public/install.sh /tmp/install.sh
RUN bash /tmp/install.sh

#CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
# docker rm -f $(docker ps -a -q); docker rmi $(docker images -q);