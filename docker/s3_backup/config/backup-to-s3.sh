#!/bin/sh

# save application logs to AWS S3

# copy log file
#   by delaycompress option, the logs passed 2 days is compressed. sync that with date name.
aws s3 cp /var/www/application/log/app.log.2.gz s3://yonda4log/applog/$(date +%Y%m%d%H%M)-app.log.gz

# remove log file
rm /var/www/application/log/app.log.2.gz
