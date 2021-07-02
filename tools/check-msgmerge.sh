#!/bin/sh -x

cd $(dirname $0)/..

files=''
for section in _docs _pages _posts; do
    for f in po/$section.*.po; do
	msgmerge $f /home/hans/code/fdroid/website/po/$section.pot > /dev/null || files="$files $f"
    done
done

echo $files
[ -z "$files" ] || exit 1
