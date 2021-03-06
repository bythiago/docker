#!/bin/sh

# Install Packages
apt-get update;
apt-get upgrade -y;
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
echo "xdebug.default_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_handler=dbgp" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_mode=req" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

# Configurando GIT
git config --global user.email "email@email.com"
git config --global user.name "username"