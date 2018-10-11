#!/usr/bin/env bash

set -e

echo "The hostname is $CADDY_HOSTNAME"

function shutdown {
    kill -s SIGTERM $CONFD_PID
    wait $CONFD_PID
    kill -s SIGTERM $PHP_FPM_PID
    wait $PHP_FPM_PID
}

# confd -onetime -backend consul -node consul:8500
until confd -onetime -backend consul -node consul:8500; do
    echo "Waiting for the initial conf configuration..."
    sleep 5
done

confd -interval 10 -backend consul -node consul:8500 &
CONFD_PID=$!

php-fpm &
PHP_FPM_PID=$!

trap shutdown SIGTERM SIGINT

/usr/bin/caddy -validate -agree=true -conf=/etc/Caddyfile
exec /usr/bin/caddy -agree=true -conf=/etc/Caddyfile

