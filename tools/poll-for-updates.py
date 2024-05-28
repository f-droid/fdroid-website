#!/usr/bin/env python3
#
# * get the current index date and commit from the footer of any
#   HTMLpage, e.g.  (F-Droid 2018-09-28, fdroid-website 1.51)
#
# * run `git fetch` then check for new commits
#
# * use HTTP HEAD to get the Date of index-v1.jar, then compare that
#   to the last one used
#
# exit(1) means run the update, exit(0) means skip

import datetime
import email.utils
import os
import re
import requests
import socket
import subprocess
import sys

url = 'https://f-droid.org/repo/index-v1.jar'
headers = {'User-Agent': 'F-Droid'}

r = requests.head(url, headers=headers)
r.raise_for_status()
date = '{:04g}-{:02g}-{:02g}'.format(*email.utils.parsedate(r.headers['Date'])).encode()

data = None
r = requests.get('https://staging.f-droid.org/en/about/index.html', headers=headers)
r.raise_for_status()
for chunk in r.iter_content(chunk_size=1024):
    if chunk:  # filter out keep-alive new chunks
        if data is None:
            data = bytes()
        data += chunk
if data is None:
    print('no data from current deploy')
    sys.exit(1)

last_date = None
m = re.search(b'''\(F-Droid (20[0-9][0-9]-[0-9][0-9]-[0-9][0-9])''', data)
if m:
    last_date = m.group(1)

last_git_describe = None
m = re.search(b'''[0-9]\.[0-9]+-[0-9]+-g[0-9a-f]+''', data)
if m:
    last_git_describe = m.group()

# production needs to check the canonical git repo, while other
# instances should check weblate, e.g. so staging.f-droid.org will
# update when new translations appear.
if 'deployserver' in socket.gethostname():
    git_remote_url = 'https://gitlab.com/fdroid/fdroid-website.git'
else:
    git_remote_url = 'https://hosted.weblate.org/git/f-droid/website'

subprocess.check_call(['git', 'fetch', '--quiet', git_remote_url])
git_describe = subprocess.check_output(['git', 'describe', '--always', 'FETCH_HEAD']).strip()

if last_date == date and last_git_describe == git_describe:
    print('current, skip update:',
          last_date.decode(), '==', date.decode(), 'and',
          last_git_describe.decode(), '==', git_describe.decode())
    sys.exit(0)
else:
    print('update required:',
          last_date.decode(), '!=', date.decode(), 'or',
          last_git_describe.decode(), '!=', git_describe.decode())
    sys.exit(1)  # error means run the job
