#!/bin/bash

REPO=sakarie9/arch-repo
REPO=sakarie9/kikitoru
REPO=$1
PATH=$2

curl -s "https://api.github.com/repos/$REPO/releases/latest" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -nv -P $2 -i -