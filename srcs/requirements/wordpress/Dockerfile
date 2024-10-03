FROM debian:11

RUN apt-get update && apt-get install -y \
wordpress \
php-fpm

VOLUME [ "/home/calbor-p/data/wordpress" ]

COPY conf/wp-config.php /var/www/html/wp-config.php

EXPOSE 9000