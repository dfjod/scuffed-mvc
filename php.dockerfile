FROM php:8.3-fpm-alpine

ARG DOCKER_UID
ARG DOCKER_GID

RUN docker-php-ext-install pdo pdo_mysql

RUN adduser -g ${DOCKER_GID} -s /bin/sh -D ${DOCKER_UID}

RUN sed -i "s/user = www-data/user = ${DOCKER_UID}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${DOCKER_GID}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

USER ${DOCKER_UID}:${DOCKER_GID}

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
