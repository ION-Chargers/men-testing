# Copyright (C) 2021 ION Chargers
# Licensed under MIT License
# Author: Luis Leon <luis@luisleon.me>

FROM node:12.18.2

# Persistent dependencies - MongoDB
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends; \
    apt-get install wget libcurl3 openssl liblzma5 -y; \
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian92-4.4.0.tgz; \
    tar xzf mongodb-linux-x86_64-debian92-4.4.0.tgz; \
    cp -r mongodb-linux-x86_64-debian92-4.4.0/bin/* /usr/local/bin/; \
    ulimit -n 64000; \
    mkdir -p /var/lib/mongo; \
    mkdir -p /var/log/mongodb; \
    mkdir -p /data/db;

# Copy entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# Add Tini
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]

CMD ["/bin/bash"]
