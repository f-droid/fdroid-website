#!/usr/bin/env bash

# Fail on errors.
set -eu -o pipefail

DIR=`dirname $0`
JEKYLL_DIR=${DIR}/../

#
# For each directory `_data/[LANG]/ which contains a `strings.json` file, we take LANG and:
#  * Add it to our config file so that Jekyll knows to generate a site for that language.
#  * Attempt to download an icon for that language if it doesn't already exist.
#
# Note the icon downloading code may fail, because it assumes the country code is the same as the language
# code used by https://github.com/googlei18n/region-flags. For example, we special case English because there
# is not an "en" flag, only a "gb" flag. In the case of failure, it will just not render that flag when in that
# language. The user will still be able to see their current language and change languages via a drop down list.
#
function update_langs_in_config {
    LANGS='"en"'

    attempt_to_download_flag "gb" "en"

    for I18N_DIR in `find ${JEKYLL_DIR}/_data/*/ -name 'strings.json' -printf '%h\n' | sort -u`; do

        # Check if string contains $LANG already or not: http://stackoverflow.com/a/229606/2391921
        LANG=`basename ${I18N_DIR}`
        if [[ ${LANGS} != *"$LANG"* ]]; then
            attempt_to_download_flag ${LANG} ${LANG}
            LANGS="$LANGS, \"$LANG\""
        fi
    done

    echo "Updating languages to: ${LANGS}"
    sed -i "s/^languages: \[.*\]/languages: [ ${LANGS} ]/" ${JEKYLL_DIR}/_config.yml
}

function attempt_to_download_flag {
    COUNTRY=$1
    LANG=$2
    COUNTRY_UPPER=`echo ${COUNTRY} | tr '[:lower:]' '[:upper:]'`
    FLAG_DIR=${JEKYLL_DIR}/assets/lang
    FLAG_FILE=${FLAG_DIR}/${LANG}.png
    URL="https://raw.githubusercontent.com/googlei18n/region-flags/gh-pages/png/$COUNTRY_UPPER.png"

    if [ ! -f ${FLAG_FILE} ]; then
        echo "Trying to download flag for ${LANG} from ${URL}"
        mkdir -p ${FLAG_DIR}
        curl ${URL} | convert -resize 100x50 - ${FLAG_FILE}
        if [ ! -f ${FLAG_FILE} ]; then
            echo "Could not find flag for language ${LANG}."
        fi
    else
        echo "Flag for ${LANG} already exists"
    fi

}

update_langs_in_config
