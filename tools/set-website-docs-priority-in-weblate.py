#!/usr/bin/env python3
#
# The default priority in Weblate is 100.  This script downgrades the
# priority of less commonly used pages so that translators are
# presented with the most commonly used pages first.

import datetime
import os
import requests

from pathlib import Path

# these will not have their priority downgraded
ESSENTIAL = {
    '_docs/All_our_APIs.md',
    '_docs/Anti-Features.md',
    '_docs/Build_Metadata_Reference.md',
    '_docs/Code_of_Conduct.md',
    '_docs/FAQ_-_Client.md',
    '_docs/FAQ_-_General.md',
    '_docs/Get_F-Droid.md',
    '_docs/Inclusion_Policy.md',
    '_docs/Reproducible_Builds.md',
    '_docs/Security_Model.md',
}

# documentation of things where English is needed for the process anyway
ENGLISH = {
    '_docs/Deploying_the_Website.md',
    '_docs/Maintaining_the_Forum.md',
    '_docs/MIA_Process.md',
    '_docs/Take-Down_Requests.md',
}

projectdir = Path(__file__).parent.parent
os.chdir(projectdir)

priorities = dict()
by_date = dict()
now = datetime.datetime.now().timestamp()
time_max = 0
for f in projectdir.glob('_docs/*.md'):
    location = str(f.relative_to(projectdir))
    if location not in ESSENTIAL:
        stat = f.stat()
        by_date[location] = now - stat.st_mtime  # port to date of last git commit
        time_max = max(by_date[location], time_max)
        # the smallest file gets 40 priority points, the biggest gets 10
        priority = max(40 - int(stat.st_size / 400), 1)
        priorities[location] = priority

for location in ENGLISH:
    priorities[location] = 1

for location in list(priorities.keys()):
    priority = priorities[location]
    priorities[location] += int(50 * ((time_max - by_date[location]) / time_max))
    if priorities[location] > 90:
        del priorities[location]

print('Calculated priorities:')
for location, p in sorted(priorities.items(), key=lambda item: item[1], reverse=True):
    print(p, location, sep='\t')

print('Setting priorities in Weblate:')
WEBLATE_API_KEY = os.getenv('WEBLATE_API_KEY')
headers = {'User-Agent': 'F-Droid', 'Authorization': 'Token ' + WEBLATE_API_KEY}
url = 'https://hosted.weblate.org/api/translations/f-droid/website-docs/zh_Hans/units/?format=json'
while True:
    r = requests.get(url, headers=headers)
    r.raise_for_status()
    units = r.json()

    for unit in units['results']:
        locations = unit['location'].split(',')
        if len(locations) > 1:
            continue  # keep priority of strings used in multiple docs
        location = locations[0]
        priority = priorities.get(location, 100)
        if priority > 90:
            continue
        extra_flags = unit.get('extra_flags', '')
        if extra_flags:
            extra_flags += ','
        extra_flags += 'priority:%d' % priority
        d = {'id': unit['id'], 'extra_flags': extra_flags}
        print('/'.join(unit['location'].split('/')[1:]), priority, unit['web_url'])
        patch_url = unit['source_unit']
        p = requests.patch(patch_url, headers=headers, json=d)
        p.raise_for_status()

    url = units.get('next')
    if not url:
        break
