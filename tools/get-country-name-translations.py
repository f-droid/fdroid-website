#!/usr/bin/env python3

import glob
import json
import os
import requests
import yaml

os.chdir(os.path.join(os.path.dirname(__file__), '..'))

baseurl = 'https://raw.githubusercontent.com/umpirsky/country-list/master/data'

with open('_data/rsync_mirrors.yaml') as fp:
    data = yaml.safe_load(fp)

s = set()
for i in data:
    s.update(i.keys())
codes = sorted(s)

for f in sorted(glob.glob('_data/*/strings.json')):
    target = os.path.basename(os.path.dirname(f))
    url = os.path.join(baseurl, target, 'country.json')
    r = requests.get(url)
    if r.status_code == 200:
        data = r.json()
        with open(f) as fp:
            strings = json.load(fp)
        for code in codes:
            translation = data.get(code.upper())
            if translation:
                print(url, code, translation)
                if 'mirrors' not in strings:
                    strings['mirrors'] = {}
                strings['mirrors'][code] = translation
                with open(f, 'w') as fp:
                    json.dump(strings, fp, ensure_ascii=False, indent=4, sort_keys=True)
                    fp.write('\n')  # Weblate seems to do this
