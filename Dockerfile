# Oracle Java 8 Dockerfile on debian:jessie
FROM debian:jessie

MAINTAINER Anestis Georgiadis <mranest@gmail.com>

# Define JAVA_VERSION - 8u66-b17
ENV JAVA_VERSION 8u66+8u65arm-1~webupd8~1

# Install Java
# see: http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
  echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
  apt-get update && \
  apt-get install -y oracle-java8-installer=$JAVA_VERSION && \
  apt-get install -y oracle-java8-unlimited-jce-policy && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define JAVA_HOME environmental variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle