#!/bin/bash
set -e
a2enmod rewrite
a2enmod headers
a2enmod expires
a2enmod ssl
/usr/sbin/apache2 -D FOREGROUND