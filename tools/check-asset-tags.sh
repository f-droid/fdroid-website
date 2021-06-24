#!/bin/bash
set -e
ack --ignore-dir tools --ignore-dir _plugins \
  '\{%\s*assets' || true
ack --ignore-dir tools --ignore-dir _plugins \
  --ignore-file=ext:webmanifest,xml,scss \
  --ignore-file=is:Second_Audit_Report.html \
  '[^a-z]/assets/' || true
