#!/usr/bin/env python3

import os
import requests
import yaml

os.chdir(os.path.join(os.path.dirname(__file__), '..'))

output = dict()
for slug in ('f-droid', 'fdroiddata', 'repomaker', 'repomaker-javascript',
             'website', 'website-pages', 'website-docs', 'website-posts',
             'website-tutorials'):
    r = requests.get('https://hosted.weblate.org/api/components/f-droid/%s/statistics/?format=json' % slug)
    data = r.json()
    output[slug] = []
    for item in data['results']:
        if item.get('translated_percent', 0) > 99.0:
            output[slug].append(item['code'])

r = requests.get('https://gitlab.com/fdroid/fdroid-website/-/raw/master/_config.yml')
r.raise_for_status()
config = yaml.safe_load(r.text)

print('Launch on f-droid.org:',
      sorted((set(output['f-droid']) & set(output['website']) & set(output['website-pages']))
             - set(config['languages'])))
