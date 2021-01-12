#!/bin/bash
set -e
find /usr/local/bin/ubuntu/ -type f -name "*.sh" -exec bash -c '
    for filename do
       chmod +x "$filename" && mv "$filename" /usr/local/bin/
    done' bash {} +
rm -rf  /usr/local/bin/ubuntu/
USERNAME=$(getent passwd "1000" | cut -d: -f1)
chown -R ${USERNAME}:www-data /var/www/  && chmod 777 -R /var/www/app/storage && chmod 777 -R /var/www/app/bootstrap \
 && chmod 777 -R /var/www/app/config && chmod 777 -R /var/www/app/userfiles