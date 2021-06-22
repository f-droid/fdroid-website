#!/bin/bash
set -e
assets=( $( ack -l '\{% assets' ) )
if [ "${#assets[@]}" != 0 ]; then
  sed -ri 's!\{% assets %}/([^ {}")[]*\.(png|svg|pdf|jpg|ttf|js|css))!{% asset \1 %}!g' "${assets[@]}"
fi
baseurl=( $( ack -l '\{\{ site.baseurl }}/assets' ) )
if [ "${#baseurl[@]}" != 0 ]; then
  sed -ri 's!\{\{ site.baseurl }}/assets/([^ {}")[]*\.(png|svg|pdf|jpg|ttf|js|css))!{% asset \1 %}!g' "${baseurl[@]}"
fi
