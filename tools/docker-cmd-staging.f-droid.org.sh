#!/bin/sh
#
# This script is the command provided to `docker run` to execute
# within a disposible container.  This runs the "f-droid.org" job in
# .gitlab-ci.yml to generate the whole site.  The generated files are
# then deployed to https://staging.f-droid.org by the script that
# calls this one.


set -e
set -x
apt-get update
apt-get -qy install --no-install-recommends ca-certificates git yq
git checkout master
# To temporarily use a different fork, comment out the two lines below
# and run `git remote set-url origin` in the git repo where this runs.
git fetch https://hosted.weblate.org/git/f-droid/website
git reset --hard FETCH_HEAD
set +x

minsize=`ls -l _data/strings.json | awk '{ print int($5 * 0.50) }'`

# 'en' needs to be manually included in the list since there isn't a
# translation file for it.
languages="en,"
for f in _data/[a-z][a-z]*/strings.json; do
    size=`ls -l $f | awk '{ print $5 }'`
    test $size -gt $minsize || continue
    locale=`echo $f | sed 's,.*/\([a-z][a-z][a-zA-Z0-9_-]*\)/strings.json,\1,'`
    if [ -e po/_pages.${locale}.po ]; then
        languages="$languages $locale,"
    fi
done

sed -i \
    -e "s/^languages:.*/languages: [ $languages ]/" \
    -e "s,^fdroid-repo:.*,fdroid-repo: https://f-droid.org/repo," \
    _config.yml

sed -i \
    -e "s,^\( *img-src .*\); \\\\,\1 https://ftp.fau.de; \\\\," \
    .htaccess

yq --raw-output '.["f-droid.org"]["script"][]' .gitlab-ci.yml | /bin/bash -e
