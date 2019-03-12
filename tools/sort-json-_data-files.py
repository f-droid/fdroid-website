#!/usr/bin/env python3
#
# Having strictly standardized file formats makes it much less likely for
# merge/rebase conflicts to arise between Weblate and this repo.

import glob
import json
import os

basedir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
os.chdir(basedir)

for f in glob.glob('_data/*.json') + glob.glob('_data/*/*.json'):
    print(f)
    with open(f) as fp:
        data = json.load(fp)
    with open(f, 'w') as fp:
        json.dump(data, fp, sort_keys=True, indent=4, ensure_ascii=False)
    with open(f, 'a') as fp:
        fp.write('\n')
