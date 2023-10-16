#!/usr/bin/env python3

import glob
import json
import os
import sys
import re
from xml.etree import ElementTree

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

