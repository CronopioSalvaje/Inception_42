FROM debian:11

# Installation des paquets nécessaires
RUN apt-get update && apt-get install -y \
    vim \
    mailutils \
    libsasl2-2 \
    libssl1.1 \
    procps \
    telnet \
    net-tools \
    ca-certificates
RUN  apt install -y postfix  && rm -rf /var/lib/apt/lists/*

# Création du fichier de log
RUN touch /var/log/mail.log && chmod 644 /var/log/mail.log

# Création de l'utilisateur admin et de son répertoire Maildir
RUN adduser --quiet --disabled-password admin \
    && mkdir -p /home/admin/Maildir \
    && chown -R admin:admin /home/admin/Maildir

RUN echo "smtp            25/tcp          mail" >> /etc/services
RUN echo "smtp            25/udp          mail" >> /etc/services


# Création d'un script d'entrée pour gérer les permissions et démarrer Postfix
COPY requirements/bonus/postfix/conf/main.cf /etc/postfix/main.cf
COPY requirements/bonus/postfix/conf/mailname /etc/mailname
COPY requirements/bonus/postfix/conf/hostname /etc/hostname
COPY requirements/bonus/postfix/conf/hosts /etc/hosts
COPY requirements/bonus/postfix/tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 25

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postfix", "start-fg"]



