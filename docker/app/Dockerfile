FROM alpine:3.2
MAINTAINER Akky AKIMOTO <akimoto@gmail.com>

USER root

WORKDIR /var/www/application/log
RUN chown -R 1000:50 .

ADD ./entrypoint.sh /entrypoint.sh
RUN chown root /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
