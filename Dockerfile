FROM ubuntu:18.04

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip python

RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer