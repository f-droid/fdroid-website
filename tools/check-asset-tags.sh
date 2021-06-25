#!/bin/bash
set -e
grep -ER --exclude-dir=.git --exclude='*~' --exclude='*.swp' \
  --exclude-dir=tools --exclude-dir=_plugins \
  --color=auto '\{%\s*assets' . || true
grep -ER --exclude-dir=.git --exclude='*~' --exclude='*.swp' \
  --exclude-dir=tools --exclude-dir=_plugins \
  --exclude='*.webmanifest' --exclude='*.xml' --exclude='*.scss' \
  --exclude=Second_Audit_Report.html \
  --color=auto '[^a-z]/assets/' . || true
