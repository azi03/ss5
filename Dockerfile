FROM debian:7
LABEL MAINTAINER="azi<azi03@qq.com>"

ADD ss5-3.8.9-8.tar.gz /data/app

ENV EXTRA_LIBS=-lcrypto

RUN apt-get update \
    && apt-get install -y bash bash-doc bash-completion \
		vim net-tools \
		build-essential gcc libpam0g-dev libldap2-dev openssl libssl-dev \
	&& cd /data/app/ss5-3.8.9 \
	&& ./configure && make && make intall \
	&& chmod +x /etc/init.d/ss5