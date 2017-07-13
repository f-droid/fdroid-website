#!/usr/bin/env bash

# Fail on errors.
set -eu -o pipefail

DIR_TOOLS=`dirname $0`
DIR_WEB=${DIR_TOOLS}/..

echo "Ensuring the /badge/ directory is present in the website source."
wget https://gitlab.com/fdroid/artwork/repository/archive.zip?ref=master -O ${DIR_WEB}/artwork.zip
unzip ${DIR_WEB}/artwork.zip -d ${DIR_WEB}
mv ${DIR_WEB}/artwork-master-*/badge ${DIR_WEB}/badge
rm -r ${DIR_WEB}/artwork.zip ${DIR_WEB}/artwork-master-*
