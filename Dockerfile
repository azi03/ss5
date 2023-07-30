FROM debian:jessie

RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian/ jessie main non-free contrib\n \
deb [check-valid-until=no] http://archive.debian.org/debian/ jessie-backports main non-free contrib\n \
deb-src [check-valid-until=no] http://archive.debian.org/debian/ jessie main non-free contrib\n \
deb-src [check-valid-until=no] http://archive.debian.org/debian/ jessie-backports main non-free contrib\n \
deb [check-valid-until=no] http://archive.debian.org/debian-security/ jessie/updates main non-free contrib\n \
deb-src [check-valid-until=no] http://archive.debian.org/debian-security/ jessie/updates main non-free contrib" > /etc/apt/sources.list
#RUN sed -i '/jessie-updates/d' /etc/apt/sources.list

RUN apt-get update \
	&& apt-get install -y --force-yes gcc make libpam0g-dev libldap2-dev openssl libpcap-dev libssl-dev \
	&& rm -rf /var/lib/apt/lists/*

#COPY ss5-3.8.9-8.tar.gz /ss5-3.8.9.tar.gz

ADD ss5-3.8.9 /ss5-3.8.9

RUN cd /ss5-3.8.9 \
    && chmod +x configure \
	&& ./configure \
	&& make \
	&& make install \
	&& rm -rf /ss5-3.8.9

RUN touch /etc/opt/ss5/ss5.passwd
RUN touch /etc/opt/ss5/ss5.ha

# COPY conf/ss5.conf /etc/opt/ss5/ss5.conf

EXPOSE 18080

CMD /usr/sbin/ss5 -t -b 0.0.0.0:18080 && /usr/bin/tail -f /var/log/ss5/ss5.log