FROM nginx:stable-alpine

ARG DOCKER_UID
ARG DOCKER_GID

RUN adduser -g ${DOCKER_GID} -s /bin/sh -D ${DOCKER_UID}

ADD default.conf /etc/nginx/conf.d/default.conf

RUN sed -i "s/user = www-data/user = ${DOCKER_UID}/g" /etc/nginx/nginx.conf

RUN mkdir -p /var/www/html/public
