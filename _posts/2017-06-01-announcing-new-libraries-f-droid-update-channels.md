---
layout: post
title: "Announcing new libraries: F-Droid Update Channels"
author: "eighthave"

---

In order to complete the F-Droid distribution ecosystem, we are
introducing
[__F-Droid Update Channels__](https://gitlab.com/fdroid/update-channels).
It is a suite of libraries for apps to find updates, no matter from
where it was originally downloaded.  In many parts of the world, it is
very common to get Android APKs outside of the app stores where the
developers upload them.

* third party app stores scrape other app stores for APKs
* APKs are bluetoothed, directly, downloaded, etc
* users share APKs via services like Aptoide

In order to ensure that your app always can find updates, we are
introducing two specific libraries:


### "Get F-droid" aka [org.fdroid.getfdroid](https://gitlab.com/fdroid/update-channels/tree/master/getfdroid#f-droid-installer)

Checks whether F-Droid is installed.  If not, it will help the user to
download and install F-Droid in a secure way.  F-Droid then provides
the update channel for all apps available in F-Droid.


### "App Updater" aka [org.fdroid.appupdater](https://gitlab.com/fdroid/update-channels/tree/master/appupdater#f-droid-update-detector)

Keeps the app current by checking the hard-coded app repository set up
by the developer.  This is similar to the popular "App Updater"
library, but handles everything securely using F-Droid signed
metadata.  The _fdroidserver_ tools handle the creation and
maintenance of the app repository.


#### Compatible with Google Play Terms of Service

Both of these libraries also check whether Google Play is installed,
if so, will disable itself.  This allows apps to include this library
in APKs that are uploaded to Google Play since it will not violate the
Google Play Terms of Service.
