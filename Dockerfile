FROM composer:latest

RUN apk --no-cache add gmp-dev bzip2-dev enchant-dev libpng-dev icu-dev \
    openldap-dev aspell-dev recode-dev freetype-dev libjpeg-turbo-dev \
    libwebp-dev zlib-dev imap-dev libxpm-dev libmcrypt-dev freetds-dev \
    postgresql-dev net-snmp-dev libxml2-dev libxslt-dev autoconf && \
    pecl install xdebug && \
    docker-php-ext-install bcmath bz2 calendar dba enchant exif gd gettext gmp \
    imap intl ldap mcrypt mysqli opcache pcntl pdo_dblib pdo_mysql \
    pdo_pgsql pgsql pspell recode
