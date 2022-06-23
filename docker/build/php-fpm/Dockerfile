FROM php:8.1-fpm-alpine

RUN apk add acl autoconf g++ make

# Install PDO driver for PostgreSQL
RUN apk add postgresql-dev \
    && docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY ./docker/etc/php-fpm/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Install OPcache
RUN docker-php-ext-install opcache

# Install APCu
RUN pecl install apcu \
    && docker-php-ext-enable apcu

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/application

COPY ./docker/etc/php-fpm/docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]
