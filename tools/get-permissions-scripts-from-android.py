#!/usr/bin/env python3

import glob
import json
import os
import sys
import re
from xml.etree import ElementTree

skipkeys = (
    'perm_costs_money',
    'permission_request_notification_title',
    'permission_request_notification_with_subtitle',
    'perms_description_app',
)

resdir = '/home/hans/code/android.googlesource.com/frameworks/base/core/res/res'

for d in sorted(glob.glob(os.path.join(resdir, 'values*'))):
    if os.path.basename(d) == 'values':
        locale = ''
    else:
        locale = d.split('/')[-1][7:].replace('-rCN', '_Hans').replace('-rTW', '_Hant').replace('-r', '_')
        if locale == 'iw':
            locale = 'he'
        elif locale == 'in':
            locale = 'id'
    jsonfile = os.path.join('/home/hans/code/fdroid/website/_data/', locale, 'strings.json')

    writechanges = False
    if not os.path.exists(jsonfile):
        continue
    with open(jsonfile) as fp:
        data = json.load(fp)

    str_path = os.path.join(d, 'strings.xml')
    if not os.path.exists(str_path):
        continue

    with open(str_path, encoding='utf-8') as fp:
        fulltext = fp.read()

    tree = ElementTree.parse(str_path)
    root = tree.getroot()

    for e in root.findall('.//string'):
        if e.text and e.attrib['name'].startswith('perm') and e.attrib['name'] not in skipkeys:
            writechanges = True
            if 'permissions' not in data:
                data['permissions'] = dict()
            text = re.sub('\s+', ' ', e.text.strip().strip('"').replace("\\'", "'"))
            data['permissions'][e.attrib['name']] = text

    if writechanges:
        with open(jsonfile, 'w') as fp:
            json.dump(data, fp, indent=4, sort_keys=True, ensure_ascii=False)
        with open(jsonfile, 'a') as fp:
            fp.write('\n')

