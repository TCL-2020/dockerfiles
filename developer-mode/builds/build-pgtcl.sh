#!/bin/sh -e
. /builds/common.sh

build_setup

if [ ! -d /workspace/Pgtcl ]; then
	cd /workspace && sh /builds/download-pgtcl.sh
fi

cd /workspace/Pgtcl || exit 1
autoreconf --force --install --verbose
./configure  --with-tcl=/usr/lib --with-tclinclude=/usr/include --with-postgres-include=/usr/include/postgresql --with-postgres-lib=/usr/lib/x86_64-linux-gnu
make && make install

build_cleanup
