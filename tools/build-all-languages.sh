#!/bin/sh
#
# This is used to build https://staging.f-droid.org.

set -e
set -x
apt-get update
apt-get -qy install --no-install-recommends ca-certificates git
git checkout master
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
