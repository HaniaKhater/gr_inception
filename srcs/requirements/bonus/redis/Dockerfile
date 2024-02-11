FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y redis

COPY tools/rscript.sh /tmp/.

CMD ["bash", "/tmp/rscript.sh"]
