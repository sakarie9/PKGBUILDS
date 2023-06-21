#!/bin/bash

sed -i 's/GOOS=linux CGO_ENABLED=0/GOOS=linux CGO_ENABLED=0 GOAMD64=v3/g' $1
sed -i 's/arch=("x86_64" '\''aarch64'\'')/arch=(x86_64_v3)/g' $1
echo "=== $1 ==="
cat $1
echo "=== $1 ==="