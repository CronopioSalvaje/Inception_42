#!/bin/bash

# Vérifier si la base de données est déjà initialisée
if [ ! -d "/var/lib/mysql/mysql" ]; then
    # Initialiser la base de données
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Démarrer MySQL en arrière-plan
    mysqld --user=mysql --datadir=/var/lib/mysql &
    
    # Attendre que MySQL démarre
    until mysqladmin ping >/dev/null 2>&1; do
        echo -n "."
        sleep 1
    done

    # Créer la base de données et l'utilisateur
    mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

    # Arrêter MySQL
    mysqladmin -u root shutdown
fi

chown -R mysql:mysql /var/lib/mysql

# Démarrer MySQL avec les paramètres spécifiés
exec mysqld --user=mysql --datadir=/var/lib/mysql