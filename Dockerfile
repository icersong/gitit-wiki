## Dockerfile for gitit

FROM resin/rpi-raspbian
MAINTAINER icersong "icersong@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# install git, ssh, supervisor
RUN apt-get update && apt-get install -y git supervisor libghc-zlib-dev
RUN apt-get install -y libluajit-5.1-2 libjs-jquery libjs-jquery-hotkeys libjs-jquery-ui liblua5.1-0 libyaml-0-2
RUN curl http://ftp.cn.debian.org/debian/pool/main/g/gitit/gitit_0.12.1.1+dfsg-6+b4_armhf.deb > /root/gitit_0.12.1.1_armhf.deb
RUN curl http://ftp.cn.debian.org/debian/pool/main/g/gitit/libghc-gitit-data_0.12.1.1+dfsg-6_all.deb > /root/libghc-gitit-data_0.12.1.1_all.deb
RUN dpkg -i /root/libghc-gitit-data_0.12.1.1_all.deb
RUN dpkg -i /root/gitit_0.12.1.1_armhf.deb
RUN rm -f /root/libghc-gitit-data_0.12.1.1_all.deb
RUN rm -f /root/gitit_0.12.1.1_armhf.deb
RUN echo "root:QRZ0uBzJ" | chpasswd

VOLUME ["/data/gitit"]
WORKDIR /data/gitit

ADD . /data/gitit

EXPOSE 3000

ENTRYPOINT ["/data/gitit/docker-entrypoint.sh"]
