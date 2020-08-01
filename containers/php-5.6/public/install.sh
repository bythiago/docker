#!/bin/sh

if [ ! -f "/etc/install.lock" ]; then
    # Install Packages
    apt-get update;
    apt-get upgrade -y;
    apt-get intall ruby-full;

    # Install Pdo oci
    tar xjf php-5.5.9.tar.bz2
    cd php-5.5.9/ext/pdo_oci
    phpize

    # Install Composer
    curl -s https://getcomposer.org/installer | php;
    mv composer.phar /usr/local/bin/composer;

    # Configure Git
    git config --global user.email "thiiagovieir@gmail.com"
    git config --global user.name "Thiago Vieira"

    touch /etc/install.lock
fi