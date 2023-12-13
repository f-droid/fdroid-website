#!/bin/bash
#
# The old method of linking assets should not be present.

EXITVALUE=0

grep -ER \
  --exclude-dir=.git \
  --exclude-dir=.jekyll-cache \
  --exclude-dir=.sass-cache \
  --exclude='*~' \
  --exclude='*.swp' \
  --exclude-dir=tools \
  --exclude-dir=_plugins \
  --exclude-dir=_site \
  --color=auto '\{%\s*assets' . \
    && EXITVALUE=1

grep -ER \
  --exclude-dir=.git \
  --exclude-dir=.jekyll-cache \
  --exclude-dir=.sass-cache \
  --exclude='*~' \
  --exclude='*.swp' \
  --exclude-dir=tools \
  --exclude-dir=_plugins \
  --exclude-dir=_site \
  --exclude='*.webmanifest' \
  --exclude='*.xml' \
  --exclude='*.scss' \
  --exclude=Second_Audit_Report.html \
  --color=auto '[^a-z]/assets/' . \
    && EXITVALUE=1

exit $EXITVALUE
