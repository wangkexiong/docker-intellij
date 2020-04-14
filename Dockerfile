FROM ubuntu:bionic
LABEL maintainer wangkexiong<wangkexiong@gmail.com>

ARG IDEA_BUILD=2020.1

RUN apt-get update && \
    apt-get install -y curl openjdk-8-jre && \
    apt-get autoremove -y && apt-get clean all -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/log/apt/*

RUN mkdir -p /opt/idea && cd /opt/idea && \
    IDEA_SOURCE=https://download.jetbrains.com/idea/ideaIC-${IDEA_BUILD}.tar.gz && \
    curl -fsSL $IDEA_SOURCE -o /opt/idea/installer.tgz && \
    tar --strip-components=1 -xzf installer.tgz && \
    rm -rf installer.tgz

CMD [ "/opt/idea/bin/idea.sh" ]
