FROM nginx:stable-alpine

ENV USER=app
ENV GROUP=app

RUN mkdir -p /var/www/html/public

ADD default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user www-data/user ${USER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${GROUP} -s /bin/sh -D ${USER}