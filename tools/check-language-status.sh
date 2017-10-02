#!/bin/sh

# The CSV from Weblate contains the following header row:
# name,code,total,translated,translated_percent,total_words,translated_words,failing,failing_percent,fuzzy,fuzzy_percent,url_translate,url,last_change,last_author
# where the columns of interest are $5 (translated_percent) and $2 (code).

for f in f-droid fdroiddata repomaker repomaker-javascript website website-docs website-posts; do
    echo $f `curl --silent https://hosted.weblate.org/exports/stats/f-droid/$f/\?format\=csv | tail -n +2 | awk -F ',' '{ if ($5 > 95.0) print $2 }' | sort -u`
done
