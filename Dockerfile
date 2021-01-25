FROM frolvlad/alpine-glibc:latest
LABEL MAINTAINER="azi<azi03@qq.com>"

ADD ss5-3.8.9-8.tar.gz /data/app

ENV EXTRA_LIBS=-lcrypto

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash bash-doc bash-completion \
		vim net-tools \
		build-essential gcc libpam0g-dev libldap2-dev openssl libssl-dev