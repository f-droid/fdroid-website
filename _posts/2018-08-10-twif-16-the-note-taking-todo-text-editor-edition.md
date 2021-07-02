---
layout: post
title: "TWIF 16: The note-taking todo text editor edition"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
---

This Week In F-Droid 16, Week 32, 2018

In this edition: Fixing nearby swap, download link broken and fixed again, a flaky build cycle, 3000 [Mastodon](https://mastodon.technology/@fdroidorg) followers, and Tutanota and Rocket Chat coming soon.
<!--more-->

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* If you hadn't noticed yet, version 1.3 broke the "nearby swap" feature. [@\_hc](https://forum.f-droid.org/u/hans) did a big overhaul of the HTTP plumbing of "nearby swap" this week, and queued up a **1.3.1 release** with this fix. The release also adds support for TLSv1.3. It has already been built, and _should_ be out with the next index update. (**Edit:** It's out now!)

* Right now work is ongoing to put [USB OTG](https://en.wikipedia.org/wiki/USB_On-The-Go) and [SD card](https://en.wikipedia.org/wiki/Secure_Digital) support into F-Droid, hopefully in time for the [Mozilla WINS competition](https://wirelesschallenge.mozilla.org) presentation, which will be on the 14th of August.

* You have all been _very_ good at reporting that the F-Droid app download link was broken this week. ;) Due an archive policy mistake, the build that the website linked to was accidentally moved to the archive. This has been fixed. Thanks to everyone who reported it.

* [@Izzy](https://forum.f-droid.org/u/izzy) and [@licaon-kter](https://forum.f-droid.org/u/Licaon_Kter) have done a ton of work in triaging, testing and merging new apps, with over 500 GitLab notifications just from them.

* Although we had two index updates this week to fix the broken F-Droid link, they contained no new builds. An update just now did, though. Cause, as of yet, unknown. All in all, the build cycle has not been running as well as we'd like.

* The website build process also appears to be broken, meaning the website cannot be updated right now. If you are reading this, this has obviously been fixed.

* We passed 3000 followers on [Mastodon](https://mastodon.technology/@fdroidorg) last Tuesday! Although we don't officially track anything, the number seems to be growing steadily and organically. Hard to tell if this is more due to new people joining Mastodon, or existing users finding out about us. I hope it's a healthy mix of both.

#### Community News

* **[Tutanota](https://tutanota.com)**, an encrypted e-mail service, worked with us to [get their Android app included in F-Droid](https://tutanota.com/blog/posts/release-notes-3-35). It has already been merged, and we hope to be able to announce its actual arrival soon.

* [@Bubu](https://chaos.social/@Bubu) reports that **[Rocket.Chat](https://github.com/RocketChat/Rocket.Chat.Android)** has merged his FOSS build flavour, meaning there's a good chance the next version will be in F-Droid. He also said that working with them has been a very positive experience, with them even taking it over the finish line themselves.

#### New apps

* [open-event-android](https://f-droid.org/packages/com.eventyay.attendee/): Events app to checkout nearby events
* [eventyay organizer](https://f-droid.org/packages/com.eventyay.organizer/): Event management app for Organizers using eventyay platform
* [log28](https://f-droid.org/packages/com.log28/): A simple no-frills period tracker
* [Ellaism](https://f-droid.org/packages/com.outdoordevs.ellaism.wallet/): Ellaism Mobile Wallet
* [Carnet](https://f-droid.org/packages/com.spisoft.quicknote/): Powerful note taking app with sync capabilities
* [BwareArea](https://f-droid.org/packages/fr.byped.bwarearea/): An offline GPS based POI alerter with overlay
* [Stethox](https://f-droid.org/packages/org.schabi.stethox/): Xposed module that adds Stetho to every app
* [DNS Hero](https://f-droid.org/packages/com.gianlu.dnshero/): Inspect DNS zones like a superhero
* [MetalabDoorWidget](https://f-droid.org/packages/com.zoffcc.applications.metalab_open_widget/): Show the Door status of Metalab Vienna
* [Music](https://f-droid.org/packages/com.maxfour.music/): Lightweight and Material Music Player based on Phonograph
* [MyMusicQoE](https://f-droid.org/packages/pt.ipleiria.mymusicqoe/): A fork of ultrasonic with QoE evaluation features purposes
* [PasteBin](https://f-droid.org/packages/com.anoopknr.pastebin/): Client application for Ubuntu pastebin
* [Rosary](https://f-droid.org/packages/org.example.rosary/): A very simple app helping Christian users to pray the Rosary.
* [Sun Time](https://f-droid.org/packages/com.gitlab.kreikenbaum.suntime.fdroid/): Align your biorhythm with the sun
* [Weather Widget](https://f-droid.org/packages/nl.implode.weer/): Add widget to home screen with weather 5 to 7 day weather forecast

(Thanks to [@licaon-kter](https://forum.f-droid.org/u/Licaon_Kter) for incorporating things from the last minute index update here!)

#### Updated apps

In total, 43 apps were updated this week. Here are the highlights:

* [uNote](https://f-droid.org/packages/app.varlorg.unote/) is a lightweight minimalistic note taking app. 1.5.0 fixes the search and other annoying bugs.

* [TEdit](https://f-droid.org/packages/com.atr.tedit/) is a simple text editor complete with graphical file browser and multiple file support. 2.1.3 fixes an issue opening files in TEdit from an external application.

* [Lyrically](https://f-droid.org/packages/com.shkmishra.lyrically/) can show lyrics overlaid on any app. Version 0.54 adds a color picker for various UI elements, force re-fetch of lyrics, and an option to disable checking for updates.

* [Contacts](https://f-droid.org/packages/com.simplemobiletools.contacts/) is a simple app for creating and managing your contacts from any source. This update from 4.1.0 to 4.2.1 adds a Recent Calls tab, customizing which tabs are visible, optional call confirmation dialog, and several other UI, stability and performance improvements.

* [Termux](https://f-droid.org/packages/com.termux/) 0.65 comes with a new [adaptive icon](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive) for Android 8+, and supports combining the function key with arrow keys on at least the Gemini PDA.

* [Waistline](https://f-droid.org/packages/com.waist.line/) had a major update, going from 1.0.2 to 2.1.0! This food diary and calorie tracker basically had a complete rewrite, with [too many changes to list](https://github.com/davidhealey/waistline/releases).

* [Pix-Art Messenger](https://f-droid.org/packages/de.pixart.messenger/), the [other](https://f-droid.org/packages/eu.siacs.conversations/) XMPP chat client, came out of beta with 2.1.0, adding a ton of improvements. Of note are improved group chat and the ability to upload a group chat avatar to compatible servers, an Expert Setting to enable direct search, Paste as Quote, and several other UI improvements and bug fixes.

* [Simpletask](https://f-droid.org/packages/nl.mpcjanssen.simpletask/), a comprehensive todo list manager based on [GTD](https://en.wikipedia.org/wiki/Getting_Things_Done) and the [todo.txt](http://todotxt.com) format, had a sizeable update in 10.2.0. Highlighting the most important ones, UI updates and events were refactored to improve performance, and saved filters are now stored in preferences, which should fix most issues with them. Some other improvements are related to Nextcloud, and don't apply to this Cloudless version in F-Droid.

* [Trireme for Deluge](https://f-droid.org/packages/org.deluge.trireme/), a frontend for the Deluge torrent daemon, released 0.9, allowing torrents to be added by torrent file, adding support for magnet links and torrent urls from browser, showing seeding and completed time, and more.

* [Movie DB](https://f-droid.org/packages/org.notabug.lifeuser.moviedb/), an online/offline movie database, saw its 2.1.0 release, containing mostly bug fixes and UI improvements. New features are persistent filtering, showing the release date, recommended instead of similar movies, and the ability to fetch online movie data in a different langage than the default.

* [Loyalty Card Keychain](https://f-droid.org/packages/protect.card_locker/), a manager for barcode-based store/loyalty cards, released 0.24, adding a setting to control screen brightness when displaying a barcode, and new Greek and Slovenian translations.

* [Meditation Assistant](https://f-droid.org/packages/sh.ftp.rocketninelabs.meditationassistant.opensource/) was updated from 1.4.7 to 1.5.0, splitting full screen preference into three options, obeying volume preference, and removing the "turn screen off" feature as it requires administrator privileges. **Important**: Several people have reported an instant crash on opening with 1.5.0. This is fixed in 1.5.1, which should be in F-Droid soon if not already by the time you read this.

* [Telegram](https://f-droid.org/packages/org.telegram.messenger/) was updated from 4.6.0 to 4.9.0 as a new source code drop came. It includes Telegram Passport, (open source versions for) suggested locations and search, location sharing fixes, https for map tiles and of course everything from Telegram 4.7 and 4.8.

#### In the next TWIF

Hey there, developers! Do you know what would be a good thing to do for your project? [Keep a changelog](https://keepachangelog.com)! It lets humans quickly understand what's changed in your software. If there's anything of note in there, you might even see it featured in the next TWIF!

As great as changelogs are, don't forget to send in your tips! There are way too many app updates to keep track of them all, and we'd love your help in highlighting the important ones. And of course, if you're doing anything involving F-Droid in any way, tell us about it!

Send tips to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and remember to tag with [#TWIF](https://mastodon.technology/tags/twif). Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is Thursday 12:00 UTC.

#### Feedback

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
