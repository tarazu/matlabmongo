# MATLAB Mongo

Code for running mongocxx driver from matlab.

Objective is to get good performance.

# Usage

Installing mongocxx (snippet from a Dockerfile for ubuntu):

```
# This may be incomplete
RUN apt-get -y update && apt -y upgrade && apt-get -y install \
    g++ \
    gcc \
    make \
    cmake \
    wget \
    zlib1g-dev \
    libssl-dev \
    build-essential \
    pkg-config \
    libboost-dev \
    libsasl2-dev

# Mongo C driver
RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.17.7/mongo-c-driver-1.17.7.tar.gz && \
    tar xzf mongo-c-driver-1.17.7.tar.gz && \
    cd mongo-c-driver-1.17.7 && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
    cmake --build . && \
    cmake --build . --target install

# Mongo CXX driver
RUN wget https://github.com/mongodb/mongo-cxx-driver/releases/download/r3.6.5/mongo-cxx-driver-r3.6.5.tar.gz && \
    tar -xzf mongo-cxx-driver-r3.6.5.tar.gz && \
    cd mongo-cxx-driver-r3.6.5/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DCMAKE_CXX_STANDARD=17 -DBSONCXX_POLY_USE_BOOST=1 && \
    cmake --build . && \
    cmake --build . --target install
```