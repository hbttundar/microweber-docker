#
# STAGE 1: composer
#
FROM composer:latest as composer
WORKDIR /app
COPY /app/  /app/
RUN composer install --ignore-platform-reqs --no-dev
#
# stage 2 web
#
FROM ubuntu:20.04 as web
WORKDIR /var/www/app
COPY --from=composer /app/     /var/www/app/
COPY /docker/web/msmtp/  /tmp/
COPY /docker/web/build/ubuntu/build.sh /tmp/
RUN chmod +x /tmp/build.sh
RUN bash /tmp/build.sh
COPY /docker/web/php/  /etc/php/7.4/apache2/conf.d/
COPY /docker/web/apache/ubuntu/ /etc/apache2/
RUN update-ca-certificates
#
# copy all bash scripts that we need
#
COPY /docker/web/scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/permission.sh
RUN sh /usr/local/bin/permission.sh
EXPOSE 80 443
ENTRYPOINT ["entrypoint.sh"]