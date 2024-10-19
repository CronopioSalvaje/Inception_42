From debian:11

RUN apt-get update && apt-get install -y \
    redis-server

COPY requirements/bonus/rediscache/conf/redis.conf /etc/redis/redis.conf
COPY requirements/bonus/rediscache/tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN chmod 644 /etc/redis/redis.conf

ENTRYPOINT ["/entrypoint.sh"]
    
#CMD ["redis-server", "--appendonly", "yes"]
