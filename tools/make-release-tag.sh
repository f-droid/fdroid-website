#!/bin/sh -ex

NEXT_TAG=$(git tag | grep -E '^[0-9]\.[0-9]+$' | python3 -c '\
import sys; \
from packaging import version; \
\
l=sorted([version.parse(x) for x in sys.stdin.readlines()])[-1]; \
print("{}.{}".format(l.major, l.minor+1)) \
')

git tag --sign $NEXT_TAG --message "tagging release v$NEXT_TAG" $1
