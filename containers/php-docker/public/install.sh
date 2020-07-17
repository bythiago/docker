#!/bin/sh

# Install Packages
apt-get update;
apt-get install -y git libzip-dev wget;

pecl install xdebug;
pecl install zip;
docker-php-ext-enable xdebug;
docker-php-ext-enable zip;

# Install Composer
curl -s https://getcomposer.org/installer | php;
mv composer.phar /usr/local/bin/composer;

# Install Symfony CLI
wget https://get.symfony.com/cli/installer -O - | bash;
mv /root/.symfony/bin/symfony /usr/local/bin/symfony;
