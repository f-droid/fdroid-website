#!/usr/bin/env python3

import glob
import json
import os
import re
import sys


def make_flat_dict(d):
    flat_dict = dict()

    def find(sectionlist, d):
        for k, v in d.items():
            currentsection = sectionlist + [k]
            if isinstance(v, dict):
                find(currentsection, v)
            else:
                flat_dict['.'.join(currentsection)] = v
    find([], d)
    return(flat_dict)


basedir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
datadir = os.path.join(basedir, '_data')

formatpattern = re.compile(r'(\[[a-z][a-z0-9_]*\])([^(]|$)')
rubypattern = re.compile(r'(%(?:[a-zA-Z]|{[^}]+}))')
bracketspattern = re.compile(r'[\[\]][^(]')

with open(os.path.join(datadir, 'strings.json')) as fp:
    sourcestrings = make_flat_dict(json.load(fp))

formats = dict()
for k, v in sourcestrings.items():
    m = formatpattern.search(v)
    if m:
        formats[k] = m.group(1)
        print(k, '\tformat:', m.group(1))
    if k == 'news.date_format':
        # this is a special case
        continue
    for m in rubypattern.findall(v):
        formats[k] = m
        print(k, '\truby format:', m)

exitvalue = 0
for f in glob.glob(os.path.join(datadir, '*', 'strings.json')):
    #print(f)
    with open(f) as fp:
        targetstrings = make_flat_dict(json.load(fp))
    for k, v in targetstrings.items():
        if k in formats and formats[k] not in v:
            print(os.path.relpath(f) + ':\n\t', k, 'should have', formats[k] + ':\n\t', v)
            exitvalue += 1
        if not v:
            print(os.path.relpath(f) + ':\n\t', k, 'should not be blank')
            exitvalue += 1

sys.exit(exitvalue)
