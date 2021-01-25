FROM debian:latest
LABEL MAINTAINER="azi<azi03@qq.com>"

ADD ss5-3.8.9-8.tar.gz /data/app

ENV EXTRA_LIBS=-lcrypto

RUN apk-get update \
    && apk-get upgrade \
    && apk-get install --no-cache bash bash-doc bash-completion \
		vim net-tools \
		build-essential gcc libpam0g-dev libldap2-dev openssl libssl-dev