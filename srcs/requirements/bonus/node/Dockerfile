FROM debian:11

RUN apt-get update && apt-get install -y curl gnupg build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/www/html


#COPY requirements/bonus/node/tools/entrypoint.sh /entrypoint.sh
COPY requirements/bonus/node/srcs /var/www/html

RUN ls -l var/www/html

EXPOSE 3000

#ENTRYPOINT [ "/entrypoint.sh" ]
WORKDIR /var/www/html
RUN npm install

CMD ["npm", "start"]

