#!/bin/bash
set -e
PS1='$ '
if [ "$APP_ENV" = "local" ]; then
  sh /usr/local/bin/DevInitializer.sh
fi
if [ "$APP_ENV" = "stage" ]; then
  sh /usr/local/bin/StageInitializer.sh
fi
if [ "$APP_ENV" = "live" ]; then
  sh /usr/local/bin/LiveInitializer.sh
fi
sh /usr/local/bin/start.sh
