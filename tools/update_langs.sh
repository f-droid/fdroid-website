#!/usr/bin/env bash
DIR=`dirname $0`
JEKYLL_DIR=${DIR}/../

LANGS='"en"'

for I18N_DIR in `find ${JEKYLL_DIR}/_data/*/ -name 'strings.json' -printf '%h\n' | sort -u`; do

    LANG=`basename ${I18N_DIR}`

   # Check if string contains $LANG already or not: http://stackoverflow.com/a/229606/2391921
   if [[ ${LANGS} != *"$LANG"* ]]; then
           LANGS="$LANGS, \"$LANG\""
   fi
done

echo "Updating languages to: ${LANGS}"
sed -i "s/^languages: \[.*\]/languages: [ ${LANGS} ]/" ${JEKYLL_DIR}/_config.yml