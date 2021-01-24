FROM frolvlad/alpine-glibc:latest
LABEL MAINTAINER="azi<azi03@qq.com>"

RUN echo -e "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free\n \
	deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free\n \
	deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free\n \
	deb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free" >> /etc/apt/sources.list

ADD ss5-3.8.9-8.tar.gz /data/app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash bash-doc bash-completion \
        gcc gcc-c++ automake make pam-devel openldap-devel cyrus-sasl-devel openssl-devel 