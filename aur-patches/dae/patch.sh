#!/bin/bash

sed -i 's/make VERSION="$pkgver"/make VERSION="$pkgver" GOOS=linux CGO_ENABLED=0 GOAMD64=v3/g' $1
echo "=== $1 ==="
cat $1
echo "=== $1 ==="