#!/bin/sh
set -e

echo "Starting entrypoint script"

# Vérification et correction des permissions
for dir in defer incoming active deferred bounce corrupt hold; do
    echo "Setting permissions for /var/spool/postfix/$dir"
    mkdir -p /var/spool/postfix/$dir
    chown postfix:postfix /var/spool/postfix/$dir
    chmod 700 /var/spool/postfix/$dir
done

echo "Setting permissions for public and maildrop directories"
chown -R postfix:postdrop /var/spool/postfix/public /var/spool/postfix/maildrop /var/spool/postfix/deferred/
chmod 730 /var/spool/postfix/public /var/spool/postfix/maildrop

# Assurez-vous que le fichier de log est accessible
echo "Setting up mail log"
touch /var/log/mail.log
chmod 644 /var/log/mail.log

echo "Running postfix check"
postfix check

echo "Starting Postfix"
# Démarrage de Postfix

exec postfix start-fg
#exec "$@"