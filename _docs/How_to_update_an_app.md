---
layout: page
title: How to update an app

---

What I would like to read here would be:

-   "What is where, and why?" - a brief guide through the infrastructure
    and workflow / scripts.
-   Howto "update the metadata on gitlab.com/fdroid/fdroiddata".

Target group would be developer/release-manager of the apps **and** for
the "external interested user" who just notices that there is a new
version of an app - but not yet in F-Droid system available. "What would
I do to trigger the update?"

@Tverrbjelke: (If s.o. briefs me, I would spend some of my time
writing that down. love F-Droid, and hate to see such simple and needed
issue is not yet ready. :-) )

@daithib8: Assuming
everything is setup and the user is familiar with building via fdroid …
(these instructions take a terminal-based approach. You can manage with
a web browser, but it takes quite a while to learn the layout of the
common source code websites. For complicated apps that rebase code and
use many branches, I'll often visit the source code site too).

-   Take a note of the current version according to the developer
    &ndash; a clue is often written above the _CurrentVersion_ in
    the metadata. To visit Google Play quickly to get the version name
    there, install w3m and add this function `gplay() { w3m
    play.google.com/store/apps/details/?id="$@" ;}` to
    your bashrc. Then you can just do
    `gplay package-name`. If you find that the
    version is greater than the _CurrentVersion_ in the metadata, update
    it right away (unless there are any beta or test builds
    currently activated)
-   If the _CurrentVersion_ in the metadata (especially in the case of
    the update check mode RepoManifest) is greater than on Google Play
    or the download page, you may not need to update and can just add a
    dummy build version e.g `Build Version:1.2,34,!not
    published by the developer,subdir=main`
-   Clone the source code repository if you don't have it already by
    building an already existing version (which you can quit once the
    build is under way)
-   Change in to the repo: `pushd
    build/package-name`
-   `la` to remind onesself of the VCS type.
    Let's assume it's Mercurial (with which I am barely familiar)
-   `hg revert -a; hg pull; hg up` to get the
    latest code from the repo. Take a note of the new tags
-   `hg log |less` and read the single line
    descriptions back to the previous version to get a quick idea of the
    latest changes and find the revision or tag corresponding to the
    current version noted earlier
-   ` hg up "tag"` to switch to the tag or
    revision (to make sure you are auditing exactly what will be built)
-   `hg log -p` e.g. libs | _build.xml_ |
    _AndroidManifest.xml_ | _project.properties_ | res/raw | assets |
    _.gitmodules_ | _.classpath_ to take a closer look at the changes in
    some of the important files (as far as updating is concerned). If
    new jars (or new versions of old ones) are found then they must be
    verified to see they were found from canonical sources and are free
    with source code;the first thing to try is to open the jar to see
    the class names (`unzip -l`) and visit e.g.
    <http://central.maven.org/maven2/io/netty/> where you will find
    checksums to compare with. Take a note of jars such as bugsense or
    acra which are used for bugreports
-   If you find proprietary files add a dummy build version to the
    metadata with a few words about the reason, add _NoSourceSince_ to
    the bottom and a line to the descripion beginning with Status: to
    the description explaining the reason that the app can't be updated
-   `find . -type f -executable` to locate any
    scripts and things. Note that ant will also execute anything it
    finds in _build.xml_ and custom_rules.xml!
-   `$find . -name '\*' | xargs file --mime | grep
    executable|shared-lib` to see if any prebuilts
    are around. These would often be detected by fdroid anyway and would
    usually be located in res/raw/ , assets/ or jni/.
-   Open some files in your editor, like the README, licenses, possibly
    files in res/xml that would contain changelogs, project.properties;
    run `git submodule` if applicable. All these
    will give clues about what might need changing from the
    previous build. It's very possible that no info will be given about
    Android libraries so you'll have to look for other clues, in the
    commit log for instance. If all else fails: `cd
    ../srclibs/ActionLibrary` and checkout out the latest
    code to find a suitable commit.
-   Write a patch if necessary although sed in the metadata is usually
    the better option: `mkdir ../../metadata/package-name; hg
    diff > ../../metadata/package-name.diff`
-   `popd; vi metadata/package-name.txt` to add a
    new Build Version
-   Test with `fdroid build -p package-name -t -l -v |
    less` (use the completion script in fdroidserver) N.B
    --install doesn't currently warn if version names/codes are
    different from the metadata. Also proguard isn't enabled (since it
    is a debug build); neither will it warn you if it hasn't been
    installed for some reason.
-   Sign with a debug key `jarsigner -keystore
    \~/.android/debug.keystore -digestalg SHA1 -sigalg SHA1withRSA
    tmp/com.seawolfsanctuary.keepingtracks_20130727.apk
    androiddebugkey`
-   `adb install tmp/com.seawolfsanctuary.keepingtracks_20130727.apk -a`
    and have look at the result. Look at the about screen in particular.
    If bug report libraries are in use verify that crash reporting is
    optional (the Android Manifest can help here). If crash reporting is
    on by default the app needs an anti-feature. Same thing applies
    to ads.
-   Add any info for the next time above AutoUpdateMode, and see if
    the update check mode needs any tweaking.
-   Have a quick look at the description and urls to see if anything
    needs updating
-   Commit new srclibs and extlibs `git commit build/extlibs/volley/\*` and include a source.txt if a
    jar is from a new location
-   If there is nothing special, commit directly with the
    commitupdates script. If not, include as much info as you can in the
    body of the git commit

That's a lot of things to do, but experience shows that it's a good idea
to be vigilant and of course the process gets faster with time... Good
luck!
