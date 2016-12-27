FROM alpine:edge
MAINTAINER Peter Dave Hello <hsu@peterdavehello.org>
RUN mkdir -p    /root/.ssh/
ADD known_hosts /root/.ssh/
ADD cdnjs.fetch.sh /bin/
ADD ColorEchoForShell/dist/ColorEcho.sh /
RUN apk -U upgrade
RUN apk -v add git openssl
ENTRYPOINT /bin/cdnjs.fetch.sh
