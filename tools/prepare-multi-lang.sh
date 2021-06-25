#!/usr/bin/env bash

#
# Prepare the site to be used by apache with mod_negotiation.
#
# Takes a file tree that looks like this:
#  _site/
#    en/
#      index.html
#      packages/
#        org.fdroid.fdroid/index.html
#        ...
#    fr/
#      index.html
#      packages/
#        org.fdroid.fdroid/index.html
#        ...
#
# And transforms it into this:
#
#  _site/
#    index.html.en -> en/index.html
#    index.html.fr -> fr/index.html
#    packages/
#      org.fdroid.fdroid/index.html.en -> en/packages/org.fdroid.fdroid/index.html
#      org.fdroid.fdroid/index.html.fr -> fr/packages/org.fdroid.fdroid/index.html
#      ...
#    en/
#      index.html
#      packages/
#        org.fdroid.fdroid/index.html
#        ...
#    fr/
#      index.html
#      packages/
#        org.fdroid.fdroid/index.html
#        ...
#
# This is the format used by Apache's MultiViews directive, meaning we
# don't need to write out Type Maps for each file.  Note that it
# doesn't try to i18n the following files: .htaccess, *.css, *.js.
# These are just copied from the en/ subdirectory into the webroot.
#

# Fail on errors.
set -eu

function assert_file {
    if [[ ! -f ${1} ]]; then
        echo "Expected file at ${1}, but not found."
        exit 1
    fi
}

#
# When in _site and creating a symlink from assets/blah.png.fr to
# fr/assets/blah.png, the link needs to point to a relative path
# (i.e. ln -s ../fr/assets.blah.png assets/blah.png.fr).  This
# function uses `realpath --relative-to` to ensure that the relative
# path is used.
#
function relative_symlink {
    SRC=$1
    DEST=$2
    DEST_DIR=`dirname ${DEST}`
    SRC_RELATIVE_TO_DEST=`realpath --relative-to="${DEST_DIR}" "${SRC}"`

    ln -sf ${SRC_RELATIVE_TO_DEST} ${DEST}
}

function convert_weblate_language_code {
    LANG_CODE=$1
    echo ${LANG_CODE} | tr '[:upper:]' '[:lower:]' | tr '_' '-'
}

# There are only zh-hans (Simplified) and zh-hant (Traditional)
# translations, but Firefox uses country codes instead of language
# code.  So tack those on at the end, since we always have both zh.
function write_typemap {
    OUTPUT_FILE=$1
    LANGS_TO_WRITE=$2

    echo "" > ${OUTPUT_FILE}

    FILE_NAME=`basename ${OUTPUT_FILE}`

    for WEBLATE_LANG in ${LANGS_TO_WRITE}; do
        HTTP_LANG=`convert_weblate_language_code ${WEBLATE_LANG}`
        cat<<TXT >> ${OUTPUT_FILE}
URI: ${FILE_NAME}.${WEBLATE_LANG}
Content-language: ${HTTP_LANG}
Content-type: text/html

TXT
    done
    cat<<TXT >> ${OUTPUT_FILE}
URI: ${FILE_NAME}.zh_Hans
Content-language: zh-cn
Content-type: text/html

URI: ${FILE_NAME}.zh_Hant
Content-language: zh-hk
Content-type: text/html

URI: ${FILE_NAME}.zh_Hant
Content-language: zh-tw
Content-type: text/html

TXT
}


if [ ! -f _config.yml ]; then
    echo "Must be run from the same directory as _config.yml (the Jekyll source dir)."
    exit 1
fi

if [[ $# == 0 ]]; then
    echo "At least one argument required!"
    exit 1
fi

if [ ! -d $1/en ]; then
    echo "$1/en does not exist!"
    echo "First argument must be the directory of the Jekyll website."
    echo "This should take into account the baseurl as well. If the site"
    echo "is output to 'build/' and the baseurl is 'fdroid-website/' then"
    echo "the first argument should be 'build/fdroid-website/'"
    exit 1
fi

SUPPORTED_LANGS=`ruby -ryaml -e 'puts YAML.load_file("_config.yml")["languages"]'`
test -n "$SUPPORTED_LANGS"

# This populates the WEBLATE_LANGS variable.
source tools/weblate-supported-langs.sh

cd $1

# For deploying to GitLab Pages, we still want it to work, which
# requires leaving original English *.html files in the webroot rather
# than just MultiView compatible *.html.LANG files.
if [[ $# == 2 && $2 == "--no-type-maps" ]]; then
    MULTI_VIEWS=false
else
    MULTI_VIEWS=true
fi

i=0
nproc=`nproc`
find en/ -type f -print0 | while IFS= read -r -d '' FILE_PATH; do
    DIR=${FILE_PATH#*/} # Strip off the leading "en/" from the path
    DIR=`dirname ${DIR}`
    FILE=`basename ${FILE_PATH}`
    EXTENSION=${FILE_PATH##*.}

    mkdir -p ${DIR}

    # At this stage we are only translating .html files.  In the
    # future when we support i18n of graphics too, then this will need
    # to be updated.
    if [[ ${MULTI_VIEWS} = false || ${EXTENSION} != "html" ]]; then
        echo "Not generating i18n version of ${DIR}/${FILE}"
        cp ${FILE_PATH} ${DIR}/${FILE}
        continue;
    fi

    (
	echo "Processing ${DIR}/${FILE}"

	for LANG in $SUPPORTED_LANGS; do
            SRC_I18N_FILE=${LANG}/${DIR}/${FILE}
            DEST_I18N_FILE=${DIR}/${FILE}.${LANG}
            assert_file ${SRC_I18N_FILE}
            relative_symlink ${SRC_I18N_FILE} ${DEST_I18N_FILE}
	done

	write_typemap ${DIR}/${FILE} "$SUPPORTED_LANGS"
    ) &
    i=$((i+1))
    if [ $i -ge $nproc ]; then
        wait
        i=0
    fi
done

if [[ ${MULTI_VIEWS} = true ]]; then

    ALIAS_MATCH=""
    SIMPLE_LANGS=""
    SET_ENV_IF=""

    for WEBLATE_LANG in ${WEBLATE_LANGS}; do
        if [[ ${ALIAS_MATCH} == "" ]]; then
            ALIAS_MATCH=${WEBLATE_LANG}
        else
            ALIAS_MATCH="${ALIAS_MATCH}|${WEBLATE_LANG}"
        fi

        HTTP_LANG=`convert_weblate_language_code ${WEBLATE_LANG}`
        if [ ${HTTP_LANG} == ${WEBLATE_LANG} ]; then
            if [[ ${SIMPLE_LANGS} == "" ]]; then
                SIMPLE_LANGS=${WEBLATE_LANG}
            else
                SIMPLE_LANGS="$SIMPLE_LANGS|$WEBLATE_LANG"
            fi
        else
            SET_ENV_IF=`echo -e "SetEnvIf Request_URI ^/$WEBLATE_LANG/ prefer-language=$HTTP_LANG\n    $SET_ENV_IF"`
        fi
    done

    cat<<HELP

Finished preparing site for i18n using Apache2 and mod_negotiation.
Ensure that you have the following in your Apache2 Server/VirtualHost config, where "/var/www/html" is replaced with your webroot:

    <Files *.html>
            SetHandler type-map
    </Files>

    # Virtualize the language sub"directories"
    AliasMatch ^(?:/(?:${ALIAS_MATCH})/)?(.*)?\$ /var/www/html/\$1

    # Tell mod_negotiation which language to prefer
    SetEnvIf Request_URI ^/(${SIMPLE_LANGS})/ prefer-language=\$1

    # Language codes from Weblate containing capital letters and underscores need to be treated
    # differently, namely the language they refer to is lower case with a hyphen
    $SET_ENV_IF

HELP
fi
