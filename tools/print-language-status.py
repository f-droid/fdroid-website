#!/usr/bin/env python3

import os
import requests
import yaml

os.chdir(os.path.join(os.path.dirname(__file__), '..'))

output = dict()
for slug in ('f-droid', 'fdroiddata', 'repomaker', 'repomaker-javascript',
             'website', 'website-pages', 'website-docs', 'website-posts',
             'website-tutorials'):
    r = requests.get('https://hosted.weblate.org/exports/stats/f-droid/%s/?format=json' % slug)
    data = r.json()
    output[slug] = []
    for item in data:
        if item.get('translated_percent', 0) > 99.0:
            output[slug].append(item['code'])

with open('_config.yml') as fp:
    config = yaml.safe_load(fp)

print('Launch on f-droid.org:',
      sorted((set(output['f-droid']) & set(output['website']) & set(output['website-pages']))
             - set(config['languages'])))
