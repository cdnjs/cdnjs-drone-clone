FROM alpine:edge
MAINTAINER Peter Dave Hello <hsu@peterdavehello.org>
RUN mkdir -p    /root/.ssh/
ADD known_hosts /root/.ssh/
ADD cdnjs.fetch.sh /bin/
RUN apk -Uuv add git openssh-client openssl
ENTRYPOINT /bin/cdnjs.fetch.sh
