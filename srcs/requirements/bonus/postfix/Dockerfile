FROM debian:11

RUN apt-get update && apt-get install -y postfix \
vim

COPY requirements/bonus/postfix/conf/main.cf /etc/postfix/main.cf


#port usuel pour le smtp
EXPOSE 25

CMD ["postfix", "start-fg"]

