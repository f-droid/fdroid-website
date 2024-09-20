#!/bin/sh
#
# grep -Eo "'[A-Z][A-Za-zn ]+'," ../server/fdroidserver/metadata.py|grep ' ' | sort -ru

basedir=`cd $(dirname $0)/..; pwd`

for f in 'Web Site' 'Vercode Operation' 'Update Check Name' 'Update Check Mode' 'Update Check Ignore' 'Update Check Data' 'Source Code' 'Requires Root' 'Repo Type' 'No Source Since' 'Maintainer Notes' 'Issue Tracker' 'Current Version Code' 'Current Version' 'Auto Update Mode' 'Auto Name' 'Author Web Site' 'Author Name' 'Author Email' 'Archive Policy'; do
    aname=`echo $f | sed 's, ,-,g'`
    new=`echo $f | sed 's, ,,g'`
    backtick='`'$new'`'
    sed -i \
        -e "s,$f,$new,g" \
        -e "s,$aname,$new,g" \
        -e "s, ${new}<, _${new}_<," \
        -e "s, ${new} , _${new}_ ,g" \
        -e "s,^${new} ,_${new}_ ,g" \
        -e "s, ${new}$, _${new}_,g" \
        -e "s,${backtick},_${new}_,g" \
        $basedir/*/*.md $basedir/po/*.po*
done

for f in AntiFeatures ArchivePolicy AuthorEmail AuthorName AuthorWebSite AutoName AutoUpdateMode Binaries Bitcoin Builds Categories Changelog CurrentVersion CurrentVersionCode Description Disabled Donate IssueTracker LiberapayID License Litecoin MaintainerNotes Name NoSourceSince Provides Repo RepoType RequiresRoot SourceCode Summary Translation UpdateCheckData UpdateCheckIgnore UpdateCheckMode UpdateCheckName VercodeOperation WebSite; do
    backtick='`'$f'`'
    sed -i \
        -e "s,${backtick},_${f}_,g" \
        -e "s,\[${f}\],[_${f}_],g" \
        -e "s, ${f}\., _${f}_.,g" \
        $basedir/*/*.md $basedir/po/*.po*
done

# fixup mistakes
sed -i \
    -e 's,^### _SourceCode_$,### Source Code,g' \
    -e 's,^msgid "SourceCode",msgid "Source Code",g' \
    -e 's,emacs _config.py_ ,emacs config.py ,g' \
    -e 's,unzip -p _index.jar_,unzip -p index.jar,g' \
    -e 's,CyanogenMod \[_Changelog_\],CyanogenMod [Changelog],g' \
    $basedir/*/*.md $basedir/po/*.po*

#
# sed -En "s/^    '([a-z]+)',$/\1/p" ../fdroidserver/fdroidserver/metadata.py |sort -u
for f in androidupdate antcommands antifeatures build buildjni buildozer commit disable encoding extlibs forcevercode forceversion gradle gradleprops init maven ndk novcheck oldsdkloc output patch preassemble prebuild rm scandelete scanignore srclibs subdir submodules sudo target timeout; do
    backtick='`'$f'`'
    backtickequal='`'$f'=`'
    sed -i \
        -e "s,${backtick},_${f}_,g" \
        -e "s,${backtickequal},_${f}_,g" \
        -e "s,\[${f}\],[_${f}_],g" \
        -e "s/ ${f}=\([ ,]\)/ _${f}_\1/g" \
        -e "s,^\(\`${f}\)=,\1: ,g" \
        $basedir/*/*.md $basedir/po/*.po*
done

# file names
for f in AndroidManifest.xml build.gradle build.xml config.py custom_rules.xml index.jar index.xml index-v1.jar index-v1.json makebuildserver META-INF/buildserverid META-INF/fdroidserverid ndk-build project.properties .classpath .gitmodules; do
    backtick='`'$f'`'
    sed -i \
        -e "s,${backtick},_${f}_,g" \
        -e "s, ${f} , _${f}_ ,g" \
        -e "s, ${f}\., _${f}_.,g" \
        $basedir/*/*.md $basedir/po/*.po*
done

