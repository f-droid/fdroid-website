#!/bin/sh
#
# grep -Eo "'[A-Z][A-Za-zn ]+'," ../server/fdroidserver/metadata.py|grep ' ' | sort -ru

basedir=`cd $(dirname $0)/..; pwd`

for f in 'Web Site' 'Vercode Operation' 'Update Check Name' 'Update Check Mode' 'Update Check Ignore' 'Update Check Data' 'Source Code' 'Requires Root' 'Repo Type' 'No Source Since' 'Maintainer Notes' 'Issue Tracker' 'Current Version Code' 'Current Version' 'Auto Update Mode' 'Auto Name' 'Author Web Site' 'Author Name' 'Author Email' 'Archive Policy'; do
    aname=`echo $f | sed 's, ,-,g'`
    new=`echo $f | sed 's, ,,g'`
    backtick='`'$new'`'
    echo "'$f' '$new'"
    sed -i \
        -e "s,$f,$new,g" \
        -e "s,$aname,$new,g" \
        -e "s, ${new}<, _${new}_<," \
        -e "s, ${new} , _${new}_ ,g" \
        -e "s,^${new} ,_${new}_ ,g" \
        -e "s, ${new}$, _${new}_,g" \
        -e "s,${backtick},_${new}_,g" \
        $basedir/*/*.md
done

for f in AntiFeatures ArchivePolicy AuthorEmail AuthorName AuthorWebSite AutoName AutoUpdateMode Binaries Bitcoin Builds Categories Changelog CurrentVersion CurrentVersionCode Description Disabled Donate FlattrID IssueTracker LiberapayID License Litecoin MaintainerNotes Name NoSourceSince Provides Repo RepoType RequiresRoot SourceCode Summary Translation UpdateCheckData UpdateCheckIgnore UpdateCheckMode UpdateCheckName VercodeOperation WebSite; do
    backtick='`'$f'`'
    sed -i \
        -e "s,${backtick},_${f}_,g" \
        -e "s,\[${f}\],[_${f}_],g" \
        $basedir/*/*.md        
done
