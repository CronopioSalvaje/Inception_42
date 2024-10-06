FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl

# Créer un répertoire pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Copier la configuration Nginx
COPY requirements/nginx/conf/default.conf /etc/nginx/conf.d/default.conf

# Générer un certificat auto-signé (déplacé après la copie de la configuration)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=localhost" \
    && chmod 644 /etc/nginx/ssl/nginx.crt \
    && chmod 644 /etc/nginx/ssl/nginx.key


# Exposer le port 443
EXPOSE 443

# Vérifier que les fichiers sont bien présents (pour le debug)
RUN ls -la /etc/nginx/ssl/

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]