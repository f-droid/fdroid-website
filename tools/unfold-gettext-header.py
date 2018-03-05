#!/usr/bin/env python3

import re
import sys

BAD_HEADER_RE = re.compile('msgstr "Project-Id-Version.*\\\\n"')

if len(sys.argv) <= 1:
    print('Usage:', sys.argv[0])
for f in sys.argv[1:]:
    print(f)
    with open(f) as fp:
        data = fp.read()
    m = BAD_HEADER_RE.search(data)
    if m:
        header = re.sub(r'\\n([^"])', r'\\n"\n"\1', m.group().replace('msgstr "Project', 'msgstr ""\n"Project'))
        out = re.sub(r'(<<<<<<<|>>>>>>>).*\n', '', data.replace(m.group(), header))
        out = re.sub(r'("POT-Creation-Date: 20.*\\n"\n"PO-).+"PO-', r'\1', out, flags=re.DOTALL)
        with open(f, 'w') as fp:
            fp.write(out)
