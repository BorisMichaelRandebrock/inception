#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER0} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${WORDPRESS_DB_HOST} --allow-root
./wp-cli.phar core install --url=brandebr.42.fr --title=inception --admin_user=${WORDPRESS_DB_USER0} --admin_password=${WORDPRESS_DB_PASSWORD} --admin_email=${WORDPRESS_DB_USER0}@brandebr.42.fr --allow-root

# docker CMD
php-fpm7.4 -F
