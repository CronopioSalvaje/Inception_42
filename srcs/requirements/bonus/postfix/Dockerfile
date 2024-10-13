FROM debian:11

# Installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
    postfix \
    vim \
    mailutils \
    libsasl2-2 \
    libssl1.1 \
    ca-certificates \
    tzdata \
    netbase \
    && rm -rf /var/lib/apt/lists/*

# Configuration de Postfix
RUN postconf compatibility_level=2

# Création du fichier de log
RUN touch /var/log/mail.log && chmod 644 /var/log/mail.log

# Création de l'utilisateur admin et de son répertoire Maildir
RUN adduser --quiet --disabled-password admin \
    && mkdir -p /home/admin/Maildir \
    && chown -R admin:admin /home/admin/Maildir

# Création et configuration des répertoires Postfix
RUN for dir in defer incoming active deferred bounce corrupt hold; do \
        mkdir -p /var/spool/postfix/$dir; \
        chown postfix:postfix /var/spool/postfix/$dir; \
        chmod 700 /var/spool/postfix/$dir; \
    done \
    && chown -R postfix:postdrop /var/spool/postfix/public /var/spool/postfix/maildrop \
    && chmod 730 /var/spool/postfix/public /var/spool/postfix/maildrop

# Création d'un script d'entrée pour gérer les permissions et démarrer Postfix
COPY requirements/bonus/postfix/conf/main.cf /etc/postfix/main.cf
COPY requirements/bonus/postfix/conf/mailname /etc/mailname
COPY requirements/bonus/postfix/tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 25

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postfix", "start-fg"]