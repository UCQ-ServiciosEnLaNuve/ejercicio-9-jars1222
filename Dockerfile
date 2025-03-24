FROM php:7.2-fpm


RUN apt-get update && apt-get install -y \
    git \
    curl \
    libicu-dev\
    libpng-dev \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    zip \
    unzip
RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring exif zip intl


COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
