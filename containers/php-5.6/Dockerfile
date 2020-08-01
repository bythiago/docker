FROM edurekain/php5.5apache

LABEL key="Thiago Vieira <thiiagovieir@gmail.com>"

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential re2c libaio1 unzip wget ca-certificates
RUN apt-get install -y php5 php5-cli php5-dev

# Install OCI8
ADD ./oracle/oracle-instantclient11.2-basic-11.2.0.1.0-1.x86_64.zip /tmp/
ADD ./oracle/oracle-instantclient11.2-sdk-11.2.0.1.0-1.x86_64.zip /tmp/
