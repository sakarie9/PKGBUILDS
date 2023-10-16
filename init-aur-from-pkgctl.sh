#!/bin/bash

packages=(telegram-desktop)

URL_BASE=https://gitlab.archlinux.org/archlinux/packaging/packages

for(( i=0;i<${#packages[@]};i++)) do
    pkgbase=${packages[i]}
    URL_FULL=$URL_BASE/$pkgbase.git
    git clone $URL_FULL aur-pkgbuilds/$pkgbase

    echo "- directory: $pkgbase" >> aur-repos.yaml
done