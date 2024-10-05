FROM debian:11

# Installer le serveur MariaDB
RUN apt-get update && apt-get install -y mariadb-server

# Supprimer l'utilisateur mysql s'il existe
RUN if getent passwd mysql; then \
        userdel mysql; \
    fi

# Supprimer le groupe mysql s'il existe
RUN if getent group mysql; then \
        groupdel mysql; \
    fi

# Créer le groupe et l'utilisateur mysql avec UID et GID spécifiques
RUN groupadd -g 1001 mysql && \
    useradd -r -u 1001 -g mysql mysql

# Créer les répertoires nécessaires et attribuer les bons droits
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copier le fichier de configuration personnalisé
# COPY requirements/mariadb/conf/my.cnf /etc/mysql/my.cnf

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Exécuter MariaDB en tant qu'utilisateur mysql
USER mysql

# Démarrer MariaDB
CMD ["sh", "-c", "id mysql && mysqld"]