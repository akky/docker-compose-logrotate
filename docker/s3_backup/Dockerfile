FROM alpine:3.2
MAINTAINER Akky AKIMOTO <akimoto@gmail.com>

###############
# install AWS CLI
# https://github.com/sekka1/aws-cli-docker/blob/master/Dockerfile
RUN apk update
RUN apk add python py-pip py-setuptools ca-certificates groff less
RUN pip install awscli

###############
# install logrotate
RUN apk add logrotate
ADD config/logrotate/logrotate.conf /etc/logrotate.conf
RUN chmod go-wx /etc/logrotate.conf
ADD config/logrotate/logrotate.sh /logrotate.sh
RUN chown root:root /logrotate.sh
RUN chmod +x /logrotate.sh

###############
# file locations

USER root
WORKDIR /var/www/application/cache
RUN chown -R 1000:50 .
WORKDIR /var/www/application/log
RUN chown -R 1000:50 .

###############
# cron user

RUN mkdir -p /cronusr && \
    addgroup -g 500 cronusr && \
    adduser -G cronusr -S -u 500 -h /cronusr -s /bin/sh cronusr && \
    chown -R 500:500 /cronusr

###############
# cron

# prepare backup script
ADD config/backup-to-s3.sh /backup-to-s3.sh
RUN chmod +x /backup-to-s3.sh

# Add crontab file into the cron directory
#  http://qiita.com/shufo/items/9def5e9a6f44996312b8
ADD crontab.txt /var/spool/cron/crontabs/root

###############
# set aws credentials and config
# http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-config-files
RUN umask 0077; mkdir /root/.aws
ADD config/aws/credentials.txt /root/.aws/credentials
ADD config/aws/config.txt /root/.aws/config
## I thought that /root/.aws is default, but need to set explicitely.
## maybe ownership and permissions?
ENV AWS_CONFIG_FILE /root/.aws/config
ENV AWS_SHARED_CREDENTIALS_FILE /root/.aws/credentials

# -l : log verbose level 0 to 8
# -f : foreground
CMD crond -l 2 -f
