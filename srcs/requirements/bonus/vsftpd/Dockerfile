FROM debian:11

ARG USER_NAME
ARG USER_PWD


RUN apt-get update && apt-get install -y \
    vsftpd \
 && apt-get clean


# Créer un utilisateur pour le FTP


RUN useradd -m "$USER_NAME" && echo "$USER_NAME:$USER_PWD" | chpasswd && chmod 755 /home/"$USER_NAME"

RUN touch /var/log/vsftpd.log
RUN mkdir -p /var/run/vsftpd/empty
RUN chmod 755 /var/run/vsftpd/empty
RUN mkdir -p /var/ftp/uploads
RUN chmod 755 /var/ftp/uploads
RUN usermod -aG 33 $USER_NAME

# Configurer vsftpd
COPY requirements/bonus/vsftpd/conf/vsftpd.conf /etc/vsftpd.conf

# Exposer le port 21 pour FTP

# Démarrer vsftpd en mode foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]