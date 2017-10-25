#!/usr/bin/env bash

# install epel
yum install -y epel-release

# install needed packages
yum install -y \
    bison \
    c-ares-devel \
    desktop-file-utils \
    flex \
    gcc \
    gcc-c++ \
    git \
    gtk3-devel \
    libgcrypt-devel \
    libnghttp2-devel \
    libpcap-devel \
    libtool \
    libxml2-devel \
    lz4-devel \
    qt-devel \
    qt5-linguist \
    qt5-qtbase-devel \
    qt5-qtmultimedia-devel \
    rpm-build \
    snappy-devel
