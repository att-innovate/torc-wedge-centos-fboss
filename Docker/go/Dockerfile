FROM ubuntu:14.04

RUN apt-get update -qq

RUN wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.4.3.linux-amd64.tar.gz
    
ENV PATH=$PATH:/usr/local/go/bin

VOLUME /project
WORKDIR /project
ENV GOPATH=/project/target/
