#!/usr/bin/env python

# This script sets up this git repo for the final deploy process to
# https://f-droid.org.  It will automatically delete changes in this
# local git repo that are not present in the git tag that is to be
# deployed.  It is meant to be automatically triggered whenever the
# new index.jar has been published on f-droid.org.
#
# This script assumes two things:
# 1. the deploy machine includes the public GPG keys for tag verification
# 2. the 'origin' remote is set to https://gitlab.com/fdroid/fdroid-website.git

import os
import subprocess
import sys

remote_url = 'https://gitlab.com/fdroid/fdroid-website.git'

try:
    import git
    repo = git.Repo('.')
    remote = None
    for r in repo.remotes:
        if r.url.startswith(remote_url):
            remote = r.name
    if not remote:
        print('ERROR: git remote for ' + remote_url + ' is not setup!')
        sys.exit(1)

    subprocess.check_call(['git', 'remote', 'update', remote, '--prune'])
    subprocess.check_call(['git', 'fetch', remote, '--tags'])
except ImportError:
    subprocess.check_call(['git', 'remote', 'update', '--prune'])
    subprocess.check_call(['git', 'fetch', '--tags'])

FNULL = open(os.devnull, 'w')

tags = subprocess.check_output(['git', 'tag'])
current_date = 0
current_tag = None
for tag in tags.split('\n'):
    if not tag:
        continue
    result = subprocess.call(['git', 'tag', '-v', tag], stdout=FNULL, stderr=FNULL)
    if result != 0:
        continue
    try:
        date = int(subprocess.check_output(['git', 'log', '--format=format:%at', '-1', tag]))
        if date > current_date:
            current_date = date
            current_tag = tag
    except ValueError:
        continue

if current_tag:
    subprocess.call(['git', 'tag', '-v', current_tag])  # call again just to get output
    subprocess.check_call(['git', 'clean', '-fdx'])
    subprocess.check_call(['git', 'reset', '--hard', current_tag])
    print('Set up ' + current_tag + ' to deploy!')
else:
    print('ERROR: could not find any signed release tags!')
    sys.exit(1)
