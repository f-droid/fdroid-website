#!/bin/bash

# Fail on errors.
set -eux -o pipefail

if [[ $# -ne 1 || ! -d $1 ]]; then
    echo "Usage: deploy-external-assets.sh SITE_DIR"
    exit 1
fi

OUTPUT_DIR=$1

dir=badge
echo "Deploying the /$dir/ directory..."
rm -rf ${OUTPUT_DIR}/$dir
project=artwork
branch=master
curl https://gitlab.com/fdroid/$project/-/archive/$branch/$project-$branch.tar.gz \
          | tar -xz --directory=${OUTPUT_DIR} --strip-components=1 $project-$branch/$dir/

dir=forums
echo "Deploying the /$dir/ directory..."
rm -rf ${OUTPUT_DIR}/$dir
project=fdroid-website-legacy-forum
branch=master
curl https://gitlab.com/fdroid/$project/-/archive/$branch/$project-$branch.tar.gz \
    | tar -xz --directory=${OUTPUT_DIR} --strip-components=1 $project-$branch/$dir/
