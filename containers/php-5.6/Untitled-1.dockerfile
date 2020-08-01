FROM edurekain/php5.5apache

LABEL key="Thiago Vieira <thiiagovieir@gmail.com>"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install php5-dev alien

# Install OCI8
ADD ./oracle/oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.rpm /tmp/
ADD ./oracle/oracle-instantclient11.2-devel-11.2.0.1.0-1.x86_64.rpm /tmp/
ADD ./public/php-5.5.9.tar.bz2 /tmp/php-5.5.9.tar.bz2

RUN cd /tmp \
    alien -d oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.rpm \
    alien -d oracle-instantclient11.2-devel-11.2.0.1.0-1.x86_64.rpm \
    dpkg -i oracle-instantclient11.2-basic_11.2.0.1.0-2_amd64.deb \
    dpkg -i oracle-instantclient11.2-devel_11.2.0.1.0-2_amd64.deb

RUN export ORACLE_HOME=/usr/lib/oracle/11.2/client64 \
    export LD_LIBRARY_PATH=$ORACLE_HOME/lib \
    sudo ldconfig

RUN cd /tmp \
    cd php-5.5.9/ext/pdo_oci \
    phpize \
    ./configure \
    ln -s /usr/include/php5/ /usr/include/php \
    make \
    echo "EXTRA_INCLUDES = -I/usr/include/oracle/11.2/client64" >> Makefile \
    make install

RUN touch /etc/php5/mods-available/pdo_oci.ini
RUN echo "; priority=20" >> /etc/php5/mods-available/pdo_oci.ini
RUN echo "extension=pdo_oci.so" >> /etc/php5/mods-available/pdo_oci.ini

RUN php5enmod pdo_oci
RUN service apache2 restart

#ENTRYPOINT ["docker-entrypoint.sh"]