FROM debian:11

RUN apt-get update && apt-get install -y \
    mariadb-server

VOLUME [ "/home/calbor-p/data/mariadb" ]

EXPOSE 3306

CMD [ "mariadb" ]