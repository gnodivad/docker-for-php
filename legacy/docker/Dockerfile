FROM ubuntu:12.04

RUN apt-get -yqq update \
    && apt-get -yqq install \
    curl \
    apache2 \
    libapache2-mod-php5 \
    php5 \
    php5-mysql \
    php5-mcrypt \
    php5-suhosin \
    && rm -f /etc/apache2/sites-available/* \
    && rm -f /etc/apache2/sites-enabled/* \
    && a2enmod rewrite

COPY docker/httpd-foreground.sh /usr/local/bin/httpd-foreground
COPY docker/vhost.conf /etc/apache2/sites-available/000-default.conf
COPY . /srv/cakephp

RUN ln -s /etc/apache2/sites-available/000-default.conf \
    /etc/apache2/sites-enabled/000-default.conf \
    && chmod +x /usr/local/bin/httpd-foreground \
    && chown -R www-data:www-data /srv/cakephp

WORKDIR /srv/cakephp

EXPOSE 80

CMD ["httpd-foreground"]