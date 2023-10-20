FROM quay.io/invidious/invidious:latest

USER root
RUN apk update && apk add postgresql14

RUN mkdir /run/postgresql &&\
    chown postgres:postgres /run/postgresql &&\
    chmod 0700 /run/postgresql

USER postgres
RUN mkdir /var/lib/postgresql/data &&\
    chmod 0700 /var/lib/postgresql/data &&\
    initdb -D /var/lib/postgresql/data

ENV POSTGRES_USER kemal
ENV POSTGRES_DB invidious

USER root
COPY ./config /config
COPY ./init-invidious-db.sh /
RUN chmod +x /init-invidious-db.sh
USER postgres
RUN pg_ctl start -D /var/lib/postgresql/data && /bin/sh /init-invidious-db.sh

ARG YQ_VERSION=v4.35.2
ARG YQ_BINARY=yq_linux_amd64
ENV HMAC_KEY="5320e2ef5dfd80653f9cfdd45d6d4cdde3d6e8c92ca9447ce21a9b32e9e267d0"

USER root
WORKDIR /invidious
ADD https://raw.githubusercontent.com/iv-org/invidious/master/config/config.example.yml config/config.yml
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY} -O /usr/bin/yq && chmod +x /usr/bin/yq
RUN yq '.hmac_key = env(HMAC_KEY)' -i config/config.yml

EXPOSE 3000
CMD su - postgres -c "pg_ctl start -D /var/lib/postgresql/data" && /invidious/invidious
