#!/usr/bin/env bash

# defaults
WIRESHARK_VERSION_TAG=v2.6.0
WIRESHARK_BUILD_DIRECTORY=/tmp/wireshark

# ensure directory is not present
rm -rf ${WIRESHARK_BUILD_DIRECTORY}

# get git repository
git clone https://code.wireshark.org/review/wireshark ${WIRESHARK_BUILD_DIRECTORY}

# change to git repository
pushd ${WIRESHARK_BUILD_DIRECTORY}

# get tag
git checkout tags/${WIRESHARK_VERSION_TAG}

# generate build files
./autogen.sh

# configure
./configure --with-gtk=yes --with-qt=no

# build
make rpm-package

# restore directory
popd
