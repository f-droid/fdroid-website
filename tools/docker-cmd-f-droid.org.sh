#!/bin/bash
#
# This script is the command provided to `docker run` to execute
# within a disposible container.  This runs the "f-droid.org" job in
# .gitlab-ci.yml to generate the whole site.  The generated files are
# deployed to https://f-droid.org by the script that calls this one.
#
# It will automatically delete changes in this local git repo that are
# not present in the git tag that is to be deployed.  It is meant to
# be automatically triggered whenever the new index.jar has been
# published on f-droid.org.
#
# This script assumes two things:
# 1. the deploy machine includes the public GPG keys for tag verification
# 2. the 'origin' remote is set to https://gitlab.com/fdroid/fdroid-website.git

set -e
set -x

test -n "$CI_PROJECT_DIR"
test -n "$CI_REPOSITORY_URL"

apt-get update
apt-get -qy install --no-install-recommends ca-certificates git gpg yq

# avoid git safe.directory errors, since this runs as root
git config --global --add safe.directory "$CI_PROJECT_DIR/.git"
git config --global --add safe.directory "$CI_REPOSITORY_URL/.git"

git remote update --prune
git fetch --tags

for tag in $(git tag --sort=-taggerdate); do
    if git tag -v "$tag"; then
        git clean -fdx
        git checkout -B master "$tag"
        echo "Set up $tag to deploy!"
        yq --raw-output '.["f-droid.org"]["script"][]' .gitlab-ci.yml | /bin/bash -e
        exit
    fi
done

echo 'ERROR: could not find any signed release tags!'
exit 1
