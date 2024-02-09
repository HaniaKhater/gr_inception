FROM debian:buster

RUN apt-get update && \
    apt-get install -y curl software-properties-common gnupg2

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && \
    apt-get install -y nodejs vim bash curl wget git

RUN npm install npm@9 -g

RUN mkdir /app

COPY ./tools /

RUN chmod +x /kscript.sh

EXPOSE 3001

ENTRYPOINT ["./kscript.sh"]
