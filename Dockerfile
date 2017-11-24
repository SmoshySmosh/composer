FROM composer:latest

# Environment Variables
ENV BUILD_DEPS="alpine-sdk coreutils" \
    PERSISTENT_DEPS="gmp-dev bzip2-dev enchant-dev libpng-dev icu-dev openldap-dev aspell-dev recode-dev freetype-dev libjpeg-turbo-dev libwebp-dev zlib-dev imap-dev libxpm-dev libmcrypt-dev freetds-dev postgresql-dev net-snmp-dev libxml2-dev libxslt-dev" \
    INSTALL_EXTENSIONS="bcmath bz2 calendar dba enchant exif gd gettext gmp imap intl ldap mcrypt mysqli opcache pcntl pdo_dblib pdo_mysql pdo_pgsql pgsql pspell recode" \
    INSTALL_PECL="xdebug"

# Install Packages
RUN apk upgrade --update && \
    apk add --no-cache --virtual .persistent-deps $PERSISTENT_DEPS && \
    apk add --no-cache --virtual .build-deps $BUILD_DEPS && \
    docker-php-ext-install $INSTALL_EXTENSIONS && \
    pecl install $INSTALL_PECL && \
    docker-php-ext-enable $INSTALL_PECL && \
    apk del .build-deps && \
    rm -rf /tmp/*
