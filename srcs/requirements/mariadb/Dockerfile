FROM debian:11

RUN apt-get update && apt-get install -y \
    mariadb-server

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf

VOLUME [ "/home/calbor-p/data/mariadb" ]

USER mysql

EXPOSE 3306

CMD ["mysqld"]