FROM php:7-cli

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y sqlite3 && \
    rm -r /var/lib/apt/lists/*

COPY . /tmp/app
WORKDIR /tmp/app

ENTRYPOINT ["./start.sh"]
