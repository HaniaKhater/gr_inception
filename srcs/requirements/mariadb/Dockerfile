FROM debian:buster

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server procps && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
 	chown mysql:mysql /var/run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/dbscript.sh .

CMD ["bash", "dbscript.sh"]
