FROM ubuntu:14.04

RUN apt-get update -qq
RUN apt-get install -y wget

# Setup go
RUN wget https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.4.3.linux-amd64.tar.gz
    
RUN mkdir -p /go/src/app /go/bin && chmod -R 777 /go
ENV PATH /go/bin:/usr/local/go/bin:$PATH
ENV GOPATH /go

# Compile containerbackdoor
COPY ./provision/containerbackdoor.go /go/src/app/
RUN go install app

VOLUME /target
ENTRYPOINT cp /go/bin/app /target/containerbackdoor

