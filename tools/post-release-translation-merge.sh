#!/bin/sh -ex
#
# This is for after running tools/pick-complete-translations.py and
# all the checks, and having pushed the results to the upstream repo
# https://gitlab.com/fdroid/fdroid-website.  Then run this to sync the
# Markdown docs with the translation process.

basedir=$(cd $(dirname $0)/..; pwd)
cd $basedir

./tools/i18n.sh --all

wlc commit
git remote update -p weblate upstream
git -C "$basedir" checkout -- `git diff upstream/master weblate/master --name-only --diff-filter=M`

# delete files not already in git
rm -f `git status --porcelain | sed -En 's,^\?\? po/_(docs|pages|posts)(\.[a-z][a-z][a-zA-Z_]*\.po)$,po/_\1\2,p'`

git commit --all -m "run $0"

# delete files that conflict with what is in the weblate git remote
set +x
branch=$(basename $0)-$(date +%s)
git -C "$basedir" checkout -B $branch master
failed=""
for c in $(git log --pretty=%H --reverse master..weblate/master -- po/ _data/); do
    if git cherry-pick $c > /dev/null 2>&1; then
	printf ''
    else
	failed="$failed $(git status --porcelain | sed -En 's,^UU ((:?po|_data)/.*),\1,p')"
	echo failed $failed
	git cherry-pick --abort
    fi
done
set -x
git -C "$basedir" checkout master
git branch --delete --force $branch
git reset --soft master^
for f in $(echo $failed | sed 's,\s,\n,g' | sort -u ); do
    echo $f
    git reset -- $f
    git checkout -- $f
done
git commit --all -m "run $0"
