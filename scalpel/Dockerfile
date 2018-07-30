FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install build-essential bzip2 cmake gcc libncurses-dev wget zlib1g-dev

WORKDIR /opt
RUN wget https://sourceforge.net/projects/scalpel/files/scalpel-0.5.4.tar.gz && \
    tar -zxvf scalpel-0.5.4.tar.gz && \ 
    cd scalpel-0.5.4 && \ 
    make

ENV PATH=/opt/scalpel-0.5.4:$PATH
