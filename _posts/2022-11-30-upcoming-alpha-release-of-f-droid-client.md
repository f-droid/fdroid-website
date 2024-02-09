---
author: "F-Droid"
title: Upcoming alpha release of F-Droid Client
layout: post
---

At long last, the first alpha of the [big]({% post_url 2022-02-05-decentralizing-distribution %}) [overhaul]({% post_url 2022-09-20-slowly-getting-faster %}) of the official F-Droid client app for Android is about to be released.  This round of work was focused on modernizing some of the oldest code in the client: the downloading, index parsing, and database layer.  This code is now structured as standalone libraries so that other projects can benefit from using it as well.  This changes a huge amount of code, and we have already confirmed it fixes many bugs and improves a wide range of functionality.  There will be more on that here as it is finalized.

This also means that there will be breakage, so this alpha will probably be more unstable than previous alphas have been over the years.  We always appreciate testing, feedback, issues, and crash reports.  But if your F-Droid is customized in a way you would rather not reset, then you might want to sit this alpha testing round out.  If you have a spare device, test device, or work with Android emulators, we also are happy to have testing on our [nightly builds](https://gitlab.com/fdroid/fdroidclient-nightly).  Be aware: the nightly builds come from GitLab CI/CD, so not as secure a release process as the official releases.  It is possible to have both official and nightly installed at the same time.  The easiest way to get started with the nightly builds is to add the [repo](https://fdroid.gitlab.io/fdroidclient-nightly/fdroid/repo/?fingerprint=659E1FD284549F70D13FB02C620100E27EEEA3420558CCE62B0F5D4CF2B77D84) to an existing F-Droid install, then search for "Nightly", then choose "F-Droid Debug".

_This work was funded by the [FFDW-DVD grant]({% post_url 2022-02-05-decentralizing-distribution %})_
