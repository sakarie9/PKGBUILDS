#!/bin/bash

process_pkgbuild() {
  cd $1
  source PKGBUILD

  if declare -p "$source" &>/dev/null; then
    eval "_source=\${${source}[0]}"
  else
    _source="${source}"
  fi

  echo $_source

  url=$(echo "${source}" | cut -d '+' -f 2 | cut -d '#' -f 1)
  branch=$(echo "${source}" | grep 'branch' | cut -d '#' -f 2 | cut -d '=' -f 2)

  if [ -n "$url" ]; then
    if [ -n "$branch" ]; then
      git clone "$url" "$_pkgname" -b "$branch"
    else
      git clone "$url" "$_pkgname"
    fi
    sed -i "s/pkgver=.*/pkgver=$(pkgver)/g" PKGBUILD
    rm -rf $_pkgname
    cd ../..
  else
    echo "No git URL found in source variable."
    cd ..
  fi
}

for dir in $(find "pkgbuilds" -type d -name "*-git"); do
  pkgbuild_file="$dir/PKGBUILD"
  if [ -f $pkgbuild_file ]; then
    echo $dir
    process_pkgbuild $dir
  fi
done

