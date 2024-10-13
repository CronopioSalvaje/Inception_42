#!/bin/sh
set -e

# Vérification et correction des permissions
for dir in defer incoming active deferred bounce corrupt hold; do
    mkdir -p /var/spool/postfix/$dir
    chown postfix:postfix /var/spool/postfix/$dir
    chmod 700 /var/spool/postfix/$dir
done

chown -R postfix:postdrop /var/spool/postfix/public /var/spool/postfix/maildrop
chmod 730 /var/spool/postfix/public /var/spool/postfix/maildrop

# Assurez-vous que le fichier de log est accessible
touch /var/log/mail.log
chmod 644 /var/log/mail.log

# Démarrage de Postfix
exec "$@"