FROM php:7.2-fpm-stretch

ENV CADDY_HOSTNAME=0.0.0.0

RUN curl --silent --show-error --fail --location \
    --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
    "https://caddyserver.com/download/linux/amd64?plugins=http.expires,http.realip&license=personal&telemetry=off" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && caddy -version \
    && docker-php-ext-install mbstring pdo pdo_mysql

COPY docker/Caddyfile /etc/Caddyfile
COPY docker/caddy.sh /usr/local/bin/caddy
COPY . /srv/app
COPY docker/confd/ /etc/confd/
ADD https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd

WORKDIR /srv/app

RUN chmod +x /usr/local/bin/caddy \
    && chmod +x /usr/local/bin/confd \
    && chown -R www-data:www-data /srv/app

CMD [ "/usr/local/bin/caddy"]

