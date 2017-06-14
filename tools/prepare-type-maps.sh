#!/usr/bin/env bash

#
# Prepare the site to be used by apache with mod_negotiation.
# It will traverse the entire website structure, setting up in the process:
#  * `*.html` typemap files telling Apache where to find i18n versions of the file.
#  * moving `LANG/.../*.html` to `.../*.html.LANG`
#


# Fail on errors.
set -eu -o pipefail

function write_typemap {
    OUTPUT_FILE=$1
    LANGS_TO_WRITE="en $2"

    echo "Writing Apache2 TypeMap to ${OUTPUT_FILE} for ${LANGS_TO_WRITE}"

    echo "" > ${OUTPUT_FILE}

    for LANG in ${LANGS_TO_WRITE}; do
        cat<<TXT >> ${OUTPUT_FILE}
URI: index.html.${LANG}
Content-language: ${LANG}
Content-type: text/html

TXT
    done

}

function assert_file {
    if [[ ! -f ${1} ]]; then
        echo "Expected file at ${1}, but not found."
        exit 1
    fi
}

LANGS="fr"
cd _site

find fr/ -name "*.html" -print0 | while IFS= read -r -d '' FILE_PATH
do
    DIR=${FILE_PATH#*/} # Strip off the leading "fr/" from the path
    DIR=`dirname ${DIR}`
    FILE=`basename ${FILE_PATH}`

    if [[ ! -d ${DIR} ]]; then
        echo "Expected directory at ${DIR}, but not found."
        exit 1
    fi

    # Move the English version to *.html.en, so that *.html can be used for the type map.
    SRC_EN_FILE=${DIR}/${FILE}
    DEST_EN_FILE=${DIR}/${FILE}.en
    assert_file ${SRC_EN_FILE}
    mv ${SRC_EN_FILE} ${DEST_EN_FILE}

    write_typemap ${DIR}/${FILE} "${LANGS}"

    for LANG in ${LANGS}; do
        SRC_I18N_FILE=${LANG}/${DIR}/${FILE}
        DEST_I18N_FILE=${DIR}/${FILE}.${LANG}
        assert_file ${SRC_I18N_FILE}
        mv ${SRC_I18N_FILE} ${DEST_I18N_FILE}
    done
done
