FROM ubuntu:18.04

# install tzdata before the deuid deps script tries to as otherwise will prompt for tz
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Australia/Melbourne
RUN apt update && apt-get -y install tzdata

# Prerequisites including most of ones from engine repo: src/build/install-build-deps.sh
# BUT src/build/install-build-deps.sh still needs to be run to pick some special case, symlinks, etc.
RUN apt install -y \
    curl git unzip xz-utils zip python build-essential pkg-config lsb-release sudo \
    bison cdbs curl dpkg-dev elfutils devscripts fakeroot \
    flex g++ git-core git-svn gperf \
    libasound2-dev libbrlapi-dev \
    libbz2-dev libcairo2-dev libcap-dev libcups2-dev libcurl4-gnutls-dev \
    libdrm-dev libelf-dev libexif-dev libgconf2-dev libglib2.0-dev \
    libglu1-mesa-dev libgnome-keyring-dev libgtk2.0-dev libkrb5-dev \
    libnspr4-dev libnss3-dev libpam0g-dev libpci-dev libpulse-dev \
    libsctp-dev libspeechd-dev libsqlite3-dev libssl-dev libudev-dev \
    libwww-perl libxslt1-dev libxss-dev libxt-dev libxtst-dev \
    patch perl pkg-config python python-cherrypy3 python-crypto \
    python-dev python-numpy python-opencv python-openssl python-psutil \
    python-yaml rpm ruby subversion wdiff \
    libatk1.0-0 libc6 libasound2 libcairo2 libcap2 libcups2 libexpat1 \
    libexif12 libfontconfig1 libfreetype6 libglib2.0-0 libgnome-keyring0 \
    libgtk2.0-0 libpam0g libpango1.0-0 libpci3 libpcre3 libpixman-1-0 \
    libspeechd2 libstdc++6 libsqlite3-0 libx11-6 libxau6 libxcb1 \
    libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 libxext6 libxfixes3 \
    libxi6 libxinerama1 libxrandr2 libxrender1 libxtst6 zlib1g


RUN useradd -ms /bin/bash  developer
USER developer
WORKDIR /home/developer