#!/bin/bash

if [ ! -f "/etc/install.lock" ]; then

    apt-get update
    apt-get install -y alien wget

    # update-alternatives --set php /usr/bin/php7.4
    # update-alternatives --set php-config /usr/bin/php-config7.4
    # update-alternatives --set phpize /usr/bin/phpize7.4

    mkdir downloads
    cd downloads

    echo 'Downloading oracle instant client basic'
    wget -nv https://www.dropbox.com/s/q7fkj3d1hn2scrl/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm

    echo 'download oracle instant client devel'
    wget -nv https://www.dropbox.com/s/qjwbk0agc1rqxob/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

    echo 'Install oracle instant basic'
    alien -i oracle-instantclient*-basic-*.rpm

    echo 'Install oracle instant devel'
    alien -i oracle-instantclient*-devel-*.rpm

    sh -c 'echo "env[ORACLE_HOME] = /usr/lib/oracle/12.1/client64" >> /etc/php/7.4/fpm/pool.d/www.conf'
    sh -c 'echo "env[LD_LIBRARY_PATH] = /usr/lib/oracle/12.1/client64/lib" >> /etc/php/7.4/fpm/pool.d/www.conf'

    sh -c 'echo "export ORACLE_HOME=/usr/lib/oracle/12.1/client64" >> /home/vagrant/.bashrc'
    sh -c 'echo "export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib" >> /home/vagrant/.bashrc'

    service php7.4-fpm restart

    sh -c 'echo "/usr/lib/oracle/12.1/client64/lib" >> /etc/ld.so.conf.d/oracle.conf'
    chmod o+r /etc/ld.so.conf.d/oracle.conf
    ldconfig


    echo 'install oci8'
    printf "\n" | pecl -d php_suffix=7.4 install oci8

    echo 'add oci8 extension to php.ini'
    sh -c 'echo "extension=oci8.so" >> /etc/php/7.4/fpm/php.ini'
    sh -c 'echo "extension=oci8.so" >> /etc/php/7.4/cli/php.ini'
    service php7.4-fpm restart

    touch /etc/install.lock
else
    echo "Script já executado"
fi

#If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# If you're not quite ready for Node 12.x
# Uncomment these lines to roll back to
# v11.x or v10.x

# Remove Node.js v12.x:
#apt-get -y purge nodejs
#rm -rf /usr/lib/node_modules/npm/lib
#rm -rf //etc/apt/sources.list.d/nodesource.list

# Install Node.js v11.x
#curl -sL https://deb.nodesource.com/setup_11.x | -E bash -
#apt-get install -y nodejs

# Install Node.js v10.x
#curl -sL https://deb.nodesource.com/setup_10.x | -E bash -
#apt-get install -y nodejs
