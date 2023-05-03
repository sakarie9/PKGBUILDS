#!/bin/bash
chmod +w $1
sed -i 's/GOOS=linux CGO_ENABLED=0/GOOS=linux CGO_ENABLED=0 GOAMD64=v3/g' $1