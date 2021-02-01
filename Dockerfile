FROM debian:jessie

COPY ss5-3.8.9-8.tar.gz /ss5-3.8.9.tar.gz
RUN apt-get update \
	&& apt-get install -y make libpam0g-dev libldap2-dev openssl libpcap-dev libssl-dev \
	&& rm -rf /var/lib/apt/lists/*

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