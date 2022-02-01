FROM php:7.3-apache

RUN apt-get update && \
apt-get install -y zlib1g-dev libpq-dev && \
rm -rf /var/lib/apt/lists/*

RUN docker-php-source extract && \
docker-php-ext-install pdo pdo_pgsql pgsql pdo_mysql mysqli && \
docker-php-source delete

COPY --chown=www-data:www-data wwwdata /var/www/html

CMD apache2-foreground
