#!/usr/bin/env bash

set -e

echo "The hostname is $CADDY_HOSTNAME"

confd -onetime -backend env

/usr/bin/caddy -validate -agree=true -conf=/etc/Caddyfile
exec /usr/bin/caddy -agree=true -conf=/etc/Caddyfile