#!/bin/bash
set -e

rm -f /usr/local/apache2/logs/httpd.pid
source /etc/apache2/envvars && exec apachectl -D FOREGROUND