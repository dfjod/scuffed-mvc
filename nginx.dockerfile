FROM nginx:stable-alpine

ENV USER=app
ENV GROUP=app

RUN adduser -g ${GROUP} -s /bin/sh -D ${USER}

ADD default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user = www-data/user = ${USER}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html/public
