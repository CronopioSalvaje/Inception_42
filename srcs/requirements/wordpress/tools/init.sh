#!/bin/bash

VOLUME_DIR="/var/www/html"

if ! find "$VOLUME_DIR" -mindepth 1 | read;then
    cd /var/www/html
    curl -O https://wordpress.org/latest.tar.gz
    tar -xvzf latest.tar.gz --strip-components=1
    rm latest.tar.gz

fi

exec php-fpm7.4 -F