FROM debian:11


RUN apt-get update && apt-get install -y \
    curl \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-curl \
    wordpress

RUN chown www-data:www-data /var/www/html


RUN mkdir -p /run/php

RUN cd /usr/sbin/ && ls

VOLUME [ "/home/calbor-p/data/wordpress" ]

COPY requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf 

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]