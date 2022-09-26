FROM php:8.1-fpm-alpine
#neccessary dependency we need to install
RUN docker-php-ext-install pdo pdo_mysql sockets
RUN curl -sS https://getcomposer.org/installer​ | php -- \
    --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#change directory
WORKDIR /app
COPY . .
RUN composer install