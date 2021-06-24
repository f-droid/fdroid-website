---
layout: post
title: "TWIF 15: Announcing F-Droid 1.3"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
---

This Week In F-Droid 15, Week 31, 2018

In this edition: Releasing F-Droid 1.3, building Briar reproducibly and F-Droid shirts now available.

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* Version 1.3 of the **F-Droid** app has been released! [@_hc](https://forum.f-droid.org/u/hans) has done a large code overhaul to make status updates more reliable. This release also fixes many bugs around the wrong button showing. More details [here](https://gitlab.com/fdroid/fdroidclient/blob/master/metadata/en-US/changelogs/1003050.txt).

  Focus is now shifting towards improved offline support, including swapping with SD cards and USB-OTG devices.

* A large-scale spam attack against [Freenode](https://freenode.net) has been in progress for several days now. The upshot of this is that we've had to tighten up security. If you want to participate in our rooms, you will either need to [register your nickname with Freenode](https://freenode.net/kb/answer/registration), or join via Matrix. The room is #fdroid on [Freenode](https://freenode.net) or [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) on [Matrix](https://matrix.org). If you're a Telegram user, the room can also be reached via [this link](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA).

#### Community News

* Do you remember how in [TWIF Week 28](https://f-droid.org/2018/07/12/this-week-in-fdroid-w28.html) we vaguely hinted at the possibility of F-Droid **T-shirts**? As it happens, the designs are finished, and we can now announce that [HELLOTUX](https://www.hellotux.com/) is shipping some [nice F-Droid wear](https://www.hellotux.com/f-droid). Of every item sold, €3 will be donated to F-Droid.

* [@Grote](https://blog.grobox.de) [writes](https://blog.grobox.de/2018/building-briar-reproducible-and-why-it-matters/) about the process of building [Briar](https://briarproject.org) reproducibly, and why that is important.

#### New apps

* [Fake Traveler](https://f-droid.org/packages/cl.coders.faketraveler/): Fake your location
* Three new language packs for [AnySoftKeyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/): [Indonesian](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.indonesian/), [Polish](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.osspolish/) and [Turkish](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.ossturkish/).
* [EDS Lite](https://f-droid.org/packages/com.sovworks.edslite/): Virtual disk encryption
* [dandelior\*](https://f-droid.org/packages/net.gsantner.dandelior/) is a rebranded version of [dandelion\*](https://f-droid.org/packages/com.github.dfa.diaspora_android/), a client for the community-run, distributed social network diaspora\*. dandelior\* is based 100% on the same code and resources as dandelion\*, but has a different look. By installing both dandelion\* and dandelior\*, you can use two accounts at the same time on one device. More information in the project's [release announcement](https://gsantner.net/blog/project/2018/07/30/dandelior-released.html).
* [Web2PDF](https://f-droid.org/packages/org.dyndns.warenix.web2pdf/): "_No description, website, or topics provided._" --GitHub

#### Updated apps

In total, 42 apps were updated this week. Here are the highlights:

* [Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/), the Mastodon client, released version 2.3 adding an Italian translation and other translation updates, improved memory usage when uploading images, and other small improvements and fixes.
* [Transportr](https://f-droid.org/packages/de.grobox.liberario/) 2.0.2 adds data sources for Hungary and Poland, fixes Finland, improves location auto-completion and fixes several crashes. 
* [DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android/) was updated from 5.7.2 to 5.7.5, bringing improved visuals of the onboarding screens and fixing a crash.
* [μMath+](https://f-droid.org/packages/com.mkulesh.micromath.plus/) is the world's first scientific graphing calculator and function plotter on Android oriented around a worksheet. Version 2.17.2 implements SI units of information, logarithmic scale for function plots, expanded image settings, and now has an [adaptive icon](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive) for Android 8+.
* [Gallery](https://f-droid.org/packages/com.simplemobiletools.gallery/), a photo and video viewer, was updated from 4.3.5 to 4.4.1. This update brings a reworked editor, allows hiding the recycling bin, hides both Play and Pause video buttons after 2 secs, improves Immersive mode fullscreen behaviour, and comes with several other UX and stability improvements.
* [Ring](https://f-droid.org/packages/cx.ring/) is a peer-to-peer messenger capable of voice and video calling. In this update from 20180501 to 20180712 push notifications, handling of failed messages, connectivity, IPv6 support, Android TV support, contact management, and performance were improved. You can now send GIFs and images using your keyboard. Support for HD 720p for Android TV was added, as was the possibility to share text and media from other apps. It also has plenty of bug fixes.
* [Xearth](https://f-droid.org/packages/de.drhoffmannsoftware.xearth/), a live wallpaper of the Earth, is updating again after a hiatus of nearly 3 years. Unfortunately, the author performed the ill-advised action of setting the version code back, from 2015100901 to 22 to be precise. To update, you may have to uninstall the app first, or install the update via adb. If you have beta updates enabled in the F-Droid app, you'll need to pick version 1.2-22 from the version list manually.
* [DAVDroid](https://f-droid.org/packages/at.bitfire.davdroid/) version 2.0 got released. DAVDroid is the main way users sync Nextcloud calendar and contacts to their Android phone. Version 2.0 comes with a huge performance increase, multi-threaded/parallel processing of resources, better scalability (less memory, battery and network time consumption) and UI improvements! Full release notes can be found [here](https://forums.bitfire.at/post/10071).

#### Removed Apps

* [Acastus](https://f-droid.org/wiki/page/me.dbarnett.acastus) was moved to the archive because [the service it relies on has shut down](https://gitlab.com/fdroid/fdroiddata/issues/1274).

#### In the next TWIF

There are way too many app updates to keep track of them all, so we need your help to highlight the important ones. And of course, if you're doing anything involving F-Droid in some way, we love to hear about it!

Send tips to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and remember to tag with [#TWIF](https://mastodon.technology/tags/twif). Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is Thursday 12:00 UTC.

Hey! You know what would be a good idea? [Keeping a changelog](https://keepachangelog.com)! If there's anything interesting in there, you might even see it featured in the next edition!

#### Feedback

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
