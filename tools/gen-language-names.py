#!/usr/bin/env python3
#
# parsed from https://github.com/umpirsky/language-list.git

import glob
import os
import json

new = dict()
for f in sorted(glob.glob('/home/hans/code/umpirsky/language-list/data/[a-z]*')):
    language_file = os.path.join(f, 'language.json')
    if not os.path.exists(language_file):
        continue
    with open(language_file) as fp:
        data = json.load(fp)
    locale = os.path.basename(f)
    if locale in data:
        new[locale] =  data[locale]

with open('_data/languagenames.json', 'w') as fp:
    json.dump(new, fp, indent=2, ensure_ascii=False, sort_keys=True)
