FROM composer:2

ENV GROUP=app
ENV USER=app

RUN adduser -g ${GROUP} -s /bin/sh -D ${USER}

USER ${USER}:${GROUP}