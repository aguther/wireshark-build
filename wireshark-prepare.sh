#!/usr/bin/env bash

# install epel
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install ius
yum install -y https://centos7.iuscommunity.org/ius-release.rpm

# install needed packages
yum install -y \
    bison-2.7-4.el7 \
    c-ares-devel-1.10.0-3.el7 \
    desktop-file-utils-0.22-1.el7 \
    flex-2.5.37-3.el7 \
    gcc-4.8.5-4.el7 \
    gcc-c++-4.8.5-4.el7 \
    git2u \
    gtk3-devel-3.14.13-16.el7 \
    libgcrypt-devel-1.5.3-12.el7_1.1 \
    libnghttp2-devel \
    libpcap-devel \
    libtool-2.4.2-20.el7 \
    libxml2-devel-2.9.1-5.el7_1.2 \
    lz4-devel \
    qt-devel-4.8.5-11.el7 \
    rpm-build-4.11.3-17.el7 \
    snappy-devel
