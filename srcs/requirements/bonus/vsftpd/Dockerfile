FROM debian:11

RUN apt-get update && apt-get install -y \
    vsftpd \
 && apt-get clean


# Créer un utilisateur pour le FTP
RUN useradd -m ftpuser && echo "ftpuser:password" | chpasswd && chmod 755 /home/ftpuser

RUN touch /var/log/vsftpd.log

# Configurer vsftpd
COPY requirement/bonus/vsftpd/conf/vsftpd.conf /etc/vsftpd.conf

# Exposer le port 21 pour FTP
EXPOSE 21

# Démarrer vsftpd en mode foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]