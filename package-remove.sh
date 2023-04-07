#!/bin/bash

set -e

REPO_NAME=$1 # sakari-aur
REPO_DIR=$2 # arch-repo/repo
PACKAGE=$3 # example-package

cd $REPO_DIR
rm $1.db $1.files
rm $3*

repackage() {
    mkdir temp
    tar xf $1 --directory=temp
    cd temp
    _package_name=$(ls -d $2*)
    rm -rf $_package_name
    echo "$1/$_package_name deleted"
    tar czf $1 *
    mv $1 ../
    cd ..
    rm -rf temp
}

repackage $1.db.tar.gz $3
cp $1.db.tar.gz $1.db
repackage $1.files.tar.gz $3
cp $1.files.tar.gz $1.files