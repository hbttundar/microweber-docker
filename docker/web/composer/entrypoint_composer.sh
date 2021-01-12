#!/bin/bash
set -e
cd /var/www/app
composer self-update
composer install