FROM alpine:latest

RUN \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
  apk update && apk upgrade && \
  apk add certbot && \
  rm -rf /var/cache/apk/*

STOPSIGNAL SIGTERM

ENTRYPOINT ["certbot"]

