#!/usr/bin/env python3

import os
import re
import requests
import yaml


os.chdir(os.path.join(os.path.dirname(__file__), '..'))

url = 'https://raw.githubusercontent.com/opencollective/opencollective-frontend/main/components/contribution-flow/constants.js'
print('Loading', url)
r = requests.get(url)
r.raise_for_status()

labels = []
for e in re.findall(
    r"""labelWithoutImage: ["']?([^"']+)["']?,\n\s*value: ["']?([^"']+)""", r.text
):
    labels.append({e[1]: e[0]})
with open('_data/crypto_currencies.yaml', 'w') as fp:
    yaml.dump(labels, fp, default_flow_style=False)

for d in labels:
    k = list(d.keys())[0]
    r = requests.get(
        'https://raw.githubusercontent.com/opencollective/opencollective-frontend/main/public/static/images/crypto-logos/%s.svg'
        % k
    )
    r.raise_for_status()
    with open('assets/crypto-logos/%s.svg' % k, 'w') as fp:
        fp.write(r.text)
    
    #print('![%s]({%% asset crypto-logos/%s.svg %%})]' % (d[k], k))
    print('<img class="crypto-logos" src="{%% asset crypto-logos/%s.svg %%}" alt="%s" />' % (k, d[k]))
    #img[alt=drawing] { width: 200px; }