FROM php:7.3-apache

RUN apt-get update && \
apt-get install -y zlib1g-dev libpq-dev && \
rm -rf /var/lib/apt/lists/*

RUN docker-php-source extract && \
docker-php-ext-install pdo pdo_mysql pdo_pgsql mysqli pgsql && \
docker-php-source delete

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs && \
rm -rf /var/lib/apt/lists/*

COPY --chown=www-data:www-data wwwdata /var/www/html
WORKDIR /var/www/html/nodejs
CMD apachectl start && node json.js
