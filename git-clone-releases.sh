#!/bin/bash

ACTION_REPO=$1
ACTION_PATH=$2

curl -s "https://api.github.com/repos/$ACTION_REPO/releases/latest" \
| grep "browser_download_url" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -nv -P ${ACTION_PATH} -i -