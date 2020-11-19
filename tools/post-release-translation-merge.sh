#!/bin/sh -ex
#
# This is for after running tools/pick-complete-translations.py and
# all the checks, and having pushed the results to the upstream repo
# https://gitlab.com/fdroid/fdroid-website.  Then run this to sync the
# Markdown docs with the translation process.

basedir=$(cd $(dirname $0)/..; pwd)
cd $basedir

./tools/i18n.sh md2po

wlc commit
git remote update -p weblate upstream
git -C "$basedir" checkout -- `git diff upstream/master weblate/master --name-only --diff-filter=M`
rm -f `git status --porcelain | sed -En 's,^\?\? po/_(docs|pages|posts)(\.[a-z][a-z][a-zA-Z_]*\.po)$,po/_\1\2,p'`
