#!/bin/bash

process_pkgbuild() {
  source PKGBUILD

  url=$(echo "${source[0]}" | grep "git+" | cut -d '+' -f 2)

  if [ -n "$url" ]; then
    git clone "$url" "$_pkgname"
  else
    echo "No git URL found in source variable."
  fi

  sed -i "s/pkgver=.*/pkgver=$(pkgver)/g" PKGBUILD

  rm -rf $_pkgname
}

for dir in $(find "pkgbuilds" -type d -name "*-git"); do

  pkgbuild_file="$dir/PKGBUILD"
  if [ -f $pkgbuild_file ]; then
    cd $dir
    process_pkgbuild
  fi

done

