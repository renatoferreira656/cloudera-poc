FROM ubuntu:14.04

ENV DEBIAN_FROTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install vim wget curl openssh-server

WORKDIR /opt

ADD docker/util /opt/util
RUN chmod +x /opt/util/*.sh
RUN util/download_binaries.sh
RUN tar xzf util/gen/binaries/jdk-8u91-linux-x64.tar.gz

RUN ln -s jdk* jdk
RUN mkdir -p /usr/lib/jvm/
RUN ln -s /opt/jdk /usr/lib/jvm/default-java
ENV JAVA_HOME /opt/jdk


RUN wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin
RUN chmod u+x cloudera-manager-installer.bin
CMD /bin/bash
# RUN echo "y" | ./cloudera-manager-installer.bin


