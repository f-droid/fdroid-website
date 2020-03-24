#!/usr/bin/env python3
#
# po4a currently only supports titles like this:
#
#  # First Level
#  ## Second Level
#  ### Third Level
#
# These kinds of headers are not supported:
#
#  First Level
#  ===========
#
#  Second Level
#  ------------

import glob
import os
import re

TITLE1_PAT = re.compile(r'\n([\w ]+\n)=+\n')
TITLE2_PAT = re.compile(r'\n([\w ]+\n)-+\n')

os.chdir(os.path.join(os.path.dirname(__file__), '..'))
for f in glob.glob('*/*.md') + glob.glob('*.md'):
    with open(f) as fp:
        contents = fp.read()
    new = TITLE1_PAT.sub(r'\n# \1', contents)
    new = TITLE2_PAT.sub(r'\n## \1', new)
    if new != contents:
        with open(f, 'w') as fp:
            fp.write(new)

