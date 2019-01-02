FROM ubuntu

ENV NODE_VERSION=v10.15.0 NODE_DISTRO=linux-x64

RUN apt-get update \
  && apt-get install -y git-core \
  && apt-get install -y wget \
  && apt-get install -y xz-utils \
  && wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-$NODE_DISTRO.tar.xz \
  && mkdir /usr/local/lib/node \
  && tar -xJvf node-$NODE_VERSION-$NODE_DISTRO.tar.xz -C /usr/local/lib/node \
  && mv /usr/local/lib/node/node-$NODE_VERSION-$NODE_DISTRO /usr/local/lib/node/node-$NODE_VERSION \
  && rm node-$NODE_VERSION-$NODE_DISTRO.tar.xz \
  && echo "export NODE_HOME=/usr/local/lib/node/node-$NODE_VERSION/bin" >> ~/.profile \
  && echo "export PATH=\$NODE_HOME:\$PATH" >> ~/.profile \
  && . ~/.profile \
  && ln -s /usr/local/lib/node/node-$NODE_VERSION/bin/node /usr/bin/node \
  && ln -s /usr/local/lib/node/node-$NODE_VERSION/bin/npm /usr/bin/npm \
  && ln -s /usr/local/lib/node/node-$NODE_VERSION/bin/npx /usr/bin/npx \
  && apt-get purge -y --auto-remove wget \
  && apt-get purge -y --auto-remove xz-utils
