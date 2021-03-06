#!/bin/sh
#

make distclean

if ! ./configure --enable-coverage --enable-sde; then
	exit 1
fi

if ! make lcov_reset check lcov_capture lcov_html; then
	exit 1
fi

rm -rf cov_release
mv cov cov_release

if ! make distclean; then
	exit 1
fi

if ! ./configure --enable-valgrind; then
	exit 1
fi

if ! make check distclean; then
	exit 1
fi

if ! ./configure ; then
	exit 1
fi

