FROM composer:latest

# Environment Variables
ENV BUILD_DEPS="alpine-sdk coreutils autoconf" \
    PERSISTENT_DEPS="gmp-dev bzip2-dev libpng-dev freetype-dev libjpeg-turbo-dev libwebp-dev libxpm-dev libmcrypt-dev gettext-dev icu-dev" \
    INSTALL_EXTENSIONS="bcmath bz2 exif gd gettext gmp intl mcrypt opcache pcntl" \
    INSTALL_PECL="xdebug"

# Full list for safe keeping
# bcmath bz2 calendar dba enchant exif gd gettext gmp imap intl ldap mcrypt mysqli opcache pcntl pdo_dblib pdo_mysql pdo_pgsql pgsql pspell recode

# Install Packages
RUN apk upgrade --update && \
    apk add --no-cache --virtual .persistent-deps $PERSISTENT_DEPS && \
    apk add --no-cache --virtual .build-deps $BUILD_DEPS && \
    docker-php-ext-install $INSTALL_EXTENSIONS && \
    pecl install $INSTALL_PECL && \
    docker-php-ext-enable $INSTALL_PECL && \
    apk del .build-deps && \
    rm -rf /tmp/*
