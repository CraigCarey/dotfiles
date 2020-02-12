#!/usr/bin/env bash

set -eux;

export GTEST_VERSION="1.10.0"

cd /opt/;
axel "https://github.com/google/googletest/archive/release-${GTEST_VERSION}.tar.gz";
tar -xf "./googletest-release-${GTEST_VERSION}.tar.gz";
cd "./googletest-release-${GTEST_VERSION}/";
mkdir -p "build/x86_64" && cd "build/x86_64";
cmake -DBUILD_SHARED_LIBS=ON ../..;
make -j $(nproc);
cp -a "./lib/libgtest.so" "./lib/libgtest_main.so" "./lib/libgmock.so" "./lib/libgmock_main.so" "/usr/lib/";
cd "../../";
cp -r "./googletest" "./googlemock" "/usr/src/";
cp -a -r "./googletest/include/gtest" "./googlemock/include/gmock" "/usr/include/";
