#!/bin/bash

packages=(telegram-desktop)

URL_BASE=https://gitlab.archlinux.org/archlinux/packaging/packages

cd aur-pkgbuilds

git clone 

for(( i=0;i<${#array[@]};i++)) do
    URL_FULL=$URL_BASE/${array[i]}.git
    git clone $URL_FULL
done