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

# Configurando XDebug
echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.idekey=docker" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;