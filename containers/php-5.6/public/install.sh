#!/bin/sh

if [ ! -f "/etc/install.lock" ]; then

    apt-get update;
    apt-get -y upgrade;
    #
    curl -s https://getcomposer.org/installer | php;
    mv composer.phar /usr/local/bin/composer;
    
    git config --global user.email "thiiagovieir@gmail.com"
    git config --global user.name "Thiago Vieira"

    touch /etc/install.lock
fi

# link:https://gorails.com/setup/ubuntu/14.04
# link:https://github.com/rbenv/ruby-build/issues/1146