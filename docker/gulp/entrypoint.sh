#!/bin/bash
set -e

if which gulp > /dev/null
then
  echo "Gulp is installed, skipping..."
else
  echo "Gulp not yet installed, installing now"
  npm install --global gulp-cli
  echo "local Gulp not yet installed, installing now"
  npm install gulp
  echo "Gulp installed, starting npm install"
  npm install --verbose
  gulp --version
  echo "Start gulp build"
  gulp build
  echo "gulp build completed"
fi

if [[ $ENVIRONMENT = "DEV" ]]
then
  gulp watch
fi