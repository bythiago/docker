FROM edurekain/php5.5apache

LABEL key="Thiago Vieira <thiiagovieir@gmail.com>"

RUN apt-get update
RUN apt-get install -y php5 php5-cli php5-dev php-pear libxml2-dev
RUN apt-get install -y libzip-dev git ruby-full build-essential re2c libaio1 unzip wget ca-certificates
RUN rm -rf /var/lib/apt/lists/*

# Install Packages
#ADD ./public/install.sh /tmp/install.sh
#RUN bash /tmp/install.sh

# Install OCI8
ADD ./oracle/oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.zip /tmp/
ADD ./oracle/oracle-instantclient11.2-sdk-11.2.0.1.0-1.x86_64.zip /tmp/
ADD ./public/php-5.5.9.zip /tmp

# Install Oracle Instant Client Basic and SDK
RUN mkdir -p /opt/oracle/instantclient && \
    unzip /tmp/oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.zip -d /opt/oracle && \
    mv /opt/oracle/instantclient_11_2 /opt/oracle/instantclient/lib && \
    unzip /tmp/oracle-instantclient11.2-sdk-11.2.0.1.0-1.x86_64.zip -d /opt/oracle && \
    mv /opt/oracle/instantclient_11_2/sdk/include /opt/oracle/instantclient/include && \
    ln -s /opt/oracle/instantclient/lib/libclntsh.so.11.1 /opt/oracle/instantclient/lib/libclntsh.so && \
    ln -s /opt/oracle/instantclient/lib/libocci.so.11.1 /opt/oracle/instantclient/lib/libocci.so && \
    echo '/opt/oracle/instantclient/lib' >> /etc/ld.so.conf && \
    ldconfig

RUN echo 'instantclient,/opt/oracle/instantclient/lib' | pecl install oci8-2.0.12 && \
    touch /etc/php5/mods-available/oci8.ini && \
    echo 'extension=oci8.so' >> /etc/php5/mods-available/oci8.ini && \
    ln -s /etc/php5/mods-available/oci8.ini /etc/php5/cli/conf.d/20-oci8.ini && \
    ln -s /etc/php5/mods-available/oci8.ini /etc/php5/apache2/conf.d/20-oci8.ini && \
    php -r 'echo "OCI8 is " . (function_exists("oci_connect") ? "on" : "off") . "\n";'

#Build and install PHP PDO-OCI extension
RUN unzip /tmp/php-5.5.9.zip -d /tmp && \
    ln -s /usr/include/php5 /usr/include/php && \
    cd /tmp/php-src-php-5.5.9/ext/pdo_oci && \
    sed 's/10.1/12.1/' -i config.m4 && \
    phpize && \
    ./configure --with-pdo-oci=/opt/oracle/instantclient && \
    make install && \
    touch /etc/php5/mods-available/pdo_oci.ini && \
    echo "extension=pdo_oci.so" >> /etc/php5/mods-available/oci8.ini && \
    ln -s /etc/php5/mods-available/pdo_oci.ini /etc/php5/cli/conf.d/20-pdo_oci.ini && \
    ln -s /etc/php5/mods-available/pdo_oci.ini /etc/php5/apache2/conf.d/20-pdo_oci.ini && \
    php -r 'echo "PDO OCI driver is " . (in_array("oci", PDO::getAvailableDrivers()) ? "on" : "off") . "\n";'

RUN service apache2 restart
