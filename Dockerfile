FROM ubuntu:14.04

ENV DEBIAN_FROTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install vim wget curl openssh-server

RUN wget "https://archive.cloudera.com/director/ubuntu/trusty/amd64/director/cloudera-director.list" -O /etc/apt/sources.list.d/cloudera-director.list
RUN cat /etc/apt/sources.list.d/cloudera-director.list
RUN curl -s "https://archive.cloudera.com/director/ubuntu/trusty/amd64/director/archive.key" | sudo apt-key add -

RUN apt-get -y update
RUN apt-get install -y cloudera-director-server

ADD docker/util /opt/util

RUN chmod +x /opt/util/*.sh

WORKDIR /opt

RUN util/download_binaries.sh

RUN tar xzf util/gen/binaries/jdk-8u91-linux-x64.tar.gz
RUN ln -s jdk* jdk
RUN ln -s /opt/jdk /usr/lib/jvm/default-java
ENV JAVA_HOME /opt/jdk

CMD /bin/bash
