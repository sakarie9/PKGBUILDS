#!/bin/bash

process_pkgbuild() {
  cd $1
  makepkg -o -d
  # find . -maxdepth 1 ! -name PKGBUILD ! -name "." -exec rm -rf {} \;
  cd ../..
}

for dir in $(find "pkgbuilds" -type d -name "*-git"); do
  pkgbuild_file="$dir/PKGBUILD"
  if [ -f $pkgbuild_file ]; then
    echo $dir
    process_pkgbuild $dir
  fi
done

