#!/bin/bash

# Allow other services to start
sleep 5

cd /var/www/wordpress

# Check if WordPress is not configured
if [ ! -e /var/www/wordpress/wp-config.php ]; then

wp config create --allow-root \
    --dbname="$SQL_DATABASE" \
    --dbuser="$SQL_USER" \
    --dbpass="$SQL_PWD" \
    --dbhost="$SQL_HOST:3306" \
    --path='/var/www/wordpress'

wp core install --allow-root \
    --url="$DOMAIN_NAME" \
    --title="$SITE_TITLE" \
    --admin_user="$ADMIN_USER" \
    --admin_password="$ADMIN_PWD" \
    --admin_email="$ADMIN_EMAIL" \
    --path='/var/www/wordpress'

wp user create --allow-root \
    --role=author "$USER1_LOGIN" "$USER1_MAIL" \
    --user_pass="$USER1_PASS" \
    --path='/var/www/wordpress'

fi

if [ ! -d /run/php ]; then
    mkdir -p /run/php
fi

/usr/sbin/php-fpm7.3 -F
