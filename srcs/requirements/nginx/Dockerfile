FROM debian:bullseye

ARG DOMAIN_NAME

RUN apt update && apt install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/brandebr.key \
    -out /etc/ssl/certs/brandebr.crt \
    -subj="/C=ES/ST=Barcelona/L=Barcelona/O=42incep/OU=brandebr/CN=brandebr.42.fr"

COPY conf/default /etc/nginx/sites-available/

CMD ["nginx", "-g", "daemon off;"]
