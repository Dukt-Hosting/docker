FROM        --platform=$BUILDPLATFORM mcr.microsoft.com/dotnet/aspnet:5.0.6

LABEL       author="Dukt Hosting" maintainer="support@dukthosting.net"

RUN         apt update
RUN         apt-get --update --no-cache ca-certificates curl ffmpeg git openssl sqlite tar tzdata \
                && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
