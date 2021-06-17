---
layout: post
title: "F-Droid and the Janus Vulnerability"
author: "eighthave"
authorWebsite: "https://forum.f-droid.org/u/hans"
---

The
[Janus vulnerability](https://www.guardsquare.com/en/blog/new-android-vulnerability-allows-attackers-modify-apps-without-affecting-their-signatures)
has sprung forth unto the Android world, and we have sprung into
action to keep it far away.

<p align="center">
  <img width="300" height="282" src="{% asset posts/2017-12-13-fdroid-and-janus/janus.png %}" />
</p>

First off, _f-droid.org_, _guardianproject.info/fdroid_ and
_apt.izzysoft.de/fdroid_ were scanned for possible Janus exploits and
none were found.  _f-droid.org_'s greatest protection against malware
is the requirement that everything must be built from source, humans
review all apps that are added, and a source tarball for each build is
stored forever.  Exploit writers do not want to give away the source
code to their malware nor have their activities permanently logged in
_git_, so this process keeps them away.  No malware has been found in
_f-droid.org_ in its 7 years of operation.

F-Droid is also an open ecosystem, that means many people are getting
apps from other sources.  For that reason, we are working to add Janus
detection to the F-Droid Android client app.  When an APK with a Janus
exploit is found, it will prompt the user to uninstall it in the
"Updates" tab.  If an APK with a Janus exploit is downloaded from a
repo that has allowed it in, it will be blocked from being installed.

There is also some random good news: it turns out that none of the
about 10 Janus examples we have can pass `fdroid update`.  Most of
them failed to verify when `fdroid update` calls `aapt dump badging`.
The one file that passed those tests was the publicly released
[Janus demo APK](https://www.androidpolice.com/wp-content/uploads/janus-poc/HelloWorld-Janus.apk).
But it had strange dates like `2042-14-03 00:62:15` in the ZIP
entries, probably because of the tricks needed to assemble this
DEX+ZIP file.  This triggered a crash in `fdroid update`, when parsing
the date of _AndroidManifest.xml_.  Python complains that there is no
14th month.  This crash prevents the APK from being added to the
repo. We have also added an
[explicit block](https://gitlab.com/fdroid/fdroidserver/merge_requests/409)
for APKs trying to exploit Janus.

Also, _apksigner_ is better at verifying APK signatures, and many
Janus examples failed.  If _apksigner_ is installed, then `fdroid
build` uses it.  If an APK is signed with a v2 APK Signature, then
things like Janus exploits are not possible.  So if you are working
with APKs that you have not built from source, be sure to install
_apksigner_.

So we can safely say that it would be difficult to inadvertently put a
Janus exploit in an F-Droid repo.  And with the new protections in the
Android client app, a repo cannot force the user to install one.
