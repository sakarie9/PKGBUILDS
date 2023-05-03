#!/bin/bash

for dir in $(find "aur-pkgbuilds" -type d); do
  pkgbuild_file="$dir/PKGBUILD"
  patch_file="aur-patches/$(echo $dir | cut -d'/' -f2)/patch.sh"
  if [ -f "$pkgbuild_file" ]&&[ -f "$patch_file" ]; then
    echo $pkgbuild_file
    echo $patch_file
    eval "./$patch_file $pkgbuild_file"
  fi
done