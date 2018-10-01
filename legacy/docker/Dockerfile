FROM ubuntu:12.04

RUN apt-get -yqq update \
    && apt-get -yqq install \
    apache2 \
    libapache2-mod-php5 \
    php5 \
    php5-mysql \
    php5-mcrypt \
    php5-suhosin \
    && a2enmod rewrite