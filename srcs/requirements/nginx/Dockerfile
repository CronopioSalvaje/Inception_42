FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    libssl-dev
   
    
# RUN chmod 777 /etc/hosts
    
COPY requirements/nginx/conf/hosts /etc/hosts
COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443


CMD ["nginx"]