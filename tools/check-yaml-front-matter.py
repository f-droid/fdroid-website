#!/usr/bin/env python3

import glob
import re
import sys
import yaml

leading_pat = re.compile(r'^\s*---\n')
yaml_pat = re.compile(r'^\s*---\n(.+?)\n---\n', re.DOTALL)

exitvalue = 0
for f in glob.glob('_docs/*.md') + glob.glob('_pages/*.md') + glob.glob('_posts/*.md'):
    with open(f) as fp:
        contents = fp.read()
    m = leading_pat.match(contents)
    if not m:
        print('ERROR:', f, 'is missing --- at the start of the file!')
        exitvalue += 1
        continue
    m = yaml_pat.match(contents)
    if not m:
        print('ERROR:', f, 'is missing YAML Front Matter at the start of the file!'
              + '\n\tsee: https://jekyllrb.com/docs/front-matter/')
        exitvalue += 1
        continue
    try:
        data = yaml.load(m.group(1))
    except yaml.scanner.ScannerError as e:
        print('ERROR:', f, '\n', e)
        exitvalue += 1

sys.exit(exitvalue)
