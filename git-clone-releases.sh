#!/bin/bash

ACTION_REPO=$1
ACTION_PATH=$2

response=$(curl -s https://api.github.com/repos/$ACTION_REPO/releases/latest)
if [[ $response == *"\"message\": \"Not Found\""* ]]; then
    echo "Release not found."
    mkdir -p $ACTION_PATH
else
    echo "Release found."
    curl -s "https://api.github.com/repos/$ACTION_REPO/releases" \
    | grep "browser_download_url" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -nv -P ${ACTION_PATH} -i -
fi
