#!/bin/sh

if [ ! -f "/etc/install.lock" ]; then

    #apt-get update;
    #apt-get -y upgrade;

    #Install ruby
    apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev;
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB;
    curl -sSL https://get.rvm.io | bash -s stable;
    source /usr/local/rvm/scripts/rvm;
    rvm install 2.7.1;
    rvm use 2.7.1 --default;
    ruby -v;
    gem install compass;
    #gem install --no-rdoc --no-ri rb-inotify -v 0.9.10;
    #gem install ffi -v 1.9.18;
    #gem install sass -f;
    #gem install compass --pre;

    curl -s https://getcomposer.org/installer | php;
    mv composer.phar /usr/local/bin/composer;
    
    git config --global user.email "thiiagovieir@gmail.com"
    git config --global user.name "Thiago Vieira"

    touch /etc/install.lock
fi

# link:https://gorails.com/setup/ubuntu/14.04
# link:https://github.com/rbenv/ruby-build/issues/1146