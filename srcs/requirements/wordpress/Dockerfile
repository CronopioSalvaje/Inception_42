FROM debian:11


RUN apt-get update && apt-get install -y \
    curl \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-curl \
    wordpress \
    #net-tools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*
    #php-redis \

WORKDIR /var/www/html/

RUN curl -o /var/www/html/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xvzf /var/www/html/wordpress.tar.gz  -C /var/www/html --strip-components=1 
    #rm /var/www/html/wordpress.tar.gz
    
RUN chown -R www-data:www-data /var/www/html


RUN mkdir -p /run/php

COPY requirements/wordpress/conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY requirements/wordpress/conf/php.ini /etc/php/7.4/fpm/php.ini
COPY requirements/wordpress/tools/init.sh /usr/local/bin/init.sh

EXPOSE 9000

CMD ["/usr/local/bin/init.sh", "php-fpm7.4", "-F"]