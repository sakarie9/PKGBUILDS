#!/bin/bash

packages=(telegram-desktop)

URL_BASE=https://gitlab.archlinux.org/archlinux/packaging/packages

for(( i=0;i<${#array[@]};i++)) do
    pkgbase=${array[i]}
    URL_FULL=$URL_BASE/$pkgbase.git
    git clone $URL_FULL aur-pkgbuilds/$pkgbase

    echo "- directory: $pkgbase" >> aur-repos.yaml
done