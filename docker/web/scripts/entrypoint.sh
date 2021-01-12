#!/bin/bash
set -e
chmod a+x ~/.bashrc
PS1='$ '
echo 'export PATH="/var/www/app/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
if [ "$ENVIRONMENT" = "DEV" ]; then
  sh /usr/local/bin/DevInitializer.sh
fi
if [ "$ENVIRONMENT" = "STAGE" ]; then
  sh /usr/local/bin/StageInitializer.sh
fi
if [ "$ENVIRONMENT" = "LIVE" ]; then
  sh /usr/local/bin/LiveInitializer.sh
fi
sh /usr/local/bin/start.sh