#!/usr/bin/python3
#
# cherry-pick complete translations from weblate

import git
import json
import os
import re
import requests
import yaml


LOCALE_REGEX = re.compile(
    r'(?:_data/|po/_(?:docs|pages|posts)\.)(.*)(?:/(?:strings|tutorials)\.json|\.po)'
)


def get_paths_tuple(locale):
    return (
        '_data/%s/strings.json' % locale,
        '_data/%s/tutorials.json' % locale,
        'po/_docs.%s.po' % locale,
        'po/_pages.%s.po' % locale,
        'po/_posts.%s.po' % locale,
    )


projectbasedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

repo = git.Repo(projectbasedir)
weblate = repo.remotes.weblate
weblate.fetch()
upstream = repo.remotes.upstream
upstream.fetch()

url = 'https://hosted.weblate.org/exports/stats/f-droid/website/?format=json'
r = requests.get(url)
r.raise_for_status()
strings = r.json()

url = 'https://hosted.weblate.org/exports/stats/f-droid/website-pages/?format=json'
r = requests.get(url)
r.raise_for_status()
pages = r.json()

with open(os.path.join(projectbasedir, '_config.yml')) as fp:
    site_languages = yaml.safe_load(fp)['languages']

strings_entries = dict()
pages_entries = dict()

merge_locales = []
for entry in strings:
    strings_entries[entry['code']] = entry
for entry in pages:
    pages_entries[entry['code']] = entry

for locale in site_languages:
    s = strings_entries.get(locale)
    p = pages_entries.get(locale)
    if (
        s is not None
        and s['translated_percent'] == 100
        and s['failing'] == 0
        and p is not None
        and p['translated_percent'] > 98
        and p['failing'] == 0
    ):
        merge_locales.append(locale)

if not merge_locales:
    exit()

if 'merge_weblate' in repo.heads:
    merge_weblate = repo.heads['merge_weblate']
    repo.create_tag(
        'previous_merge_weblate',
        ref=merge_weblate,
        message=('Automatically created by %s' % __file__),
    )
else:
    merge_weblate = repo.create_head('merge_weblate')
merge_weblate.set_commit(upstream.refs.master)
merge_weblate.checkout()

email_pattern = re.compile(r'by (.*?) <(.*)>$')

for commit in reversed(
    list(
        repo.iter_commits(str(weblate.refs.master) + '...' + str(upstream.refs.master))
    )
):
    pick = False
    for f in commit.stats.files.keys():
        if f == '_data/zh_Hans/strings.json':  # ignore edit war
            continue

        m = LOCALE_REGEX.match(f)
        if m and m.group(1) in merge_locales:
            pick = True
            break
    if pick:
        print('git cherry-pick', commit)
        repo.git.cherry_pick(str(commit))
        m = email_pattern.search(commit.summary)
        if m:
            email = m.group(1) + ' <' + m.group(2) + '>'
