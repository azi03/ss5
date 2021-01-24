FROM frolvlad/alpine-glibc:latest
LABEL MAINTAINER="azi<azi03@qq.com>"

ADD ss5-3.8.9-8.tar.gz /data/app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash bash-doc bash-completion \
        gcc gcc-c++ automake make pam-devel openldap-devel cyrus-sasl-devel openssl-devel 