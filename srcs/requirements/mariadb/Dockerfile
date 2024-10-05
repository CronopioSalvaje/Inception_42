FROM debian:11

# Installer le serveur MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Créer les répertoires nécessaires et attribuer les bons droits
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql

# Copier le fichier de configuration personnalisé
COPY requirements/mariadb/conf/my.cnf /etc/mysql/my.cnf

# Script d'initialisation de la base de données
COPY requirements/mariadb/tools/init.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 3306

VOLUME [ "/home/calbor-p/data/mariadb" ]
# Point d'entrée pour initialiser la base de données
ENTRYPOINT ["/docker-entrypoint.sh"]

# Commande par défaut pour démarrer MariaDB
CMD ["mysqld"]