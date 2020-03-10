FROM alpine:3.11

ENV HUGO_VERSION 0.67.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit

RUN apk add --no-cache git openssl openssh py-pygments libc6-compat g++ curl

# Download and Install hugo
RUN mkdir /usr/local/hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/hugo/
RUN tar xzf /usr/local/hugo/${HUGO_BINARY}.tar.gz -C /usr/local/hugo/ \
	&& ln -s /usr/local/hugo/hugo /usr/local/bin/hugo \
	&& rm /usr/local/hugo/${HUGO_BINARY}.tar.gz

EXPOSE 1313
ENTRYPOINT [ "sh", "-c" ]