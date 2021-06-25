#!/bin/bash
set -e
assets=($(
  grep -lER --exclude-dir=.git --exclude='*~' --exclude='*.swp' \
    --exclude-dir=tools --exclude-dir=_plugins \
    '\{% assets' .
))
if [ "${#assets[@]}" != 0 ]; then
  sed -ri 's!\{% assets %}/([^ {}")[]*\.(png|svg|pdf|jpg|ttf|js|css))!{% asset \1 %}!g' "${assets[@]}"
fi
baseurl=($(
  grep -lER --exclude-dir=.git --exclude='*~' --exclude='*.swp' \
    --exclude-dir=tools --exclude-dir=_plugins \
    '\{\{ site.baseurl }}/assets' .
))
if [ "${#baseurl[@]}" != 0 ]; then
  sed -ri 's!\{\{ site.baseurl }}/assets/([^ {}")[]*\.(png|svg|pdf|jpg|ttf|js|css))!{% asset \1 %}!g' "${baseurl[@]}"
fi
