---
layout: post
title: "This Week in F-Droid, Week 25"
author: "Bubu"
authorWebsite: "https://forum.f-droid.org/u/Bubu"
---

This week hastily compiled by Bubu. I probably missed things.

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* [Torsten](https://gitlab.com/grote) has been further involved in fixing reproducible builds for Android. He opened an [issue](https://issuetracker.google.com/issues/110237303) with Google about the non reproducible ressources.arsc file. The issue apparently now got assigned to somebody and Google bumped the priority and added it to some internal hotlists. There is also a thread about this on the reproducible builds [mailing list](https://lists.reproducible-builds.org/pipermail/rb-general/2018-June/001027.html).

#### Community News

* Long time contributor of liberated app forks [thermatk](https://github.com/thermatk) has been hard at work to provide a source-built version of the Chromium browser. The project is aptly called [Unobtanium](https://gitlab.com/thermatk/Unobtainium). It's been quite a ride but apparently the project is finished apart from a few final touches it's all done! This is still pending inclusion into F-Droid but apart from Chromium this will allow having a webview component built and updated by F-Droid! Contributors to this project welcome!

#### New apps

* [Keyboard Switcher](https://f-droid.org/packages/com.kunzisoft.keyboard.switcher/) by Kunzisoft: Simple keyboard switcher with a floating button
* [p≡p](https://f-droid.org/packages/security.pEp/): Read and write encrypted e-mails, more info [here](https://pep.foundation/index.html)
* [PSLab](https://f-droid.org/packages/org.fossasia.pslab/): Pocket Science Lab Android interface for PSLab hardware
* [Aurora Store](https://f-droid.org/packages/com.dragons.aurora/) by Rahul Patel: Download apks from Google Play Store, Aurora Store provides a Material UI to [Yalp Store](https://f-droid.org/packages/com.github.yeriomin.yalpstore/). It's been called a better interface to the play store than the play store. :-)
* [PaperCraft](https://f-droid.org/packages/pro.rudloff.papercraft/): A Material Design inspired space shooter

#### Updated apps

As usual more updates than we can list here, some highlights include:

* Huge [DeltaChat](https://f-droid.org/packages/com.b44t.messenger/) update to [v0.18.0](https://github.com/deltachat/deltachat-android/blob/HEAD/CHANGELOG.md#delta-chat-changelog)
* [Telegram-FOSS](https://f-droid.org/packages/org.telegram.messenger/) **security** [update](https://github.com/Telegram-FOSS-Team/Telegram-FOSS/blob/master/Changelog.md) due to lots of ffmpeg vulnerabilities.
* The [Déjá Vu](https://f-droid.org/packages/org.fitchfamily.android.dejavu/) Location Service has been updated to v1.1.7, fixing a rare crash.
* [Kontalk](https://f-droid.org/packages/org.kontalk/) got updated to [v4.1.5](https://github.com/kontalk/androidclient/blob/HEAD/CHANGELOG.md) with major performance improvements and some crash and other fixes.


#### In the next TWIF

Expect your usual TWIF author, [Coffee](https://forum.f-droid.org/u/Coffee) to be back next week.

As usual, please report interesting updates. There are way too many app updates to keep track of them all, so we need your help to highlight the most interesting changes. And of course, we love to hear about all things involving F-Droid in some way.

Please tell us in the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum, or tag your update [#fdroid](https://mastodon.technology/tags/fdroid) on Mastodon. (And cc [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) to make sure it reaches our instance.) The deadline to the next TWIF is Thursday 28 June 2018, 12:00 UTC.

Feedback? Come talk to us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together. You can also join us on the [forum](https://forum.f-droid.org/), toot at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon, or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).
