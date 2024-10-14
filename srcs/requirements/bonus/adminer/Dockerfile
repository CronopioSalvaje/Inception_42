FROM debian:11

RUN apt-get update && apt-get install -y \
 adminer \
 php-cli \
 php-mysqli \
 adminer \
 wget \
 && apt-get clean

# Créer le répertoire pour Adminer
RUN mkdir -p /usr/share/adminer

RUN chown www-data:www-data /usr/share/adminer/adminer.php

RUN chmod 644 /usr/share/adminer/adminer.php

# Définir le répertoire de travail pour Adminer
WORKDIR /usr/share/adminer

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "adminer.php"]

