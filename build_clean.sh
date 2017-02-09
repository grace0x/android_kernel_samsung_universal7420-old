#!/bin/bash
# For clean Kerneldir
BUILD_WHERE=$(pwd)
BUILD_KERNEL_DIR=$BUILD_WHERE
BUILD_CROSS_COMPILE=/home/aarch64-sabermod-7.0/bin/aarch64-

make clean
make distclean
make mrproper

rm -rf $BUILD_KERNEL_DIR/fips_fmp_utils
rm -rf $BUILD_KERNEL_DIR/fmp_hmac.bin