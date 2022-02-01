#!/usr/bin/env python3

import datetime
import email.utils
import json
import os
import re
import requests
import subprocess
import sys

DATE_PATTERN = re.compile(r'_posts/([0-9]{4})-([0-9]{2})-([0-9]{2})-.*')
WEBLATE_API_KEY = os.getenv('WEBLATE_API_KEY')
headers = {'User-Agent': 'F-Droid', 'Authorization': 'Token ' + WEBLATE_API_KEY}
url = 'https://hosted.weblate.org/api/translations/f-droid/website-posts/zh_Hans/units/?format=json'
while True:
    r = requests.get(url, headers=headers)
    r.raise_for_status()
    units = r.json()

    for unit in units['results']:
        location = unit['location'].split(',')[0]
        priority = 100
        start = 20100101
        today = int(datetime.datetime.now().strftime('%Y%m%d'))
        m = DATE_PATTERN.match(location)
        if m:
            date = int('%s%s%s' % (m.group(1), m.group(2), m.group(3)))
            priority = int((date - start) / (today - start) * 100)
        if len(unit['location'].split(',')) > 1:
            priority = 90  # prioritize strings shared across many posts
        if priority > 90:
            continue
        if '-twif-' in location:
            priority = 1  # old TWIFs are a lot of work to translate
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
