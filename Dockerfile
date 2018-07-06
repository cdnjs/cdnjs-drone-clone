FROM alpine:3.8
LABEL maintainer='Peter Dave Hello <hsu@peterdavehello.org>'
LABEL name='cdnjs-drone-clone'
LABEL version='latest'
ADD cdnjs.fetch.sh /bin/
ADD ColorEchoForShell/dist/ColorEcho.sh /
RUN apk -U upgrade && \
    apk -v add git openssl && \
    rm -rf /var/cache/apk/*
ENTRYPOINT /bin/cdnjs.fetch.sh
