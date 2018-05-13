#!/usr/bin/env bash

# install epel
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# install ius
yum install -y https://centos7.iuscommunity.org/ius-release.rpm

# ensure git is not installed
yum erase -y git perl-Git

# install needed packages
yum install -y \
    automake \
    bison \
    c-ares-devel \
    desktop-file-utils \
    flex \
    gcc \
    gcc-c++ \
    git2u \
    gtk3-devel \
    libgcrypt-devel \
    libnghttp2-devel \
    libpcap-devel \
    libtool \
    libxml2-devel \
    lz4-devel \
    qt-devel \
    rpm-build \
    snappy-devel
