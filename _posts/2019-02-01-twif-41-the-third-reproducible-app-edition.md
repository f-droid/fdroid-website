---
layout: post
title: "TWIF 41: The Third Reproducible App Edition"
edition: 41
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 16
number_of_removed_apps: 1
number_of_updated_apps: 107
number_of_beta_updated_apps: 3
number_of_downgraded_apps: 0
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Stringlate discontinued, part 2 of Izzy's F-Droid series is now online in German and androDNS: Third reproducible app in F-Droid.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Stringlate discontinued

The developer of Stringlate has stopped all work on the project (more information [here](https://lonamiwebs.github.io/stringlate/)). It’s really a shame, since it is used to translate other FLOSS Android apps (available on F-Droid). The project is looking for a new maintainer and could use help from the community.

H/T **[@Poussinou](https://forum.f-droid.org/u/poussinou)**

### Part 2 of Izzy's F-Droid series is now online in German

See: [F-Droid for advanced users and developers](https://android.izzysoft.de/articles/named/fdroid-intro-2). This article has earlier been released [in English](https://android.izzysoft.de/articles/named/fdroid-intro-2?lang=en) (on-line) and in print in c't magazine. In agreement with c't magazine, the German articles will be posted with a delay. As such, part 3 will be out in a few weeks, after the print version has been published.

### New apps

* {{ page.featured }} **[AndroDNS](https://f-droid.org/packages/androdns.android.leetdreams.ch.androdns/)**: We have the third [reproducible](https://reproducible-builds.org) app in F-Droid! This DNS client allows you to perform customized DNS queries directly from your mobile phone.
* **[eBooks](https://f-droid.org/packages/android.nachiketa.ebookdownloader/)**: Parse and find e-books to download.
* **[MuPDF mini](https://f-droid.org/packages/com.artifex.mupdf.mini.app/)**: Minimalist viewer for pdf, xps, cbz, unprotected epub, and fb2 documents.
* **[Go to Sleep](https://f-droid.org/packages/com.corvettecole.gotosleep/)**: Reminds you to go to sleep... until you do.
* **[Trigger](https://f-droid.org/packages/com.example.trigger/)**: Open a door over wifi or the internet.
* **[Bop-MusicPlayer](https://f-droid.org/packages/com.sahdeepsingh.Bop/)**: A lightweight powerful music player.
* **[ScraperClub](https://f-droid.org/packages/com.scraperclub.android/)**: Application for scraperclub.
* **[AppOpsX](https://f-droid.org/packages/com.zzzmode.appopsx/)**: A front-end for the appopsservice.
* **[piggybudget](https://f-droid.org/packages/de.php_tech.piggybudget/)**: Easily track your expenses.
* **[GameDealz](https://f-droid.org/packages/de.r4md4c.gamedealz/)**: A non-official client for isthereanydeal.com.
* **[Free Klondike](https://f-droid.org/packages/eu.veldsoft.free.klondike/)**: A mixture of freecell and klondike solitaire.
* **[TimeLimit](https://f-droid.org/packages/io.timelimit.android.open/)**
* **[Diab](https://f-droid.org/packages/it.diab/)**: A smart diabetes manager app.
* **[CPU Stats](https://f-droid.org/packages/jp.takke.cpustats/)**: Show cpu usage within the statusbar.
* **[Trekarta](https://f-droid.org/packages/mobi.maptrek/)**: Simple, responsive map for your trek.
* **[SDB Viewer](https://f-droid.org/packages/org.zephyrsoft.sdbviewer/)**: View song lyrics, a translation of it and guitar chords.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[KeePassDroid](https://f-droid.org/packages/com.android.keepass/)** was [updated](https://github.com/bpellin/keepassdroid/blob/HEAD/CHANGELOG) from 2.3.4 to 2.4.1, with a new fingerprint setting and better handling for large attachments.

* **[Delta Chat](https://f-droid.org/packages/com.b44t.messenger/)** was [updated](https://raw.githubusercontent.com/deltachat/deltachat-android/HEAD/CHANGELOG.md) from 0.20.0 to 0.100.0 with a complete rework of the UI using pure material design, and too many improvements to list! Check out the [changelog](https://raw.githubusercontent.com/deltachat/deltachat-android/HEAD/CHANGELOG.md).

* {{ page.major }} **[EteSync](https://f-droid.org/packages/com.etesync.syncadapter/)** saw a huge [update](https://github.com/etesync/android/blob/HEAD/ChangeLog.md) from 0.22.6 to 1.0.1, adding support for changing the encryption password, Tasks support via OpenTasks, stock password entry, fixes for email invitations, support for the new associate account type, and more.

* **[openScale](https://f-droid.org/packages/com.health.openscale/)** is a weight and body metrics tracker, with support for Bluetooth scales. In this [update](https://github.com/oliexdev/openScale/releases) from 1.8.4 to 1.9.1, you'll find a custom Bluetooth stack to improve Bluetooth communication, new calculations and measurements, support for the Libra-W scale, and the usual smaller updates and bug fixes.

* **[μMath+](https://f-droid.org/packages/com.mkulesh.micromath.plus/)** was [updated](https://github.com/mkulesh/microMathematics/releases) from 2.17.4 to 2.18.0, now with support for Android 9, assigning array elements by index, and displaying whole array without using indices.

* **[Vinyl Music Player](https://f-droid.org/packages/com.poupa.vinylmusicplayer/)** [updated](https://github.com/AdrienPoupa/VinylMusicPlayer/blob/HEAD/CHANGELOG.md) from 0.18.0 to 0.19.2, adding a new smart playlist "not played lately", smart playlist decoration, and finish current song when the sleep timer runs out.

* **[SysLog](https://f-droid.org/packages/com.tortel.syslog/)** 2.2.0 [is out](https://github.com/Tortel/SysLog/blob/HEAD/Changelog.md) with instructions for rootless operation, updated dependencies and crash fixes in landscape mode.

* **[Yaacc](https://f-droid.org/packages/de.yaacc/)** was [updated](https://github.com/tobexyz/yaacc-code/releases) to 2.2.0, with content browsing now done in chunks, async and non blocking for the UI thread. Visualization was added when loading content, Yaacc UPnP Server now respects chunk load requests, and there is a load of bug fixes.

* **[wallabag](https://f-droid.org/packages/fr.gaulupeau.apps.InThePoche/)** is a self-hosted read-it-later app. It [updated](https://github.com/wallabag/android-app/releases) to 2.1.0 with a new fullscreen article view, Share and Copy options for the link menu, scrolling via hardware keys, TTS auto-switch to article's language, and a setting to keep screen on while reading.

* {{ page.featured }} Huge changes for **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** again in this [update](https://gitlab.com/tom79/mastalab/tags) from 1.65.1 to 1.70.0. Mastalab now supports Pleroma, including moderator functions! In further news, you can now compose messages in either plain text, markdown or html. Support for scheduling toots on the server was added and there is now a setting to display new toots either above or below the "fetch more" button. Tag timelines can be switched into art timelines, GIFs are autostarted and looped, there are a bunch of Peertube improvements, and much more.

* **[Revolution IRC](https://f-droid.org/packages/io.mrarm.irc/)** is a modern Android IRC client. It [released](https://github.com/MCMrARM/revolution-irc/releases) version 0.5.0, with advanced theming features, SASL External (CertFP) support, new message indicator and banner, date markers, start on boot option, and per-channel send history.

* **[Open Camera](https://f-droid.org/packages/net.sourceforge.opencamera/)** was [updated](http://opencamera.sourceforge.net/history.html) from 1.44.1 to 1.45.2, now with a 'low light' noise reduction photo mode, continuous burst mode, support for writing WebP and PNG images, and H264, HEVC, 3GPP and WebM (no audio) videos. There is a new option to export (and re-import) all settings to a file, new layouts and on-screen icons, time-lapse rates of 120x and 240x, and many other updates and bug fixes.

* **[Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/)** [updated](https://gitlab.com/sultanahamer/OpenContacts/blob/HEAD/CHANGELOG) from 9.0 to 11.0 with UI improvements and making the WhatsApp integration optional. It now supports importing VCard data as-is and there are many improvements to the contact details, such as showing phone number types in contact details. It is also possible to switch time format between 12/24 hours.

* {{ page.major }} **[Trireme for Deluge](https://f-droid.org/packages/org.deluge.trireme/)** is a thin client for the Deluge torrent software, and was [updated](https://github.com/teal77/trireme/releases) from 0.9.1 to 1.0.2, adding support for the new Deluge 2.0 RPC protocol. In addition to that there are some lesser UI tweaks and bug fixes.

* The **[NewPipe](https://f-droid.org/packages/org.schabi.newpipe/)** that was broken has been reforged! This [update](https://github.com/TeamNewPipe/NewPipe/releases) to 0.15.1 should fix the breakage caused by Google's changes. In addition to that, downloaded files can now be opened with one click, the minimum Android version was bumped to 4.4, streams can be removed by swiping right, and postprocessing for downloads has been added.

* **[Telegram](https://f-droid.org/packages/org.telegram.messenger/)** was [updated](https://github.com/Telegram-FOSS-Team/Telegram-FOSS/blob/HEAD/Changelog.md) from 4.9.1 to 5.2.1 adding global permissions for groups, unified group settings, 5-second undo for deleting chats and clearing chat history, new sorting options in Contacts, and new animations when uploading and downloading media.

### Removed apps

* **[MinTube](https://f-droid.org/wiki/page/com.shapps.mintubeapp)** was moved to the archive because it fails to play any videos, and looks abandoned. See [https://github.com/imshyam/mintube/issues/39](https://github.com/imshyam/mintube/issues/39).

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
