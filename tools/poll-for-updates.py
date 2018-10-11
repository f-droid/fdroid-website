#!/usr/bin/env python3
#
# * get the current index date and commit from the footer of any
#   HTMLpage, e.g.  (F-Droid 2018-09-28, fdroid-website 1.51)
#
# * run `git fetch` then check for new commits
#
# * use HTTP HEAD to get the Date of index-v1.jar, then compare that
#   to the last one used

import datetime
import email.utils
import re
import requests
import subprocess
import sys

url = 'https://f-droid.org/repo/index-v1.jar'
headers = {'User-Agent': 'F-Droid'}

r = requests.head(url, headers=headers)
if r.status_code == 200:
    date = '{0}-{1}-{2}'.format(*email.utils.parsedate(r.headers['Date']))
else:
    print('ERROR: Failed to fetch', url)
    sys.exit(1)

last_date = None
with open('_site/build/index.html') as fp:
    m = re.search('\(F-Droid (20[0-9][0-9]-[0-9][0-9]-[0-9][0-9])', fp.read())
    if m:
        last_date = m.group(1)
if last_date != date:
    print('run!', last_date, date)
    sys.exit(0)

last_git_describe = None
with open('_site/build/index.html') as fp:
    m = re.search('[0-9]\.[0-9]+-[0-9]+-g[0-9a-f]+', fp.read())
    if m:
        last_git_describe = m.group()

subprocess.check_call(['git', 'fetch', '--quiet',
                       'https://hosted.weblate.org/git/f-droid/website'])
git_describe = subprocess.check_output(['git', 'describe', '--always', 'FETCH_HEAD']).decode().strip()

if last_git_describe != git_describe:
    print('run!', last_git_describe, git_describe)
    sys.exit(0)

sys.exit(1)  # error means run the job
