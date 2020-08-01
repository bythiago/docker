#!/bin/sh

if [ ! -f "/etc/install.lock" ]; then

    #
    curl -s https://getcomposer.org/installer | php;
    mv composer.phar /usr/local/bin/composer;
    
    git config --global user.email "thiiagovieir@gmail.com"
    git config --global user.name "Thiago Vieira"

    touch /etc/install.lock
fi