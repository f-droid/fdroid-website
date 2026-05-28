#!/usr/bin/python3
#
# cherry-pick complete translations from weblate

import git
import json
import os
import re
import requests
import yaml


COMPONENTS = {
    "website": "_data/%s/strings.json",
    "website-tutorials": "_data/%s/tutorials.json",
    "website-docs": "po/_docs.%s.po",
    "website-pages": "po/_pages.%s.po",
    "website-posts": "po/_posts.%s.po",
}


def get_path(component, locale):
    return COMPONENTS[component] % locale


projectbasedir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

repo = git.Repo(projectbasedir)
weblate = repo.remotes.weblate
weblate.fetch()
upstream = repo.remotes.upstream
upstream.fetch()

with open(os.path.join(projectbasedir, "_config.yml")) as fp:
    site_languages = yaml.safe_load(fp)["languages"]

merge_paths = []
for component in COMPONENTS:
    url = f"https://hosted.weblate.org/api/components/f-droid/{component}/statistics/?format=json"
    r = requests.get(url)
    r.raise_for_status()
    for entry in r.json()["results"]:
        locale = entry["code"]
        if locale not in site_languages:
            continue
        # require 100% translated, otherwise there are too many merge
        # conflicts, like when the translator is still working, and the
        # translation bot runs and makes a merge request using an almost
        # complete translation.
        if entry["translated_percent"] > 100 and entry["failing"] == 0:
            merge_paths.append(get_path(component, locale))
            print(
                component,
                locale,
                entry["translated_percent"],
                entry["failing"],
                sep="\t",
            )

if not merge_paths:
    exit(True)

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

no_commits_picked = True
for commit in reversed(
    list(
        repo.iter_commits(str(weblate.refs.master) + '...' + str(upstream.refs.master))
    )
):
    pick = False
    for f in commit.stats.files.keys():
        if f in merge_paths:
            pick = True
            break
    if pick:
        no_commits_picked = False
        print('git cherry-pick', commit, f)
        repo.git.cherry_pick(str(commit))
        m = email_pattern.search(commit.summary)
        if m:
            email = m.group(1) + ' <' + m.group(2) + '>'

exit(no_commits_picked)
