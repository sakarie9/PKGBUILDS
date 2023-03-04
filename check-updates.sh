#!/bin/bash

min_days_no_commit=114514

check_pkgbuild() {
    source PKGBUILD
    org=$(echo $url | awk -F/ '{print $(NF-1)}')
    repo=$(echo $url | awk -F/ '{print $NF}' | sed 's/\.git//')
    url="https://api.github.com/repos/$org/$repo/commits"
    days=$(curl -s $url | jq -r ".[0] | ((now - (.commit.author.date | fromdateiso8601) )  / (60*60*24)  | trunc)")
    min_days_no_commit=$((min_days_no_commit < days ? min_days_no_commit : days))
}

for dir in $(find "pkgbuilds" -type d -name "*-git"); do

  pkgbuild_file="$dir/PKGBUILD"
  if [ -f $pkgbuild_file ]; then
    cd $dir
    check_pkgbuild
  fi
  #echo $min_days_no_commit
  exit $min_days_no_commit
done