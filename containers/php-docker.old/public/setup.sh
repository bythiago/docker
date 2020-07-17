#!/bin/sh

# Install Packages
apt-get update;
apt-get install -y git libzip-dev vim nano tree wget;

pecl install xdebug;
pecl install zip;
docker-php-ext-enable xdebug;
docker-php-ext-enable zip;


# # Install Composer and Symfony CLI
# curl -s https://getcomposer.org/installer | php;
# mv composer.phar /usr/local/bin/composer;