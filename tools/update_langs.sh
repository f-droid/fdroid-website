#!/usr/bin/env bash

# Fail on errors.
set -eu -o pipefail

DIR=`dirname $0`
JEKYLL_DIR=${DIR}/../

#
# For each directory `_data/[LANG]/ which contains a `strings.json` file, we take LANG and add it to our config file so
# that Jekyll knows to generate a site for that language.
#
function update_langs_in_config {
    LANGS='"en"'

    for I18N_DIR in `find ${JEKYLL_DIR}/_data/*/ -name 'strings.json' -printf '%h\n' | sort -u`; do

        # Check if string contains $LANG already or not: http://stackoverflow.com/a/229606/2391921
        LANG=`basename ${I18N_DIR}`
        if [[ ${LANGS} != *"$LANG"* ]]; then
            LANGS="$LANGS, \"$LANG\""
        fi
    done

    echo "Updating languages to: ${LANGS}"
    sed -i "s/^languages: \[.*\]/languages: [ ${LANGS} ]/" ${JEKYLL_DIR}/_config.yml
}

update_langs_in_config
