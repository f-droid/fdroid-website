#!/bin/sh -ex

last_tag=`git tag | grep -E '[2-9]\.[0-9]+' | sort -n | tail -1`
version=`python3 -c "l='$last_tag'.split('.');print('%s.%d' % (l[0], int(l[-1]) + 1))"`
git tag --sign $version --message "tagging release v$version" $1
