#!/bin/bash
#
# This script sets up this git repo for the final deploy process to
# https://f-droid.org.  It will automatically delete changes in this
# local git repo that are not present in the git tag that is to be
# deployed.  It is meant to be automatically triggered whenever the
# new index.jar has been published on f-droid.org.
#
# This script assumes two things:
# 1. the deploy machine includes the public GPG keys for tag verification
# 2. the 'origin' remote is set to https://gitlab.com/fdroid/fdroid-website.git
#
# This script is run as a "pre_build_script", which is "executed on
# the runner before executing the job."  That means this script is run
# as root in the current configuration at the time of this writing.
# https://docs.gitlab.com/runner/configuration/advanced-configuration.html#the-runners-section


set -e
set -x

apt-get update
apt-get -qy install --no-install-recommends ca-certificates git gpg

git="sudo -u fdroid git"
$git remote update --prune
$git fetch --tags

for tag in $($git tag --sort=-taggerdate); do
    if $git tag -v "$tag"; then
        $git clean -fdx
        $git checkout -B master "$tag"
        echo "Set up $tag to deploy!"
        exit
    fi
done

echo 'ERROR: could not find any signed release tags!'
exit 1
