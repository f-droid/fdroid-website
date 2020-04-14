---
layout: post
title: "F-Droid supports APK Expansion Files aka OBB"
author: "eighthave"
authorWebsite: "https://forum.f-droid.org/u/hans"
---

Many games, mapping, and other apps require a large amount of data to
work.  The APK file of an Android app is limited to 100MB in size, yet
it is common for a single country map file to be well over 100MB.
Also, in order to get users running as quickly as possible, they
should not have to wait for huge amounts of data to download in order
to just start the app for the first time.

Google created OBB aka
"[APK Expansion](https://developer.android.com/google/play/expansion-files.html)"
files to provide a flexible means of delivering large amounts of data.
This arrangement also saves lots of bandwidth since the APK file and
the OBB file can be updated separately.  For example, a game's assets
do not need to change often, so they can be shipped as an OBB. Then
when the app itself is updated (i.e. the APK), it does not need to
include all those assets that are in the OBB file.

OBB files are used by lots of apps like games and MAPS.ME.  F-Droid
supports OBB by downloading and installing the OBB before the APK, so
that once the APK is installed, the OBB files are already in place and
ready to use.  F-Droid also provides an `Intent` method for apps to
fetch the OBB download URLs in case the app itself needs to handle the
OBB download/update.  That is similar to how it works in Google Play.

In order to use the OBB support, users need at least F-Droid v0.102, and the repo must use _fdroidserver_ v0.7.0 or newer.  Adding OBB files to a repo is very easy: just copy them to the same folder where the APKs go, i.e. _/path/to/fdroid/repo/_.

## Developer Usage

One of the details about using OBB files in apps is that OBB files are
not guaranteed to be installed by the app store.  That means the app
could start, and the expected OBB files will not be there.  In that
case, the app must download and install the OBB file itself.  Google
Play recommends using their proprietary
[Application Licensing](https://developer.android.com/google/play/licensing/index.html)
service for this, F-Droid provides a simple method that is all free
software.

To get the URL for the two possible OBB files, send an `Intent` to
F-Droid using these _Actions_:

* `org.fdroid.fdroid.action.GET_OBB_MAIN_URL`
* `org.fdroid.fdroid.action.GET_OBB_PATCH_URL`

Then download that URL using your favourite method, and make sure that
the file ultimately ends up in _Android/obb/[package.name]_ on the
device's External Storage.
