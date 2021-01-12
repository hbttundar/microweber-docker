#!/bin/bash
set -e
#execute drupal8 marketing modules test
cd web/core/ && ../../vendor/bin/phpunit ../modules/Marketing/"$1"