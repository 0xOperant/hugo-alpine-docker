FROM alpine:3.11

ENV VERSION_HUGO 0.67.0

RUN apk add --no-cache git openssl openssh py-pygments libc6-compat g++ curl

## Install Hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v${VERSION_HUGO}/hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz && \
    tar -xf hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz hugo -C / && \
    mv /hugo /usr/bin/hugo && \
    rm -rf hugo_extended_${VERSION_HUGO}_Linux-64bit.tar.gz

ENTRYPOINT [ "sh", "-c" ]