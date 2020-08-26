# ----------------------------------
# Environment: debian:buster-slim
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM debian:buster-slim

LABEL author="Joshua Ellis" maintainer="joshpoodle42@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN apt update \
 && apt upgrade -y

## install dependencies
RUN apt install -y gcc g++ libgcc1 lib32gcc1 gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev locales 

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --frontend noninteractive locales

## install nginx
## cd to panel dir
RUN cd /home/container
## get and install nginx
RUN apt-get install -y nginx
## create new directorys
RUN mkdir /home/container/nginx/
RUN mkdir /home/container/www/
## link directorys
RUN ln -s /etc/nginx/ /home/container/nginx/
RUN ln -s /var/www/ /home/container/www/
## cows?

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]