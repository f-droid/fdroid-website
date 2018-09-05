---
layout: page
title: Release Process

---

For each piece of the F-Droid ecosystem, there is a specific release
process.  They generally follow the same patterns, but all have unique
steps.  The official signing keys are listed in
[Release Channels and Signing Keys](../Release_Channels_and_Signing_Keys).


## fdroidclient

1. pull in latest commits from Weblate into a local branch called
   _weblate_
2. run `./tools/check-format-strings.py` and
   `./tools/remove-unused-and-blank-translations.py` and commit
   changes
3. rebase the _weblate_ branch on the latest commits in _master_ of
   <https://gitlab.com/fdroid/fdroidclient> and fix any conflicts
4. push local _weblate_ branch to your fork create a merge request,
   and tag it with the _localization_ label
5. make sure all tests pass before merging, including all _android-10_
   emulator tests
6. once the _weblate_ branch is merged, reset the git repo in
   <https://hosted.weblate.org/projects/f-droid/f-droid/#repository>
7. set _versionCode_ in _app/build.gradle_
8. add new entry in _metadata/en-US/changelogs/_
9. copy that new entry to _CHANGELOG.md_
10. add git signed tag named after the exact version name (no
   preceeding __v__)
11. add new `Build:` entry to
    [metadata file](https://gitlab.com/fdroid/fdroiddata/blob/master/metadata/org.fdroid.fdroid.txt)

### major release

If it is a major release, there are a few more steps.

1. temporarily remove the _iw/in_ links: `find app/src/main/res/ -type l -delete`
2. In Android Studio, go to _Analyze_ -> _Inspect Code_
3. After running on the whole project, go to _Android Lint:
   Performance_, and click on _Unused Resources_, then click the
   _Remove All Unused Resources_ button.  Only commit changes to
   _strings.xml_, **not** _styles.xml_ or other files.
4. Then it is time to create a new stable branch (e.g. _stable-v1.0_
   or _stable-v1.1_) should be created first.  The incomplete
   translations should be removed using
   `./tools/trim-incomplete-translations-for-release.py`.  This has to
   happen in the stable branch only, since it will remove the
   incomplete translations.  If the incomplete translations are removed
   from _master_, then Weblate will sync with that, and remove them
   there as well.


## fdroidserver

1. Make sure its passing the
   [tests on Ubuntu/trusty and OSX](https://travis-ci.org/f-droid/fdroidserver)
2. pull in latest commits from Weblate into a local branch called
   _weblate_
3. rebase the _weblate_ branch on the latest commits in _master_ of
   <https://gitlab.com/fdroid/fdroidserver> and fix any conflicts
4. push local _weblate_ branch to your fork create a merge request,
   and tag it with the _localization_ label
5. make sure all tests pass before merging
6. once the _weblate_ branch is merged, reset the git repo in
   <https://hosted.weblate.org/projects/f-droid/fdroidserver/#repository>
7. set `version=''` in _setup.py_
8. add git signed tag named after the exact version name (no
   preceeding __v__), using the exact same string as `version=''`
9. upload to pypi.python.org using `python3 setup.py release`
10. update [Debian package](https://anonscm.debian.org/git/collab-maint/fdroidserver.git)
11. upload to [F-Droid PPA](https://launchpad.net/~fdroid/+archive/ubuntu/fdroidserver)


## privileged-extension

1. pull in latest commits from Weblate into a local branch called
   _weblate_
2. run `./tools/check-format-strings.py` and
   `./tools/remove-unused-and-blank-translations.py` and commit
   changes
3. rebase the _weblate_ branch on the latest commits in _master_ of
   <https://gitlab.com/fdroid/privileged-extension> and fix any conflicts
4. push local _weblate_ branch to your fork create a merge request,
   and tag it with the _localization_ label
5. make sure all tests pass before merging
6. once the _weblate_ branch is merged, reset the git repo in
   <https://hosted.weblate.org/projects/f-droid/privileged-extension/#repository>
7. set _versionCode_ in _app/src/main/AndroidManifest.xml_
8. add new entry in _metadata/en-US/changelogs/_
9. copy that new entry to _CHANGELOG.md_
10. add git signed tag named after the exact version name (no
   preceeding __v__)
11. If the OTA update ZIP should be updated, add new `Build:` entry to
    [metadata file](https://gitlab.com/fdroid/fdroiddata/blob/master/metadata/org.fdroid.fdroid.privileged.ota.txt)
12. The APK should auto-update based on the signing tag.  Double-check
    that in that
    [metadata file](https://gitlab.com/fdroid/fdroiddata/blob/master/metadata/org.fdroid.fdroid.privileged.txt)


## fdroid-website

1. pull in latest commits from Weblate into a local branch called
   _weblate_
2. run `./tools/check-format-strings.py`,
   `./tools/check-page-links.py`, and
   `./tools/remove-unused-strings.py` and commit changes
3. rebase the _weblate_ branch on the latest commits in _master_ of
   <https://gitlab.com/fdroid/fdroid-website> and fix any conflicts
4. push local _weblate_ branch to your fork create a merge request,
   and tag it with the _localization_ label
5. make sure all tests pass before merging
6. once the _weblate_ branch is merged, reset the git repo in
   <https://hosted.weblate.org/projects/f-droid/website/#repository>
7. add git signed tag named after the exact version name (no
   preceeding __v__), using the exact same string as `version=''`


## jekyll-fdroid

1. Make sure all the tests are passing
2. set `s.version` and `s.date` in _jekyll-fdroid.gemspec_
3. Make signed tag matching version number (no preceeding __v__)
4. Update _fdroid-website_ to use this release by setting both
   `revision:` and the version number in `specs: jekyll-fdroid
   (1.0.1)` in _Gemfile.lock_
