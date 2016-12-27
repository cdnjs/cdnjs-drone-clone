FROM alpine:edge
MAINTAINER Peter Dave Hello <hsu@peterdavehello.org>
RUN mkdir -p    /root/.ssh/
ADD known_hosts /root/.ssh/
ADD cdnjs.fetch.sh /bin/
ADD ColorEchoForShell/dist/ColorEcho.sh /
RUN apk -U upgrade && \
    apk -v add git openssl && \
    rm -rf /var/cache/apk/*
ENTRYPOINT /bin/cdnjs.fetch.sh
