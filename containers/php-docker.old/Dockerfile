FROM php:7.1-apache

ADD ./public/setup.sh /tmp/setup.sh
RUN bash /tmp/setup.sh

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# docker rmi $(docker images -q)
# docker rm -f $(docker ps -a -q)