#!/usr/bin/env python3

import os
import requests
import base64
from lxml import etree
import json

# get the file from android repo via http. (using GIT would be overkill?)
r = requests.get('https://android.googlesource.com/platform/frameworks/base/+/refs/heads/master/core/res/AndroidManifest.xml?format=TEXT')
# http request with '?format=TEXT' returns base64 encoded XML
xml = base64.b64decode(r.text)


# This will be our permissions json object
os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
with open('_data/android_permissions.json') as fp:
    permissions = json.load(fp)

# collect data form XML
tree = etree.fromstring(xml)
perms = tree.xpath('permission')

ns = {'android': 'http://schemas.android.com/apk/res/android'}
for perm in perms:
    try:
        name = perm.xpath('.//@android:name', namespaces=ns)[0]
        permissions[name] = {}
    except:
        print(name, "has no name")

    try:
        description = perm.xpath('.//@android:description', namespaces=ns)[0]
        permissions[name]['description'] = description.replace('@string/','')
    except:
        print(name, "has no description")

    try:
        icon = perm.xpath('.//@android:icon', namespaces=ns)[0]
        permissions[name]['icon'] = icon.replace('@string/','')
    except:
        print(name, "has no icon")

    try:
        label = perm.xpath('.//@android:label', namespaces=ns)[0]
        permissions[name]['label'] = label.replace('@string/','')
    except:
        print(name, "has no label")

    try:
        priority = perm.xpath('.//@android:priority', namespaces=ns)[0]
        permissions[name]['priority'] = priority.replace('@string/','')
    except:
        print(name, "has no priority")

    try:
        protectionLevel = perm.xpath('.//@android:protectionLevel', namespaces=ns)[0]
        permissions[name]['protectionLevel'] = protectionLevel.replace('@string/','')
    except:
        print(name, "has no protectionLevel")

        
# Write JSON to file
with open('_data/android_permissions.json', 'w') as outfile:  
    json.dump(permissions, outfile, indent=4, sort_keys=True, ensure_ascii=False)

