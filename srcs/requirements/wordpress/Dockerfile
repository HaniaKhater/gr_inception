FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget
    #apt-get clean && \
    #rm -rf /var/lib/apt/lists/*

# Download and extract the latest WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz #&& \
    chown -R root:root /var/www/wordpress

RUN apt-get install -y php-fpm php-mysql mariadb-client sendmail
# Copy PHP-FPM pool configuration and WordPress homepage
COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/page.html /var/www/wordpress

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy the script for WordPress setup
COPY tools/wpscript.sh .

CMD ["bash", "wpscript.sh"]
