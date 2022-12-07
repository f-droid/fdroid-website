#!/usr/bin/env python3
#

import json
import os
import re
from colorama import Fore, Style
from pathlib import Path


def recurse_add(keyset, data):
    for k, v in data.items():
        keyset.add(k)
        if isinstance(v, dict):
            for k1, v1 in v.items():
                keyset.add(k1)
                if isinstance(v1, dict):
                    keyset.update(v1.keys())


strings_pat = re.compile(r'{{ ((?:[^} ]*\.)?strings\.[^\[|}]+(?:\[[^\]]+\])?)}}')

project_dir = Path(__file__).resolve().parent.parent
os.chdir(project_dir)

with open('_data/strings.json') as fp:
    strings = json.load(fp)
with open('_data/tutorials.json') as fp:
    tutorials = json.load(fp)
strings_keys = {'data', 'site', 'strings'}  # preload with keys from Jekyll
recurse_add(strings_keys, strings)
tutorials_keys = strings_keys
recurse_add(tutorials_keys, tutorials)

errors = 0
for f in project_dir.rglob('*'):
    if not f.is_file():
        continue
    found_keys = set()
    try:
        with f.open() as fp:
            for m in strings_pat.findall(fp.read()):
                # print(f, m.strip())
                for k in m.strip().split('.'):
                    f_rel = str(f.relative_to(project_dir))
                    if f_rel.startswith('_tutorials/') and k not in tutorials_keys:
                        errors += 1
                        print(
                            (
                                Fore.RED
                                + 'ERROR: %s from %s not in _data/tutorials.json!'
                                + Style.RESET_ALL
                            )
                            % (m.strip(), f_rel)
                        )
                    elif k not in strings_keys:
                        errors += 1
                        print(
                            (
                                Fore.RED
                                + 'ERROR: %s from %s not in _data/strings.json!'
                                + Style.RESET_ALL
                            )
                            % (m.strip(), f_rel)
                        )
    except UnicodeDecodeError:
        pass  # ignoring binary file

exit(errors)
