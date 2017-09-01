FROM alpine:3.4
MAINTAINER mapix <mapix.me@gmail.com>

WORKDIR /app
VOLUME /app
COPY startup.sh /startup.sh

ADD repositories /etc/apk/repositories 
RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*
COPY my.cnf /etc/mysql/my.cnf

EXPOSE 3306
CMD ["/startup.sh"]
