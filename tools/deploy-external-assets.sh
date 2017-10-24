#!/usr/bin/env bash

# Fail on errors.
set -eux -o pipefail

if [[ $# -ne 1 || ! -d $1 ]]; then
    echo "Usage: deploy-external-assets.sh SITE_DIR"
    exit 1
fi

OUTPUT_DIR=$1

echo "Deploying the /badge/ directory..."
curl https://gitlab.com/fdroid/artwork/repository/archive.tar.gz?ref=master \
    | gunzip -c \
    | tar --wildcards -xf - 'artwork-master*/badge'
rm -rf ${OUTPUT_DIR}/badge
mv artwork-master-*/badge ${OUTPUT_DIR}/
rm -r artwork-master-*

echo "Deploying the /forums/ directory..."
curl https://gitlab.com/fdroid/fdroid-website-legacy-forum/repository/archive.tar.gz?ref=master \
    | gunzip -c \
    | tar --wildcards -xf - 'fdroid-website-legacy-forum-master*/forums'
rm -rf ${OUTPUT_DIR}/forums
mv fdroid-website-legacy-forum-master-*/forums ${OUTPUT_DIR}/
rm -r fdroid-website-legacy-forum-master*

echo "Deploying download button symlinks..."
rm -f ${OUTPUT_DIR}/FDroid.apk* ${OUTPUT_DIR}/F-Droid.apk*
ln -s repo/org.fdroid.fdroid_1000011.apk ${OUTPUT_DIR}/FDroid.apk
ln -s repo/org.fdroid.fdroid_1000011.apk ${OUTPUT_DIR}/F-Droid.apk
ln -s repo/org.fdroid.fdroid_1000011.apk.asc ${OUTPUT_DIR}/F-Droid.apk.asc
ln -s repo/org.fdroid.fdroid_1000011.apk.asc ${OUTPUT_DIR}/FDroid.apk.asc
