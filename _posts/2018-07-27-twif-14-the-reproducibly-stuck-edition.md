---
layout: post
title: "TWIF 14: The Reproducibly Stuck Edition"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
---

This Week In F-Droid 14, Week 30, 2018

In this edition: Improved app descriptions in the repository, testers for beta 5 welcome, and reproducible builds still stuck.

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* [Izzy](https://forum.f-droid.org/u/izzy)'s updated app descriptions have been fully merged. You'll get to enjoy more details, and have better chances of telling what an app is about.

* Alpha 5 of the [F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/) app is out and should have lots of fixes and no regressions. If you're okay with running alpha software, please help test, and report any issues at the [bug tracker](https://gitlab.com/fdroid/fdroidclient/issues)!

* Although the bug that broke the publishing stage for all apps was fixed, Öffi and Briar frustratingly still didn't get published. And this while they got built _and_ verified. There seems to be some problem with the buildserver, to which only [CiaranG](https://ciarang.com) has full access, and this issue is blocked pending feedback from [CiaranG](https://ciarang.com).

#### Community News

No news this week. Please send your tips tagged with [#TWIF](https://mastodon.technology/tags/twif) to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg).

#### New apps

* [ToxCon 2018 Schedule](https://f-droid.org/packages/com.zoffcc.fahrplan.toxcon/): List of talks at ToxCon 2018
* [Pix-Art Messenger](https://f-droid.org/packages/de.pixart.messenger/): A Jabber/XMPP chat client and a fork of [Conversations](https://f-droid.org/packages/eu.siacs.conversations/)
* [Trireme for Deluge](https://f-droid.org/packages/org.deluge.trireme/): Thin client for the Deluge torrent daemon

#### Updated apps

In total, 40 apps were updated this week. Here are the highlights:

* [KeePass DX](https://f-droid.org/packages/com.kunzisoft.keepass.libre/), a secure multi-format password manager and a fork of [KeePassDroid](https://f-droid.org/packages/com.android.keepass/), updated from 2.5.0.0beta11-libre to 2.5.0.0beta15-libre. Fixes fingerprint recognition and includes many UX improvements, new icons, bug fixes, and memory optimization.

* [Anuto TD](https://f-droid.org/packages/ch.logixisland.anuto/) is yet Another Ugly Tower defense game for Android, featuring astonishing hand-drawn graphics and a smooth gameplay. Version 0.4 has balancing improvements, getting started instructions, and saves game state if Android terminates the application.

* [TV KILL](https://f-droid.org/packages/com.redirectapps.tvkill/) turns off supported TVs using your device's built-in IR-blaster. Version 1.3.1 has a new backend and widget fixes, improved progress dialog, more structured settings screen, and fixes a bug that causes the notification to appear for no reason.

* [Mysplash](https://f-droid.org/packages/com.wangdaye.mysplash/) is a lightweight client for the image website [Unsplash](https://unsplash.com). Version 3.3.7 was withdrawn because the author removed the API keys from the source, and the Unsplash service doesn't work without them. Auto update mode was disabled, so it looks like version 3.3.3 will be the latest version in F-Droid for a while.

* [Transportr](https://f-droid.org/packages/de.grobox.liberario/) has a 2.0.1 patch release out, using VVT instead of the IVB network and fixing the KVV network and several crashes.

* [VoIP.ms SMS](https://f-droid.org/packages/net.kourlas.voipms_sms/) allows you to send and receive SMS messages using your VoIP.ms account. Version 0.6.1-fdroid adds support for Android O notification features, uses transactions to prevent database corruption, and other improvements and bug fixes. Additionally, it now requires Android 5.0 or newer to run.

* [CrossWords](https://f-droid.org/packages/org.eehouse.android.xw4/) is a cross-platform game with the same rules as Scrabble, and was updated from 4.4.131 to 4.4.138. This update has a bunch of UX improvements, translation updates, and crash and bug fixes.

* [NewPipe](https://f-droid.org/packages/org.schabi.newpipe/), the lightweight YouTube frontent, was updated from 0.13.5 to 0.13.7 and can now undo delete of downloads, and has several UI improvements and bug fixes.

#### Removed Apps

* [Timber](https://f-droid.org/wiki/page/naman14.timber), a material design music player, was moved to the archive because the developer seems to have lost interest in F-Droid builds and no longer provides a FOSS build flavor. [Vanilla Music](https://f-droid.org/packages/ch.blinkenlights.android.vanilla/) may be an alternative.

#### In the next TWIF

There are way too many app updates to keep track of them all, so we need your help to highlight the important ones. And of course, if you're doing anything involving F-Droid in some way, we love to hear about it!

Send tips to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and remember to tag with [#TWIF](https://mastodon.technology/tags/twif). Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is Thursday 12:00 UTC.

**Oh, and if you want to increase the chances that your app is featured in TWIF, you should [keep a changelog](https://keepachangelog.com)!**

#### Feedback

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
