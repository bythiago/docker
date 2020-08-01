FROM edurekain/php5.5apache

MAINTAINER Thiago Vieira <thiiagovieir@gmail.com>

RUN apt-get update
RUN apt-get -y upgrade

# Install Apache2 / PHP 5.6 & Co.
RUN apt-get -y install php5-dev php-pear libaio1

# Install OCI8
ADD ./oracle/oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.rpm /tmp/
ADD ./oracle/oracle-instantclient11.2-devel-11.2.0.1.0-1.x86_64.rpm /tmp/
ADD ./public/php-5.5.9.tar.bz2 /tmp/
# ADD ./public/install.sh /tmp/
# RUN bash /tmp/install.sh

# Enable Apache2 modules
RUN a2enmod rewrite

# Set up the Apache2 environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

# Run Apache2 in Foreground
CMD /usr/sbin/apache2 -D FOREGROUND

# docker rm -f $(docker ps -a -q); 
# docker rmi $(docker images -q);