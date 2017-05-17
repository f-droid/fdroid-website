#!/usr/bin/env bash

# Fail on errors.
set -eu -o pipefail

DIR_TOOLS=`dirname $0`

# Try to make the path names nice and relative to the root directory. The paths do end up in the resulting .po files,
# so we don't want this script to change the .po output based on where it is executed from.
PREVIOUS_CWD=`pwd`
cd ${DIR_TOOLS}/../

DIR_SRC=.
DIR_BUILD=${DIR_SRC}/build
DIR_PO=${DIR_SRC}/po

###################################################
# Generate PO (gettext) files from Markdown files #
###################################################

function md2po {
	echo "Converting .md source into .po files"

	if [ -d ${DIR_BUILD} ]; then rm -r ${DIR_BUILD}; fi
	generate_po_files _docs
	generate_po_files _posts
	rm -r ${DIR_BUILD}
}

#
# Usage: generate_po_files SRC_TYPE
#
#   Where SRC_TYPE is either _posts or _docs (i.e. directories with .md files that are translated into a single .po file)
#
# This will:
#  * Copy the original .md files, after stripping their metadata, to a temporary build directory.
#  * For each .md file it invokes po4a to extract the strings into a .pot file.
#  * Once all .md files have had their strings extracted, they are combined into a single .po file using msgcat.
#  * This .po file is the thing which will end up getting translated.
#
function generate_po_files {
	SRC_TYPE=$1
	SRC_SUBDIR=${DIR_SRC}/${SRC_TYPE}
	BUILD_SUBDIR=${DIR_BUILD}/${SRC_TYPE}/md
    DIR_BUILD_PO=${DIR_BUILD}/${SRC_TYPE}/po
    OUT_PO_FILE=${DIR_PO}/${SRC_TYPE}.po

    echo "Generating .po files for $SRC_TYPE:"
    cp_md_strip_frontmatter_dir ${SRC_SUBDIR} ${BUILD_SUBDIR}

    for MD in ${BUILD_SUBDIR}/*.md; do
        FILE=`basename ${MD}`
        NAME=${FILE%.*}

        echo "Extracting strings from $MD"
        mkdir -p ${DIR_BUILD_PO}

        # For some reason these need to be .pot files instead of .po files for msgcat below to work correctly.
        po4a-gettextize -f text -o markdown -L utf-8 -M utf-8 -m ${MD} -p ${DIR_BUILD_PO}/${NAME}.pot
    done

    echo "Combining .po files into $OUT_PO_FILE"
	mkdir -p `dirname ${OUT_PO_FILE}`
	msgcat -o ${OUT_PO_FILE} ${DIR_BUILD_PO}/*.pot
}



function cp_md_strip_frontmatter_dir {
	SRC_MD_DIR=$1
	BUILD_MD_DIR=$2

	echo "Copying .md files and stripping front matter..."

	mkdir -p ${BUILD_MD_DIR}
	for MD in ${SRC_MD_DIR}/*.md; do
		FILE=`basename ${MD}`
        SRC_MD_FILE=${SRC_MD_DIR}/${FILE}
        BUILD_MD_FILE=${BUILD_MD_DIR}/${FILE}

        # We cheat, by stripping the front matter, and replacing it with "# Title" (where Title is taken
        # from the "title: " attribute in the frontmatter we are stripping. Then we can remove that line
        # when it comes time to reassemble the translated files again. This ensures that po4a is able to
        # make the title available for translation, and also that it is alongside the rest of the document
        # when Weblate shows each of the strings that belong to a document.
        TITLE=`extract_frontmatter ${SRC_MD_FILE} | grep 'title:' | sed 's/title:\s*//'`
        echo "# $TITLE" > ${BUILD_MD_FILE}

        # Strip front-matter from .md files and write to temporary location.
        # http://stackoverflow.com/a/28222257/2391921
        sed '1 { /^---/ { :a N; /\n---/! ba; d} }' ${SRC_MD_FILE} >> ${BUILD_MD_FILE}
	done
}

# See http://stackoverflow.com/a/7167115/2391921 for matching multiline strings with grep
# Grep converted newlines to ASCII NUL characters, so we use sed to change them back.
function extract_frontmatter {
	FILE=$1
	grep -Pzo '(?s)---.*?---\n' ${FILE} | sed 's/\x00/\n/'
}

################################
# CLI interface to this script #
################################

function print_usage {
	cat << EOT
Internationalization script for F-Droid Jekyll website.

Usage:

  i18n.sh md2po
    Convert all translated .po files into localized .md files.
EOT
    cd ${PREVIOUS_CWD}
	exit 0
}

if test $# -lt 1
then
	print_usage
else
	case "$1" in
		md2po) md2po
		;;
		*) print_usage
	esac
fi

cd ${PREVIOUS_CWD}