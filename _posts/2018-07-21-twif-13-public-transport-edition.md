---
layout: post
title: "TWIF 13: Public Transport Edition"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
---

This Week In F-Droid 13, Week 29, 2018

In this edition: Öffi released as open source, Transportr 2.0 released, better app descriptions and that annoying bug that causes updates to keep reappearing has been fixed in the latest alpha.

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* [_hc](https://forum.f-droid.org/u/hans) is polishing up fdroidserver for Ubuntu/bionic, but for the most part he has been at work deep in the client, closing about 40 issues. 1.3 is drawing closer, and is looking to be a nice stable release. That said, more than 200 [issues](https://gitlab.com/fdroid/fdroidclient/issues) still remain, so if you're familiar with Android development, your help is more than welcome.

* [Izzy](https://forum.f-droid.org/u/izzy) has [added](https://gitlab.com/fdroid/fdroidserver/merge_requests/529) (with the help of [_hc](https://forum.f-droid.org/u/hans)) the new [NoSourceSince antifeature](https://monitor.f-droid.org/anti-feature/NoSourceSince) which is automatically added to any app with `NoSourceSince:` in the metadata. In other words, it will be more obvious from within the client/website whether the source code of an app has disappeared. And yes, lots of apps have been updated in this regard, or the description has been updated to state "no longer maintained".

  The new antifeature is available in 1.3-alpha4 if you want to test it, and will be in 1.3 if you prefer to wait for the stable version.

* As already hinted at above, [Izzy](https://forum.f-droid.org/u/izzy) continued updating app descriptions this week. About every 5th app will have a more detailed description soon. Sometimes the links have been updated as well, e.g. as their source code or website has moved. The work is 80% completed, and more than 50% is already merged.

* [Relan](https://forum.f-droid.org/u/relan) did maintenance work on the repository metadata, and en passant added [VLC](https://f-droid.org/packages/org.videolan.vlc/) 3.0.11 just for fun. You can find VLC in the F-Droid archive for reasons [explained earlier](https://f-droid.org/2018/05/11/this-week-in-fdroid-w19.html#whats-happening-in-f-droid).

* [Bubu](https://forum.f-droid.org/u/Bubu) fixed the bug that prevented many icons from loading if the archive is enabled. The fix is in server code, so it should magically fix itself in the client when the fix goes live (soon) and a new index is built.

* Last-minute update: The [bug](https://gitlab.com/fdroid/fdroidclient/1271) that causes updates to keep reappearing has been fixed in 1.3-alpha4!

#### Community News

* [Öffi](https://offi.schildbach.de/) has been released as open source! We already mentioned the commotion around Öffi in the [previous TWIF](https://f-droid.org/2018/07/12/this-week-in-fdroid-w28.html#community-news), and not a day after it was published, the author released [the source code](https://gitlab.com/oeffi/oeffi) under the [GPLv3+](https://spdx.org/licenses/GPL-3.0-or-later.html) license. Furthermore, Öffi was submitted to F-Droid immediately. If you understand German you can get more background [here](https://www.golem.de/news/app-fuer-oeffentlichen-nahverkehr-oeffi-ist-open-source-geworden-1807-135517.html).

  The author also did an excellent job by making the build [reproducible](https://reproducible-builds.org). Unfortunately this ended up backfiring, as F-Droid currently has a bug preventing reproducible builds from being published. As a result, Öffi has not made it to the main repository yet. The good news is that you can add the author's custom repository to your F-Droid client from the [download](https://offi.schildbach.de/download.html) page, or download the aosp variant of the APK directly. Once we get this bug squashed, you will be able to seamlessly transition to updating from the main repository, thanks to the magic of reproducible builds.

  This all happened right on the heels of the new [Transportr](https://f-droid.org/packages/de.grobox.liberario/) 2.0 release, of which more below. You now have the choice of _two_ amazing open source public transport apps!

#### New apps

* [Reader for Selfoss](https://f-droid.org/packages/apps.amine.bou.readerforselfoss/): RSS reader for Selfoss
* [Peace of Mind+](https://f-droid.org/packages/ca.mudar.fairphone.peaceofmind/): A flight-mode timer
* [PilferShush Jammer](https://f-droid.org/packages/cityfreqs.com.pilfershushjammer/): Block unwanted use of onboard microphone
* [Weather Radar](https://f-droid.org/packages/com.danhasting.radar/): An application featuring customizable, real-time doppler radar images
* [Taswast](https://f-droid.org/packages/com.github.aba2l.taswast/): Amazigh Calendar
* [Text Fiction](https://f-droid.org/packages/de.onyxbits.textfiction/): Interactive fiction interpreter
* [AmbitSync](https://f-droid.org/packages/idv.markkuo.ambitsync/): Read Suunto Ambit watches and convert to GPX
* [DreamDroid](https://f-droid.org/packages/net.reichholf.dreamdroid/): Control Dreambox satellite receivers
* [Gloomy Dungeons 3D - Hardcore](https://f-droid.org/packages/org.zamedev.gloomydungeons1hardcore.opensource/): First-person shooter
* [LayTray](https://f-droid.org/packages/space.neothefox.laytray/): Layout indicator for Blackberry phones
* [PluckLockEx](https://f-droid.org/packages/xyz.iridiumion.plucklockex/): Lock your phone when snatched
* [Gloomy Dungeons](https://f-droid.org/packages/zame.GloomyDungeons.opensource.game/): First-person shooter

#### Updated apps

In total, 75 apps were updated this week. Here are the highlights:

* [Transportr](https://f-droid.org/packages/de.grobox.liberario/) released its new major version 2.0.0, featuring a completely overhauled user interface with more focus on the map. The shiny new map has a more prominent place, current location is used by default, trip overview shows a warning icon if there's a problem and many more features and enhancements. It also needs less permissions than before -- no more external storage.

* [Delta Chat](https://f-droid.org/packages/com.b44t.messenger/) is an instant messenger using e-mail as its medium. 0.19.0 has a performance speedup by making database locks unnecessary, lots of translation updates, and drafts no longer appear twice.

* [twitlatte](https://f-droid.org/packages/com.github.moko256.twitlatte/) was updated from 1.3.0 to 1.4.1. It is now possible to rotate the screen while watching video. Privacy settings and content warnings were added for Mastodon.

* [Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/) 2.2 fixes some annoying bugs and crashes, and improves the Dutch translations.

* [Nextcloud Talk](https://f-droid.org/packages/com.nextcloud.talk2/) 2.1.2 is out with user experience improvements, configurable ringtones, emoji support, improved proximity sensor handling, and more.

* [Doda The Exploda](https://f-droid.org/packages/com.quaap.dodatheexploda/) released 0.3. Doda is a simple "hidden objects" or "I spy" game. It has levels appropriate for babies, children, and adults. This release includes a major rewrite to make it faster, especially on Android 8.0+ (Oreo).

* [LaunchTime](https://f-droid.org/packages/com.quaap.launchtime/) updated from 0.7.6 to 0.8.1 and brings lots of changes. Menu now autohides, improved menu appearance, animated transitions, and much more including bug fixes.

* [Periodical](https://f-droid.org/packages/de.arnowelzel.android.periodical/) is a menstrual/period calendar which calculates the days of fertility according to Knaus-Ogino. Version 1.11 brings a redesign with navigation drawer and adds back the simple list view with cycle lengths.

* [Micropinner](https://f-droid.org/packages/de.dotwee.micropinner/) (appears as **New Pin** in the repository due to bugs) was updated to v2.2.0. Many changes, among others using the internal DayNight-Theme changer, support for Notification Channels, code cleanup and refactoring and fixes for Android 8 (Oreo).

* [M.A.L.P.](https://f-droid.org/packages/org.gateshipone.malp/) is a remote music player for [MPD](http://www.musicpd.org), and was updated from 1.1.17 to 1.2.0. This change adds _highly experimental_ support for inline artwork, and fixes a bug downloading covers.

* [Easer](https://f-droid.org/packages/ryey.easer/) was updated from 0.6.7 to 0.6.7.2, adding localized names for Dynamics, making events "repeatable" by default, a function to manually trigger any Profile, and many bug fixes.

#### Removed Apps

* **TSCH_BYL** (com.drhoffmannsoftware) was completely [removed](https://gitlab.com/fdroid/fdroiddata/merge_requests/3429) from the repository, as it was a [duplicate](https://gitlab.com/fdroid/fdroiddata/issues/1264) of [TSCH_BYL](https://f-droid.org/packages/de.drhoffmannsoftware/) (de.drhoffmannsoftware). If you happen to have this installed and think you might need future updates (there aren't any as of yet), you should check which one is installed, and switch if necessary.
* [Asura](https://f-droid.org/wiki/page/de.nico.asura) and [HW-Manager](https://f-droid.org/wiki/page/de.nico.ha_manager) were moved to the archive because these apps are [no longer maintained](https://gitlab.com/fdroid/fdroiddata/merge_requests/3452).
* The CyanogenMod [Changelog](https://f-droid.org/wiki/page/org.polaric.cyanogenmodchangelog) viewer was moved to the archive, as its source code has disappeared, and CyanogenMod is long history.

#### In the next TWIF

There are way too many app updates to keep track of them all, so we need your help to highlight the important ones. And of course, if you're doing anything involving F-Droid in some way, we love to hear about it!

Send tips to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and remember to tag with [#TWIF](https://mastodon.technology/tags/twif). Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is Thursday 12:00 UTC.

**Oh, and if you want to increase the chances that your app is featured in TWIF, you should [keep a changelog](https://keepachangelog.com)!**

#### Feedback

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
