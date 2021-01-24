FROM centos:7
LABEL MAINTAINER="azi<azi03@qq.com>"

ADD ss5-3.8.9-8.tar.gz /data/app

RUN yum -y install gcc automake make pam-devel openldap-devel cyrus-sasl-devel openssl-devel \
    && cd /data/app/ss5-3.8.9 \
    && ./configure \
	&& make \
	&& make install
	
ENTRYPOINT [ "/etc/init.d/ss5 start" ]
