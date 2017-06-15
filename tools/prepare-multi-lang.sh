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
# This is the format used by Apache's MultiViews directive, meaning we don't need to write out Type Maps for each file.
# Note that it doesn't try to i18n the following files:  .htaccess, *.css, *.js.
# These are just copied from the en/ subdirectory into the webroot.
#

# Fail on errors.
set -eu -o pipefail

function assert_file {
    if [[ ! -f ${1} ]]; then
        echo "Expected file at ${1}, but not found."
        exit 1
    fi
}

#
# When in _site and creating a symlink from assets/blah.png.fr to fr/assets/blah.png, the link needs
# to point to a relative path (i.e. ln -s ../fr/assets.blah.png assets/blah.png.fr).
# This function uses `realpath --relative-to` to ensure that the relative path is used.
#
function relative_symlink {
    SRC=$1
    DEST=$2
    DEST_DIR=`dirname ${DEST}`
    SRC_RELATIVE_TO_DEST=`realpath --relative-to="${DEST_DIR}" "${SRC}"`

    ln -sf ${SRC_RELATIVE_TO_DEST} ${DEST}
}

ls -lah .supported-langs

if [ ! -f .supported-langs ]; then
    echo "Must be run from the same directory as the .supported-langs file (the Jekyll source dir)."
    echo "If that file doesn't exist, then you can generate it with ./tools/update_langs.sh"
    exit 1
fi

if [[ $# == 0 || ! -d $1/en ]]; then
    echo "First argument must be the directory of the Jekyll website."
    echo "This should take into account the baseurl as well. If the site"
    echo "is output to 'build/' and the baseurl is 'fdroid-website/' then"
    echo "the first argument should be 'build/fdroid-website/'"
    exit 1
fi

# This populates the SUPPORTED_LANGS variable.
source .supported-langs

cd $1

# For deploying to GitLab or surge.sh, we still want it to work, which requires leaving original English *.html files
# in the webroot rather than just MultiView compatible *.html.LANG files.
if [[ $# == 2 && $2 == "--no-multi-views" ]]; then
    MULTI_VIEWS=false
else
    MULTI_VIEWS=true
fi

find en/ -type f -print0 | while IFS= read -r -d '' FILE_PATH
do
    DIR=${FILE_PATH#*/} # Strip off the leading "en/" from the path
    DIR=`dirname ${DIR}`
    FILE=`basename ${FILE_PATH}`
    EXTENSION=${FILE_PATH##*.}

    mkdir -p ${DIR}

    if [[ ${MULTI_VIEWS} = false || ${FILE} =~ ^(\.htaccess|.*\.css|.*\.js)$ ]]; then
        echo "Not generating i18n version of ${DIR}/${FILE}"
        cp ${FILE_PATH} ${DIR}/${FILE}
        continue;
    fi

    echo "Processing ${DIR}/${FILE}"

    for LANG in en $SUPPORTED_LANGS; do
        SRC_I18N_FILE=${LANG}/${DIR}/${FILE}
        DEST_I18N_FILE=${DIR}/${FILE}.${LANG}
        assert_file ${SRC_I18N_FILE}
        relative_symlink ${SRC_I18N_FILE} ${DEST_I18N_FILE}
    done
done
