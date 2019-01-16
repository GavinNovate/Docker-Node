FROM ubuntu

ENV NODE_VERSION=v10.15.0 NODE_DISTRO=linux-x64

RUN buildDeps='wget ca-certificates xz-utils' \
  && apt-get update \
  && apt-get install -y $buildDeps --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-$NODE_DISTRO.tar.xz \
  && tar -xJf node-$NODE_VERSION-$NODE_DISTRO.tar.xz -C /usr/local/ --strip-components=1 --no-same-owner \
  && rm /usr/local/LICENSE \
  && rm /usr/local/*.md \
  && rm node-$NODE_VERSION-$NODE_DISTRO.tar.xz \
  && apt-get purge -y --auto-remove $buildDeps

CMD [ "node" ]
