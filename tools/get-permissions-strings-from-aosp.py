#!/usr/bin/env python3

import base64
import glob
import json
import os
import sys
import re
import requests
from xml.etree import ElementTree

def get_clean_json_from_googlesource(url):
    """Work around a bug where the JSON file starts with: )]}'"""
    r = requests.get(url)
    return json.loads(r.text[r.text.index('{'):])

# these are not permissions, but have keys that match the pattern
skipkeys = (
    'perm_costs_money',
    'permission_request_notification_title',
    'permission_request_notification_with_subtitle',
    'permission_request_notification_for_app_with_subtitle',
    'perms_description_app',
)

# Our community has contributed a lot of translations and corrections.  Do
# not overwrite them unless the source string has changed.
#
# To derive this list, set it to a blank list, and run this script.
# Then look at the git diff for _data/strings.json to see which
# strings have changed source strings, e.g.:
# git diff _data/strings.json|grep '^+' | cut -d : -f 1
overwritekeys = (
    "permdesc_accessBackgroundLocation",
    "permdesc_backgroundCamera",
    "permdesc_bluetooth_advertise",
    "permdesc_bluetooth_connect",
    "permdesc_bluetooth_scan",
    "permdesc_camera",
    "permdesc_fullScreenIntent",
    "permdesc_highSamplingRateSensors",
    "permdesc_manageOngoingCalls",
    "permdesc_queryAllPackages",
    "permdesc_recordAudio",
    "permdesc_recordBackgroundAudio",
    "permdesc_uwb_ranging",
    "permgroupdesc_nearby_devices",
    "permgrouplab_nearby_devices",
    "permgrouplab_storage",
    "permlab_backgroundCamera",
    "permlab_bluetooth_advertise",
    "permlab_bluetooth_connect",
    "permlab_bluetooth_scan",
    "permlab_fullScreenIntent",
    "permlab_highSamplingRateSensors",
    "permlab_manageOngoingCalls",
    "permlab_queryAllPackages",
    "permlab_recordBackgroundAudio",
    "permlab_uwb_ranging"
)

# fetch most recent tag
refs_url = 'https://android.googlesource.com/platform/frameworks/base/+refs?format=JSON'
refs_json = get_clean_json_from_googlesource(refs_url)
tags_to_sort = set()
for ref in refs_json:
    m = re.match(r'refs/tags/android-[1-9][0-9]+\.[0-9]+\.[0-9]+_r[0-9]+', ref)
    if m:
        t = m.group()
        commit_id = refs_json[t]['value']
        l = t[18:].replace('_r', '.').split('.')
        l = tuple([int(n) for n in l] + [t])
        tags_to_sort.add(l)
tag = sorted(tags_to_sort)[-1][-1]
print('Fetching from', tag, commit_id)

res_url = 'https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-15.0.0_r36/core/res/res/?format=JSON'
res_json = get_clean_json_from_googlesource(res_url)
for entry in res_json['entries']:
    d = entry['name']
    if os.path.basename(d) == 'values':
        locale = ''
    elif d.startswith('values-'):
        locale = d.split('/')[-1][7:].replace('-rCN', '_Hans').replace('-rTW', '_Hant').replace('-r', '_')
        if locale == 'iw':
            locale = 'he'
        elif locale == 'in':
            locale = 'id'
    else:
        continue
    jsonfile = os.path.join('/home/hans/code/fdroid/website/_data/', locale, 'strings.json')

    writechanges = False
    if not os.path.exists(jsonfile):
        continue
    with open(jsonfile) as fp:
        data = json.load(fp)

    url = f'https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-15.0.0_r36/core/res/res/{d}/strings.xml?format=TEXT'
    r = requests.get(url)
    if r.status_code != 200:
        print(r.status_code, url)
        continue

    root = ElementTree.fromstring(base64.b64decode(r.text))

    for e in root.findall('.//string'):
        key = e.attrib['name']
        if (e.text and key.startswith('perm') and key not in skipkeys
            and ((not overwritekeys or key in overwritekeys)
                 or key not in data.get('permissions', []))):
            writechanges = True
            text = e.text.strip()
            if text.startswith('"') and text.endswith('"'):
                text = text[1:-1]
            text = re.sub('\s+', ' ', text.replace('\\"', '"').replace("\\'", "'"))
            if not text:
                continue
            if 'permissions' not in data:
                data['permissions'] = dict()
            data['permissions'][key] = text

    if writechanges:
        with open(jsonfile, 'w') as fp:
            json.dump(data, fp, indent=4, sort_keys=True, ensure_ascii=False)
        with open(jsonfile, 'a') as fp:
            fp.write('\n')

