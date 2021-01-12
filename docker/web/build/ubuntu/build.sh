#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
#set the timezone for tzdata in ubuntu otherwise during installation ask for select timezone
ln -fs /usr/share/zoneinfo/Europe/Frankfurt /etc/localtime
apt-get update && apt-get upgrade
apt-get install -yq curl ca-certificates
apt-get update && apt-get install -yq --no-install-recommends \
  init-system-helpers \
  apt-utils \
  autoconf \
  automake \
  msmtp \
  msmtp-mta \
  libmcrypt-dev \
  curl \
  git \
  apache2 \
  apache2-dev \
  libapache2-mod-php7.4 \
  php7.4-cli \
  php7.4-json \
  php7.4-curl \
  php7.4-fpm \
  php7.4-gd \
  php7.4-ldap \
  php7.4-mbstring \
  php7.4-mysql \
  php7.4-pdo-mysql \
  php7.4-soap \
  php7.4-sqlite3 \
  php7.4-xml \
  php7.4-zip \
  php7.4-intl \
  php7.4-imagick \
  php7.4-xmlreader \
  php7.4-xmlwriter \
  php7.4-opcache \
  php-redis \
  php-pear \
  ssl-cert \
  openssl \
  mysql-client \
  sqlite3 \
  bash \
  gzip \
  brotli \

echo '-----------------------------------------------------------------------------------'
echo '-------------------------- install composer ---------------------------------------'
echo '-----------------------------------------------------------------------------------'
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer self-update
if [ "$APP_ENV" = "local" ]; then
  if [ "$INSTALL_XDEBUG" = "true" ]; then
    echo '-----------------------------------------------------------------------------------'
    echo '------------- you select to install x-debug ---------------------------------------'
    echo '-----------------------------------------------------------------------------------'
    apt-get install -yq --no-install-recommends php-xdebug
  fi
else
  cp /tmp/msmtprc /etc/msmtprc
fi
if [ "$INSTALL_REDIS" = "true" ]; then
  echo '-----------------------------------------------------------------------------------'
  echo '--------------- you select to install Redis ---------------------------------------'
  echo '-----------------------------------------------------------------------------------'
  apt-get install -yq --no-install-recommends redis
fi

apt-get clean && rm -rf /var/lib/apt/lists/*