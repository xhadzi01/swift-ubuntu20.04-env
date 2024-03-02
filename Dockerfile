ARG BASE_VERSION=20.04

FROM ubuntu:${BASE_VERSION} AS base

RUN apt-get update && apt-get install 

# setup env for package installation
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

RUN apt-get install -y git \
                       cmake \
                       ninja-build \
                       clang \
                       python \
                       uuid-dev \
                       libicu-dev \
                       icu-devtools \
                       libedit-dev \
                       libxml2-dev \
                       libsqlite3-dev \
                       swig \
                       libpython2-dev \
                       python-six \
                       libncurses5-dev \
                       pkg-config \
                       libcurl4-openssl-dev \
                       systemtap-sdt-dev \
                       tzdata \
                       rsync

RUN mkdir swift-source && cd swift-source

RUN git clone https://github.com/apple/swift.git

RUN ./swift/utils/update-checkout --clone
RUN ./swift/utils/build-script --preset=buildbot_swiftpm_linux_platform,tools=RA,stdlib=RA

RUN cd /opt && \
    mkdir swift && \
    chmod 777 swift && \
    cd swift && \
    mkdir swift-5.10-dev && \
    cd swift-5.10-dev
