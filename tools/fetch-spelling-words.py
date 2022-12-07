#!/usr/bin/env python3

import io
import json
import re
import requests
import zipfile

url = 'https://f-droid.org/repo/index-v1.jar'

fields = set()
remove_punc_pat = re.compile(r'[():,&"\[\]]')

with open('_data/contributors.yaml') as fp:
    for line in fp:
        if ':' in line:
            fields.update(line.split(':')[1].split(' '))

r = requests.get(url)
r.raise_for_status()
with zipfile.ZipFile(io.BytesIO(r.content)) as thezip:
    with thezip.open('index-v1.json') as fp:
        data = json.loads(fp.read().decode())
        for app in data['apps']:
            fields.update(app.keys())
            name = app.get('name')
            if name:
                n = remove_punc_pat.sub(r'', name.replace(' - ', ''))
                for i in n.split(' '):
                    fields.add(i)
        for packageName, packages in data['packages'].items():
            for package in packages:
                fields.update(package.keys())
for field in sorted(fields):
    print(field)
