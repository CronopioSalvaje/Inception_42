FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    libssl-dev

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/hosts /etc/hosts

EXPOSE 443



CMD ["nginx"]