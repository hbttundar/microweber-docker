FROM ubuntu:20.04 as web
ARG ENVIRONMENT
ARG INSTALL_XDEBUG
ARG DBUSER
ARG DBSECRET
ARG DBPREFIX
ARG DBHOST
ARG DBPORT
ARG DBDRIVER
ARG INSTALL_REDIS
ARG API_TOKEN

WORKDIR /var/www/app
# Configure non-root user.
ARG PUID
ARG PGID
RUN groupadd --force -g $PGID micweb
RUN useradd -ms /bin/bash --no-user-group -g $PGID -u $PUID micweb
COPY  --chown=${PUID}:www-data  app  /var/www/app/
COPY docker/web/msmtp  /tmp/
COPY docker/web/build/ubuntu/build.sh /tmp/
RUN chmod +x /tmp/build.sh
RUN bash /tmp/build.sh
COPY docker/web/php/  /etc/php/7.4/apache2/conf.d/
COPY docker/web/apache/ubuntu /etc/apache2/
RUN update-ca-certificates
#
# copy all bash scripts that we need
#
COPY docker/web/scripts/ubuntu/permission.sh /usr/local/bin/
COPY docker/web/scripts /usr/local/bin/

# set permissions
RUN sh /usr/local/bin/permission.sh
EXPOSE 80 443
ENTRYPOINT ["entrypoint.sh"]
