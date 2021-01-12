#!/bin/bash
set -e
npm install npm -g
npm install -f --save-optional
#npm install npm -g
#npm install -f --save-optional
npm install cross-env
npm install --global cross-env
npm install -g npm-install-peers
npm install webpack -g
npm install webpack-cli -g
npm install tailwindcss
if [[ $ENVIRONMENT = "DEV" ]]
then
  npm run dev
  npm run watch
fi
if [[ $ENVIRONMENT != "DEV" ]]
then
  npm run production
fi
