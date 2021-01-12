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

# To derive this list, set it to a blank list, and run this script.
# Then look at the git diff for _data/strings.json to see which
# strings have changed source strings, e.g.:
# git diff _data/strings.json|grep '^+' | cut -d : -f 1
overwritekeys = (
    "permdesc_accessCoarseLocation",
    "permdesc_accessFineLocation",
    "permdesc_bindCellBroadcastService",
    "permdesc_cameraOpenCloseListener",
    "permdesc_exemptFromAudioRecordRestrictions",
    "permdesc_preferredPaymentInfo",
    "permdesc_readContacts",
    "permdesc_systemCamera",
    "permdesc_useFaceAuthentication",
    "permdesc_vibrator_state",
    "permdesc_writeContacts",
    "permgroupdesc_activityRecognition",
    "permlab_accessBackgroundLocation",
    "permlab_accessCoarseLocation",
    "permlab_bindCellBroadcastService",
    "permlab_cameraOpenCloseListener",
    "permlab_exemptFromAudioRecordRestrictions",
    "permlab_manageFace",
    "permlab_preferredPaymentInfo",
    "permlab_systemCamera",
    "permlab_useFaceAuthentication",
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
            if 'permissions' not in data:
                data['permissions'] = dict()
            text = re.sub('\s+', ' ', e.text.strip().strip('"').replace("\\'", "'"))
            data['permissions'][key] = text

    if writechanges:
        with open(jsonfile, 'w') as fp:
            json.dump(data, fp, indent=4, sort_keys=True, ensure_ascii=False)
        with open(jsonfile, 'a') as fp:
            fp.write('\n')

