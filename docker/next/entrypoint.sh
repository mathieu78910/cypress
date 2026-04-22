#!/bin/sh

if [ "$APP_ENV" = "dev" ]; then
  npm install
fi

exec "$@"
