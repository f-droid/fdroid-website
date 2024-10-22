#!/usr/bin/env python3

import json
import os
import requests

os.chdir(os.path.join(os.path.dirname(__file__), '..'))

r = requests.get('https://spdx.org/licenses/licenses.json')
r.raise_for_status()
data = r.json()
out = {
    'licenseListVersion': data['licenseListVersion'],
    'licenses': dict(),
    'releaseDate': data['releaseDate'],
}
for license in data['licenses']:
    if (license.get('isOsiApproved') or license.get('isFsfLibre')) and not license.get('isDeprecatedLicenseId'):
        out['licenses'][license['licenseId']] = {
            'name': license['name'],
        }
with open('_data/licenses.json', 'w') as fp:
    json.dump(out, fp, indent=2, sort_keys=True)
