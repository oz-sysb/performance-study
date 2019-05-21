FROM php:8.2-apache-buster

ENV COMPOSER_ALLOW_SUPERUSER=1

ARG WWW_USER_ID=${WWW_USER_ID}
ARG WWW_GROUP_ID=${WWW_GROUP_ID}

RUN usermod -u $WWW_USER_ID -o www-data
RUN groupmod -g $WWW_GROUP_ID -o www-data

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -y install \
        libicu-dev \
        libzip-dev \
        libonig-dev \
        zip \
        unzip \
        libssl-dev  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install intl mbstring opcache pdo_mysql zip

COPY ./php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/html
