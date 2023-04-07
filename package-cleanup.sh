#!/bin/bash

# Check REPO_NAME.db and delete any other version of packages not in there

REPO_NAME=$1 # sakari-aur
REPO_DIR=$2 # arch-repo/repo
DND="DO_NOT_DELETE"

cd $REPO_DIR

if [ ! -d $DND ]; then
	mkdir $DND
fi

mv $(
	tar tf $REPO_NAME.db |
		awk -F/ 'NF==2{print $1}' |
		sort -u |
		while read line; do
			ls $line*
		done
) -t $DND

mv $REPO_NAME.db $REPO_NAME.db.tar.gz $REPO_NAME.files $REPO_NAME.files.tar.gz -t $DND
ls | grep -v $DND | xargs rm -rfv
mv $DND/* .
rmdir $DND
