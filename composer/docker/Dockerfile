FROM php:7.2-apache-stretch

COPY docker/composer-installer.sh /usr/local/bin/composer-installer

RUN apt-get -yqq update \
    && apt-get -yqq install --no-install-recommends zip unzip \
    && chmod +x /usr/local/bin/composer-installer \
    && composer-installer \
    && mv composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && composer --version

WORKDIR /tmp

COPY composer.json composer.lock /tmp/

RUN mkdir -p database/seeds/ database/factories/ \
    && composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist \
    && rm -rf composer.json composer.lock vendor/ database/

WORKDIR /var/www/html

COPY . /var/www/html

RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist