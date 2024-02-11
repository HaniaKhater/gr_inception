FROM debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    php7.3 \
    php7.3-fpm \
    php7.3-mysqli \
    wget

RUN mkdir -p /var/www/html
RUN mkdir -p /run/php/ && chown www-data:www-data /run/php/

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/html/adminer.php
RUN chown www-data:www-data /var/www/html/adminer.php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# Run PHP-FPM in the foreground
CMD ["php-fpm7.3", "-F"]
