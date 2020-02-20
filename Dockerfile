FROM alpine AS builder
RUN apk add build-base
MAINTAINER jfleach@jfleach.com

ENV PACKAGES make gcc musl-dev linux-headers

RUN apk add --update $PACKAGES && \
  cd /root && \
  wget https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/stress-ng/0.03.11-1/stress-ng_0.03.11.orig.tar.gz && \
  tar -xzf stress-ng_0.03.11.orig.tar.gz && \
  cd stress-ng-0.03.11/ && \
  make install && \
  apk del $PACKAGES

ENTRYPOINT ["/usr/bin/stress-ng"]

CMD ["--help"]
