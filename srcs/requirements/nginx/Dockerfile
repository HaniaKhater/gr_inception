FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y nginx openssl
	#apt-get clean && \
	#rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl && \
	#openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout inception.key -out inception.crt -subj "/CN=localhost"

	openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=hkhater.42.fr/UID=hkhater" && \
	mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
