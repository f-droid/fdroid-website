#!/usr/bin/env bash

# Fail on errors.
set -eu -o pipefail

DIR_TOOLS=`dirname $0`

# Try to make the path names nice and relative to the root
# directory. The paths do end up in the resulting .po files, so we
# don't want this script to change the .po output based on where it is
# executed from.
PREVIOUS_CWD=`pwd`
cd ${DIR_TOOLS}/../

DIR_SRC=.
DIR_BUILD=${DIR_SRC}/build
DIR_PO=${DIR_SRC}/po

###################################################
# Generate PO (gettext) files from Markdown files #
###################################################

function md2po {
    echo "Converting .md source into .pot files"

    if [ -d ${DIR_BUILD} ]; then rm -r ${DIR_BUILD}; fi
    generate_pot_file _docs
    generate_pot_file _posts
    generate_pot_file _pages
    rm -r ${DIR_BUILD}
}

#
# Usage: generate_pot_file SECTION
#
#   Where SECTION is either _posts, _pages, or _docs
#   (i.e. directories with .md files that are translated into a single
#   .pot file)
#
# This will:
#  * Copy the original .md files, after stripping their metadata, to a temporary build directory.
#  * For each .md file it invokes po4a to extract the strings into a .pot file.
#  * Once all .md files have had their strings extracted, they are combined into a single .pot file using msgcat.
#  * This .pot file is the thing which will end up getting translated.
#
function generate_pot_file {
    SECTION=$1
    SRC_SUBDIR=${DIR_SRC}/${SECTION}
    BUILD_SUBDIR=${DIR_BUILD}/${SECTION}/md
    DIR_BUILD_PO=${DIR_BUILD}/${SECTION}/po
    OUT_POT_FILE=${DIR_PO}/${SECTION}.pot

    echo "Generating .pot files for $SECTION:"
    cp_md_strip_frontmatter_dir ${SRC_SUBDIR} ${BUILD_SUBDIR}

    for MD in `ls -1 ${BUILD_SUBDIR}/*.md | sort`; do
        FILE=`basename ${MD}`
        NAME=${FILE%.*}

        echo "Extracting strings from $MD"
        mkdir -p ${DIR_BUILD_PO}

        # For some reason these need to be .pot files instead of .po
        # files for msgcat below to work correctly.
        po4a-gettextize -f text -o markdown -L utf-8 -M utf-8 -m ${MD} -p ${DIR_BUILD_PO}/${NAME}.pot
    done

    echo "Combining .pot files into $OUT_POT_FILE"
    mkdir -p `dirname ${OUT_POT_FILE}`
    msgcat --no-wrap --lang=en_US --add-location=file -o ${OUT_POT_FILE} ${DIR_BUILD_PO}/*.pot
}


########################################
# Generate Markdown from i18n PO files #
########################################

function po2md {
    echo "Converting .po files back into .md source"

    if [ -d ${DIR_BUILD} ]; then rm -r ${DIR_BUILD}; fi
    generate_md_files _docs
    generate_md_files _posts
    generate_md_files _pages
    rm -r "${DIR_BUILD}"
}

#
# Usage: generate_md_files SECTION
#
#   Where SECTION is either _posts, _pages, or _docs
#   (i.e. directories with .md files that are translated into a single
#   .po file)
# 
# This will:
#  * Copy the original .md files, after stripping their metadata, to a temporary build directory.
#  * Uses these stripped .md files as the "master" document for po4a.
#  * Iterate over each .po file, figuring out which language it is for based on its filename.
#  * For each .md/language pair it invokes po4a to assemble a translated .md (still with stripped front matter)
#  * Fetches the frontmatter from the original source .md file, and combines it with the translated, stripped .md file.
#  * This is then output into the final translated .md file.
#
function generate_md_files {
    SECTION=$1
    SRC_SUBDIR=${DIR_SRC}/${SECTION}
    BUILD_SUBDIR=${DIR_BUILD}/${SECTION}
    
    echo "Converting .md files (from $BUILD_SUBDIR) based on .po files..."

    cp_md_strip_frontmatter_dir ${SRC_SUBDIR} ${BUILD_SUBDIR}/md

    languages=`sed -nE 's,^languages:(.*)\] *, \1 ,p' _config.yml |  sed 's/[^a-zA-Z_ ]/ /g'`

    if [ `check_for_po ${SECTION}` = true ]; then
        for PO in ${DIR_PO}/${SECTION}.*.po; do
            PO_FILE=`basename ${PO}`
            LOCALE=`echo ${PO_FILE} | sed -e "s/${SECTION}\.\(.*\)\.po/\1/"`

	    (echo $languages | grep --fixed-strings " $LOCALE ") || continue

            OUT_DIR_I18N_MD=${DIR_SRC}/${SECTION}/${LOCALE}
            BUILD_DIR_I18N_MD=${BUILD_SUBDIR}/${LOCALE}

            echo "Generating $LOCALE translations from $PO_FILE..."
            rm -rf ${OUT_DIR_I18N_MD}
            mkdir -p ${OUT_DIR_I18N_MD} ${BUILD_DIR_I18N_MD}

            for MD in ${BUILD_SUBDIR}/md/*.md; do
                MD_FILE=`basename ${MD}`
                OUT_TMP_MD_FILE=${BUILD_DIR_I18N_MD}/${MD_FILE}
                OUT_MD_FILE=${OUT_DIR_I18N_MD}/${MD_FILE}

                # Extract a the .po file for the translated markdown
                # file. Count up how many translated strings there are
                # for this file. If none, then don't bother converting
                # (it will just take up space in our repo and make it
                # harder to see what is actually translated).  Need to
                # take the `realpath`, because msggrep will fail with
                # "./build/..." but succeed with "build/..."
                SRC_MD_FILE=`realpath --relative-to . ${BUILD_SUBDIR}`/md/${MD_FILE}
                TRANSLATED=`msggrep --location=${SRC_MD_FILE} ${DIR_PO}/${PO_FILE} | msgattrib --translated | wc -l`
                if [ ${TRANSLATED} == "0" ]; then
                    echo "Ignoring untranslated $OUT_MD_FILE"
                    continue;
                fi

                echo "Translating $OUT_MD_FILE"
                po4a-translate -f text -o markdown -L utf-8 -M utf-8 -m ${MD} -p ${PO} -l ${OUT_TMP_MD_FILE} -k 0

                # Extract the front matter from the source and add it
                # to the top of the final i18n .md file (after
                # stripping the "# [TITLE]" line we added
                # earlier). This is used to replace the "title:" from
                # the translated .md file and replace it with the i18n
                # "title:". In the process we ensure that the
                # frontmatter contains the correct `lang:` attribute.
                TITLE=`head -n 1 ${OUT_TMP_MD_FILE} | sed 's/^# //'`
                extract_frontmatter ${SRC_SUBDIR}/${MD_FILE} | sed "s/^title:.*/title: $TITLE\nlang: $LOCALE/" >> ${OUT_MD_FILE}

                # Finally, copy the translated .md file with no
                # frontmatter, and without the "# Title" we previously
                # injected into there either, into the final .md file.
                tail -n +2 ${OUT_TMP_MD_FILE} >> ${OUT_MD_FILE}
            done
        done
    fi
}

#################################################
# Helper functions used by both po2md and md2po #
#################################################

#
# Helper to check if there are any SECTION.LOCALE.po files. This helps
# to not try and iterate over the files if they don't exist
#
# Usage: check_for_po SECTION
#
function check_for_po {
    SECTION=$1

    if compgen -G "$DIR_PO/$SECTION.*.po" > /dev/null;
    then
        echo true
    else
        echo false
    fi
}

#
# A helper function for generate_pot_files and generate_md_files
# because they both need to do the same thing.  That is, they both
# need to strip the frontmatter, then add back in a pseudo "# Title"
# line, where "Title" is read from the frontmatters "title: "
# attribute, and then write to a temporary build directory.
# 
# Usage: cp_md_strip_frontmatter_dir SRC_MD_DIR BUILD_MD_DIR
#
#   Where SRC_MD_DIR contains .md files with frontmatter (delinieated
#   by ---) and BUILD_MD_DIR iw where the resulting .md files are to
#   be copied, after stripping their frontmatter.
#
function cp_md_strip_frontmatter_dir {
    SRC_MD_DIR=$1
    BUILD_MD_DIR=$2

    echo "Copying .md files and stripping front matter..."

    mkdir -p ${BUILD_MD_DIR}
    for MD in ${SRC_MD_DIR}/*.md; do
        FILE=`basename ${MD}`
        SRC_MD_FILE=${SRC_MD_DIR}/${FILE}
        BUILD_MD_FILE=${BUILD_MD_DIR}/${FILE}

        # We cheat, by stripping the front matter, and replacing it
        # with "# Title" (where Title is taken from the "title: "
        # attribute in the frontmatter we are stripping. Then we can
        # remove that line when it comes time to reassemble the
        # translated files again. This ensures that po4a is able to
        # make the title available for translation, and also that it
        # is alongside the rest of the document when Weblate shows
        # each of the strings that belong to a document.
        TITLE=`extract_frontmatter ${SRC_MD_FILE} | grep 'title:' | sed 's/title:\s*//'`
        echo "# $TITLE" > ${BUILD_MD_FILE}

        # Strip front-matter from .md files and write to temporary
        # location.  http://stackoverflow.com/a/28222257/2391921
        sed '1 { /^---/ { :a N; /\n---/! ba; d} }' ${SRC_MD_FILE} >> ${BUILD_MD_FILE}
    done
}

function extract_frontmatter {
    FILE=$1

    # See http://stackoverflow.com/a/7167115/2391921 for matching
    # multiline strings with grep The -z flag replaces new lines with
    # NUL resulting in "Binary file matches" rather than more useful
    # output (i.e. the actual matching content). The -a switch makes
    # grep interpret the output like text again. For some reason
    # though on my machine there is still a NUL byte at the end which
    # trips up this script, so sed replaces it with a newline.
    grep -Pzao '(?s)---.*?---\n' ${FILE} | sed 's/\x00/\n/'
}

################################
# CLI interface to this script #
################################

function print_usage {
    cat << EOT
Internationalization script for F-Droid Jekyll website.

Usage:

  i18n.sh po2md
    Convert all .md source files into .po files ready to be translated.

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
        po2md) po2md
        ;;
        *) print_usage
    esac
fi

cd ${PREVIOUS_CWD}
