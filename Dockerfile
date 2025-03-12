FROM php:7.2-fpm


RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libzip-dev \
    libpq-dev \
    zip \
    unzip \
    && docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl zip \
    && rm -rf /var/lib/apt/lists/*


COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer
RUN chmod +x /usr/bin/composer


WORKDIR /var/www
