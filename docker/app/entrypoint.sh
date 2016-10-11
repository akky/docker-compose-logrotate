#!/bin/sh

while [ 1 ]
do
  echo $(date -u) >> /var/www/application/log/app.log
  sleep 10
done
