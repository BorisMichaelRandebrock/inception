FROM debian:bullseye

RUN apt update && apt install -y \
    curl \
    wget \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-xml \
    php7.4-mbstring \
    php7.4-zip \
    unzip \
    tar \
    && apt clean
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY start.sh .
	
RUN mkdir -p /run/php
RUN mkdir -p /var/www/html
RUN chmod +x start.sh

CMD ["./start.sh"]
