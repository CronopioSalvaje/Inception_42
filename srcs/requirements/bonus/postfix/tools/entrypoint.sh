#!/bin/sh
set -e

echo "Starting entrypoint script"

chown -R root: /var/spool/postfix/
chown -R root: /var/spool/postfix/pid
chown -R root: /etc/postfix/
chown -R postfix: /var/lib/postfix/
chown -R postfix: /var/spool/postfix/flush
chown -R postfix: /var/spool/postfix/private
chown -R postfix: /var/spool/postfix/saved
chown -R postfix: /var/spool/postfix/trace

for dir in defer incoming active deferred bounce corrupt hold; do
    echo "Setting permissions for /var/spool/postfix/$dir"
    mkdir -p /var/spool/postfix/$dir
    chown postfix:postfix /var/spool/postfix/$dir
    chmod 700 /var/spool/postfix/$dir
done

echo "Setting permissions for public and maildrop directories"
chown -R postfix:postdrop /var/spool/postfix/public /var/spool/postfix/maildrop
chmod 730 /var/spool/postfix/public /var/spool/postfix/maildrop

for dir in defer incoming active deferred bounce corrupt hold; do
    echo "Setting permissions for /var/spool/postfix/$dir"
    mkdir -p /var/spool/postfix/$dir
    chown postfix:postfix /var/spool/postfix/$dir
    chmod 700 /var/spool/postfix/$dir
done

echo "Fixing permissions for deferred and its subdirectories"
find /var/spool/postfix/deferred -type d -exec chown postfix:postfix {} \; -exec chmod 700 {} \;

echo "Fixing permissions for all files in /var/spool/postfix"
find /var/spool/postfix -type f -exec chown postfix:postfix {} \; -exec chmod 600 {} \;

chown -R root:root /var/spool/postfix/etc/services

usermod -a -G www-data postfix

# Assurez-vous que le fichier de log est accessible
echo "Setting up mail log"
touch /var/log/mail.log
chmod 644 /var/log/mail.log

echo "Postfix version:"
postconf mail_version

echo "Postfix configuration:"
postconf -n

echo "Checking configuration files:"
[ -f /etc/mailname ] && echo "/etc/mailname exists" || echo "/etc/mailname is missing"
[ -d /var/spool/postfix ] && echo "/var/spool/postfix exists" || echo "/var/spool/postfix is missing"

echo "Checking Postfix configuration:"
postfix check -v

echo "Checking critical directory permissions:"
ls -ld /var/spool/postfix /var/spool/postfix/* /etc/postfix

postconf compatibility_level=2

echo "Starting Postfix"
# Démarrage de Postfix
echo "Starting Postfix with verbose logging"
postfix start-fg -v &

# Attendez un peu que Postfix démarre
sleep 5

echo "Checking Postfix processes:"
ps aux | grep postfix

echo "Checking mail.log:"
tail -n 20 /var/log/mail.log

# Gardez le conteneur en vie pour inspecter
tail -f /var/log/mail.log