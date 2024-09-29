FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    libssl-dev

ADD conf/nginx.conf /etc/nginx/

EXPOSE 443



CMD ["nginx"]