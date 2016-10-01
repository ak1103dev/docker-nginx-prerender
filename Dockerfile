FROM nginx:1.11.3

MAINTAINER David Kelley <david.james.kelley@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV LISTEN_ON 80

ENV CONFD_VERSION 0.10.0

ENV UPSTREAM_SERVICE service.prerender.io

RUN apt-get update && apt-get install -y python curl && curl -O https://bootstrap.pypa.io/get-pip.py && \
      python get-pip.py

RUN update-ca-certificates

ADD etc/confd /etc/confd

ADD confd/confd-0.10.0-linux-amd64 /bin/confd

WORKDIR /nginx

ADD boot boot

CMD ["./boot"]
