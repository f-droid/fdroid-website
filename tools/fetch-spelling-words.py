#!/usr/bin/env python3

import io
import json
import requests
import zipfile

url = 'https://f-droid.org/repo/index-v1.jar'

fields = set()

r = requests.get(url)
r.raise_for_status()
with zipfile.ZipFile(io.BytesIO(r.content)) as thezip:
    with thezip.open('index-v1.json') as fp:
        data = json.loads(fp.read().decode())
        for app in data['apps']:
            fields.update(app.keys())
            print(app['name'])
        for packageName, packages in data['packages'].items():
            for package in packages:
                fields.update(package.keys())
for field in fields:
    print(field)
