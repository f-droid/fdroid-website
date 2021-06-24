---
layout: post
title: "This Week in F-Droid, Week 18"
author: "Coffee"
authorWebsite: "https://forum.f-droid.org/u/coffee"
---

Hi everyone! You have been telling us you liked the first [#twif](https://mastodon.technology/tags/twif), so have another! 

[F-Droid](https://f-droid.org/) is an installable [catalogue](https://f-droid.org/packages/) of [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) (Free and Open Source Software) applications for the Android platform. The [client](https://f-droid.org/packages/org.fdroid.fdroid/) makes it easy to browse, install, and keep track of updates on your device. This post lists notable things that happened in and around F-Droid this past week.

#### What's happening in F-Droid

* F-Droid client v1.3-alpha0 is available. It has the new wifi/data preferences, which was one of the priorities of the [Viento](https://guardianproject.info/wind/) funding: making F-Droid work better on cheap devices, low/expensive bandwidth, and small storage.

  As mentioned in the [previous TWIF](https://f-droid.org/en/2018/04/27/this-week-in-fdroid.html), V1.3 no longer supports Android 2.3.3 or 3.x. Android 4.0 is the minimum. That freed us to update tons of things, and ditch our own custom forks.

* [Bubu](https://forum.f-droid.org/u/Bubu) did some work on bringing the [Rocket.Chat](https://rocket.chat) [app](https://github.com/RocketChat/Rocket.Chat.Android) to F-Droid. The FOSS flavour is currently pending upstream review. It lacks push notifications, but otherwise works fine.

* Search page styling broke last Wednesday and got fixed again on Thursday.

* The "error getting index file" and the Arabic titles bugs got fixed. You can switch back to the new index format if you were using the old one as a workaround.

* Well, kind of. As it turns out, switching between old and new index formats uncovered another bug, in which one index was generated in the wrong time zone. That, combined with the index downgrade protection, means F-Droid will refuse to update and give an "index.jar older than current index" error.

  This was fixed last week for f-droid.org, but it affects all 3rd-party repositories as well. We'll try to get an fdroidserver bugfix release out soon, but meanwhile fdroidserver@master is fixed and will fix your repository index.

* We're at almost 1900 followers on [Mastodon](https://mastodon.technology/@fdroidorg)!

* Thanks to everyone who suggested apps to highlight. It's been very helpful! Unfortunately a few suggestions couldn't be processed because the apps in question weren't updated this week. Better luck next time!

#### Community News
* [Briar](https://briarproject.org/) is moving out of beta, and put out a release candidate for version 1.0. Briar is a messaging app designed for activists, journalists, and anyone else who needs a safe, easy and robust way to communicate. It can operate over WiFi and bluetooth, even during an internet blackout. It has integrated Tor support, private chats, forums, blogs and more to come like crisis mapping and collaborative document editing.

  Briar is not yet in the F-Droid main repository because we're stuck on [reproducible build issues](https://code.briarproject.org/akwizgran/briar/issues/164). If you want to try it right now, you can [add the Briar repository to your F-Droid](https://briarproject.org/fdroid.html).

* We were mentioned in a BuzzFeed article on [how apps sell your data](https://www.buzzfeed.com/nicolenguyen/how-apps-take-your-data-and-sell-it-without-you-even). _"[...] Kwet also suggests Android users try the F-Droid App Store, because it offers apps without tracking and has a strict auditing process."_

#### New apps

* [Mattermost Classic](https://f-droid.org/packages/com.mattermost.mattermost/): Secure workplace messaging.
* [WireGuard](https://f-droid.org/packages/com.wireguard.android/): Next generation secure VPN network tunnel.
* [ReoTwé](https://f-droid.org/packages/de.digisocken.reotwe/): Minimalistic low-level microblogging client for twitter.
* [Open Map](https://f-droid.org/packages/org.osmdroid/): Map viewer using OpenStreetMap tiles. osmdroid is a (almost) full/free replacement for Android's MapView (v1 API) class. This is the included demo app.
* Alpha release of [ObscuraCam](https://f-droid.org/packages/org.witness.sscphase1/). With ObscuraCam you can blur and disguise faces in your photos and videos.
* [Seguime](https://f-droid.org/packages/pc.javier.seguime/): Follow where your device goes without being followed by you.

#### Updated apps

In total, a whopping 59 apps were updated! Here are the highlights:

* **Please update [Conversations](https://f-droid.org/packages/eu.siacs.conversations/) ASAP!** A critical security issue was fixed in 2.1.4.

  Conversations Legacy and Conversations prior to 2.0.0 are not affected.

* [Altcoin Prices](https://f-droid.org/packages/eu.uwot.fabio.altcoinprices/) was updated from 1.4.17 to 1.5.2, with a redesigned user interface and bug fixes.

* [DAVdroid](https://f-droid.org/packages/at.bitfire.davdroid/) 1.11.1 fixes a memory leak which had caused contact sync problems + some minor improvements.

* The new release of [Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/) (1.8.8) is available on F-Droid. This update improves the detection of utm parameters and fixes the upload issue when editing the profile.

* [PySolFC](https://f-droid.org/packages/org.lufebe16.pysolfc/) was updated from 0.8 to 2.2.0. Development of the Python sources has recently resumed (after an 8-year hyatus) using a [GitHub project](https://github.com/shlomif/PySolFC) and other resources. This new release adds compatibility with Python version 3.x and some other improvements.

* [MTG Familiar](https://f-droid.org/packages/com.gelakinetic.mtgfam/) was updated from 3.4.6 to 3.5.0, now with [legality checks for decks](https://github.com/AEFeinstein/mtg-familiar/issues/206), [search by watermark](https://github.com/AEFeinstein/mtg-familiar/issues/306), [Pauper](https://github.com/AEFeinstein/mtg-familiar/issues/366), [Energy on the mana pool page](https://github.com/AEFeinstein/mtg-familiar/issues/367), several code rewrites under the hood, as well as the usual slew of bug fixes.

* [Nextcloud dev](https://f-droid.org/packages/com.nextcloud.android.beta/) was updated to 20180427, fixing an annoying issue where the app crashed upon every autoupload.

* [Riot.im](https://f-droid.org/packages/im.vector.alpha/). As of 0.8.7 analytics are disabled by default, so no more antifeature! This only affects new installs, however. If you want to opt out of analytics in your already installed app, you can disable it in settings. Other highlights include **read-only** sticker support, and making notifications swipeable again.

  Oh, and if you want Riot to not die in the background, you need to disable battery optimization for it, and enable background sync in settings. Note that if you don't disable battery optimization, background sync will turn itself off again!

* [Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/) was updated from 1.6.1 to 1.7.0, with support for custom toot size limit of some instances, new translations and updates, and bug fixes. To copy the content of a toot to the clipboard you now need to long press it.

* [WaveUp](https://f-droid.org/packages/com.jarsilio.android.waveup/) 2.0.0 now includes a foreground service (with an obligatory notification that you can hide) to prevent it from being killed by the system on Android 8 (Oreo).

* [AFWall+](https://f-droid.org/packages/dev.ukanth.ufirewall/) was updated from 2.9.8 to 2.9.9
* [Gadgetbridge](https://f-droid.org/packages/nodomain.freeyourgadget.gadgetbridge/) was updated from 0.26.1 to 0.26.2
* [Markor](https://f-droid.org/packages/net.gsantner.markor/) was updated from 0.3.5 to 0.3.6
* [Tasks](https://f-droid.org/packages/org.tasks/) was updated from 5.3.6 to 6.0.5
* [The Light](https://f-droid.org/packages/org.hlwd.bible/) was updated from 2.13 to 3.0

#### Archived apps

No apps were moved to the archive this week.

#### In the next TWIF

We'll obviously have more news from the F-Droid core team, but we also want to include news from the wider ecosystem, so if you are working on something F-Droid related, like to talk about your app that's getting updated or newly included in F-Droid, or have some news related to F-Droid, get in touch!

Please post submissions to the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum or mention [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and tag [#fdroid](https://mastodon.technology/tags/fdroid) in your toot.

Feedback? Come talk to us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together. You can also join us on the [forum](https://forum.f-droid.org/), [toot on Mastodon](https://mastodon.technology/@fdroidorg), or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).

