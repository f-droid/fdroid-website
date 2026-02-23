#!/usr/bin/env python3
#
# parsed from https://github.com/unicode-org/cldr-json

import glob
import os
import json
import pathlib

####################
# CHANGE THIS PATH #
####################
BASE_PATH = pathlib.Path('../../unicode-org/cldr-json/cldr-json')
CLDR_LOCALENAMES_PATH= BASE_PATH / 'cldr-localenames-full/main'
CLDR_MISC_PATH= BASE_PATH / 'cldr-misc-full/main'
OUTPUT_FILE = pathlib.Path('_data/languagenames.json')

def get_capitalize_rule(locale):
    ct_path = CLDR_MISC_PATH / locale / "contextTransforms.json"
    if not ct_path.exists():
        return False

    try:
        with open(ct_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            transform = data.get("main", {}).get(locale, {}).get("contextTransforms", {})
            rule = transform.get("languages", {}).get("uiListOrMenu")
            return rule == "titlecase-firstword"
    except (json.JSONDecodeError, KeyError):
        return False

out_dict = dict()
for folder in sorted(CLDR_LOCALENAMES_PATH.glob("[a-z]*")):
    language_file = folder / 'languages.json'

    if not language_file.exists():
        continue

    locale = folder.name
    try:
        with open(language_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
       
        lang_data = data.get("main", {}).get(locale, {}).get("localeDisplayNames", {}).get("languages", {})

        if locale in lang_data:
            lang_name = lang_data[locale]
            if get_capitalize_rule(locale) == True:
                lang_name = lang_name.capitalize()

            out_dict[locale.replace("-", "_")] = lang_name
    except Exception as e:
        print(f"ERROR: {e}")

# TEMPORARY FIX
# https://gitlab.com/fdroid/fdroid-website/-/merge_requests/1451#note_3029494287
if "pt_BR" not in out_dict:
    out_dict["pt_BR"] = "Português do Brasil"

with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
    json.dump(out_dict, f, indent=2, ensure_ascii=False, sort_keys=True)

print(f"Success: {len(out_dict)} languages names have been generated in {OUTPUT_FILE}")
