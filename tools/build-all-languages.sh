#!/bin/sh

set -e

git checkout master
git fetch https://hosted.weblate.org/git/f-droid/website
git reset --hard FETCH_HEAD

# 'en' needs to be manually included in the list since there isn't a
# translation file for it.
languages="en,"
for f in _data/[a-z][a-z]*/strings.json; do
    locale=`echo $f | sed 's,.*/\([a-z][a-z][a-zA-Z0-9_-]*\)/strings.json,\1,'`
    languages="$languages $locale,"
done

sed -i "s/^languages:.*/languages: [ $languages ]/" _config.yml
