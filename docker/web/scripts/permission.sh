#!/bin/bash
set -e
find /usr/local/bin/ -type f -name "*.sh" -exec bash -c '
    for filename do
      if [ ! -f /usr/local/bin/$filename ];then
       chmod +x "$filename";
      fi
    done' bash {} +
rm -rf  /usr/local/bin/scripts/
chown -R www-data:www-data  /var/www/
chmod -R g+rw /var/www
chmod -R 755 /var/www/app
chmod -R 777 /var/www/app/storage
