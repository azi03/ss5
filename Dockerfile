FROM debian:jessie

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main\n \
deb http://mirrors.163.com/debian wheezy main non-free contrib\n \
deb http://mirrors.163.com/debian wheezy-proposed-updates main contrib non-free\n \
deb http://mirrors.163.com/debian-security wheezy/updates main contrib non-free" > /etc/apt/sources.list
#RUN sed -i '/jessie-updates/d' /etc/apt/sources.list

RUN apt-get update \
	&& apt-get install -y gcc make libpam0g-dev libldap2-dev openssl libpcap-dev libssl-dev \
	&& rm -rf /var/lib/apt/lists/*

COPY ss5-3.8.9-8.tar.gz /ss5-3.8.9.tar.gz

RUN tar zxvf ss5-3.8.9.tar.gz \
	&& cd /ss5-3.8.9 \
	&& ./configure \
	&& make \
	&& make install \
	&& rm -rf /ss5-3.8.9

RUN touch /etc/opt/ss5/ss5.passwd
RUN touch /etc/opt/ss5/ss5.ha

# COPY conf/ss5.conf /etc/opt/ss5/ss5.conf

EXPOSE 18080

CMD /usr/sbin/ss5 -t -b 0.0.0.0:18080 && /usr/bin/tail -f /var/log/ss5/ss5.log