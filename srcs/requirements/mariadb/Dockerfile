FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install mariadb-server -y
	#apt-get clean && \
	#rm -rf /var/lib/apt/lists/*

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/dbscript.sh .

CMD ["bash", "dbscript.sh"]
