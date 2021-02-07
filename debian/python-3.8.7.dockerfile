# name: dukthosting/ptero-python
# tag: 3.8.7-buster
# ----------------------------------
# Environment: python:3.8.7-buster
# Minimum Panel Version: 0.7.X
# ----------------------------------
FROM python:3.8.7-buster

LABEL author="Dukt Hosting" maintainer="josh@dukthosting.net"

ENV USER=root

## update base packages
RUN apt update \
 && apt upgrade -y

## install dependencies
RUN apt install -y sudo gcc g++ libgcc1 lib32gcc1 gdb libc6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 cabextract iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
    libfontconfig libicu63 icu-devtools libunwind8 libssl-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape203 locales ffmpeg gnupg2 apt-transport-https software-properties-common ca-certificates tzdata

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --frontend noninteractive locales

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
