---
layout: post
title: "TWIF 32: Building the Android SDKs as Free Software, and other calls for help"
edition: 32
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 8
number_of_updated_apps: 67
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Building the Android SDKs as Free Software, F-Droid buildserver container, F-Droid article in c't magazine, repomaker Flatpak and TWIF Call for Help. There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Building the Android SDKs as Free Software

There is an odd quirk with the Android SDK: while the source code is [Apache-2.0](https://spdx.org/licenses/Apache-2.0.html) licensed free software, the binaries that Google ships are not free software and even put substantial restrictions on the apps that are built with the Google binaries. Fortunately, [@beuc](https://gitlab.com/beuc) has been leading the effort to make actual [free software binaries](http://android-rebuilds.beuc.net/) of the Android SDK.

This effort definitely needs help, and **[@\_hc](https://forum.f-droid.org/u/hans)** has proposed to allocate some of F-Droid's resources to the cause. More help still is needed, so he also put out a [Call for Help](https://forum.f-droid.org/t/call-for-help-making-free-software-builds-of-the-android-sdk/4685) on the forum. Please have a look to see if there's something you could do.

### F-Droid buildserver container

**[@Bubu](https://forum.f-droid.org/u/Bubu)** has been working on a Docker container of the buildserver which can run all F-Droid builds. It should become usable by app developers, so they can run it locally and test their apps against it. So far it looks to be a little over 7 GB, which is a lot better than the >30GB VM image. What's still missing is the ability to download missing NDK versions on demand.

### F-Droid article in c't magazine

Our own **[@Izzy](https://forum.f-droid.org/u/izzy)** is writing a 3-part series for the German computer magazine **c't**. The first part just came out, and you can have a sneak peek [here](https://www.heise.de/select/ct/2018/25/1543822872822459), or buy **c't** 25 at your local news stand.

### Repomaker Flatpak

**[@nicoalt](https://forum.f-droid.org/u/nicoalt)** is making good progress on packaging [Repomaker](https://f-droid.org/en/repomaker/) as a flatpak. It's not finished yet, but he's getting close. We are also happy to report that we had good response to our call for help on Mastodon, and now have **[@Persival](https://gitlab.com/Persival)** working on the flatpak continuously!

### TWIF Call for Help

And finally, yours truly had a drastic reduction in the amount of available spare time, in the shape of a new job. This impacts {{ page.twifTag }}, as it needs to be written in 50% less time from now on. I put out a [call for help](https://forum.f-droid.org/t/twif-needs-your-help/4658) on the forum and on Mastodon, and I love how **[@vanitasvitae](https://gitlab.com/vanitasvitae)** has picked up the gauntlet and is adding missing changelogs to the [metadata](https://gitlab.com/fdroid/fdroiddata), like [here](https://gitlab.com/fdroid/fdroiddata/merge_requests/4004) and [here](https://gitlab.com/fdroid/fdroiddata/merge_requests/4005). There were also some good submissions to the {{ page.twifThread }}.

Nevertheless, ongoing help is needed! Please have a look at the [forum thread](https://forum.f-droid.org/t/twif-needs-your-help/4658), send in tips, or better yet, complete news items. I'm also looking for someone who would be interested in writing at least one TWIF a month.

### New apps

* **[Frost for Facebook](https://f-droid.org/packages/com.pitchedapps.frost/)** is a fully functional web wrapper, with many unique and native features: 
  * True multi user interactions
  * Better multitasking
  * Contextual awareness
  * Material Design
  * Complete theme engine
  * Fully opened
  * Fixes the little things

* **[Arch packages](https://f-droid.org/packages/com.rascarlo.arch.packages/)** An Arch Linux packages browser, it makes use of the official API to browse the repos.

* Another Pro version of the **Simple Mobile Tools** is landing in F-Droid: **[Simple Calendar Pro](https://f-droid.org/packages/com.simplemobiletools.calendar.pro/)**. For background, see [this forum thread](https://forum.f-droid.org/t/simple-mobile-tool-are-becoming-paid/4553).

* **[PiGrid Companion](https://f-droid.org/packages/de.blocklink.pigrid/)**: Gridcoin stakebox companion app.

* **[Yaacc](https://f-droid.org/packages/de.yaacc/)**: Upnp client and server.

* **[Open In WhatsApp](https://f-droid.org/packages/io.github.subhamtyagi.openinwhatsapp/)**: Open chat in Whatsapp.

* **[FiSSH](https://f-droid.org/packages/science.iodev.fissh/)**: SSH authentication via fingerprint scanning over the network (SSL sockets). It stores your SSH key phrase and sends it to your PC securely via the LAN when an authorized fingerprint is detected by the fingerprint scanner. Your PC needs to be running the complementary [desktop app](https://git.iodev.science/ioan/FiSSH-Desktop).

* **[Firefly III Mobile](https://f-droid.org/packages/xyz.hisname.fireflyiii/)**: Unofficial mobile client for Firefly III, a self-hosted financial manager. In order to use this app, you must first setup a [Firefly III instance](https://firefly-iii.org/).

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.major }} **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/)**, a Mastodon client, had a major [update](https://github.com/tuskyapp/Tusky/releases) to 4.0, with redesigned preferences, refactored media detail view with support for sharing media files and copying their links, collapse long statuses, share videos to Tusky, and many more. This update also [removes support for Android 4](https://github.com/tuskyapp/Tusky/issues/476).

* **[Simple Dilbert](https://f-droid.org/packages/com.mareksebera.simpledilbert/)** [updated](https://github.com/smarek/Simple-Dilbert/blob/HEAD/CHANGELOG.md) to 4.6, with an Android SDK update to v28 and many bug fixes.

* **[Transportr](https://f-droid.org/packages/de.grobox.liberario/)** [updated](https://github.com/grote/Transportr/releases) to 2.0.3 with the following changes:
  * Add launcher shortcut for directions search
  * Show swap location button in directions search (Thanks ByteHamster!)
  * Don't show search results over lockscreen anymore
  * Add Persian translation (Thanks Reza!)
  * Add Chinese (Taiwan) translation (Thanks Gerrit!)
  * Fix home and work location input in dark theme
  * Disable Android's auto-fill feature for location views

* **[Offi Directions](https://f-droid.org/packages/de.schildbach.oeffi/)** was [updated](https://gitlab.com/oeffi/oeffi/raw/HEAD/oeffi/CHANGES) from 10.1.4-aosp to 10.3.4-aosp, with the right half of the screen now based on OpenStreetMap, two new regions, and long-pressing a line label will reveal the full name of the line, if available.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** [updated](https://gitlab.com/tom79/mastalab/tags) from 1.30.1 to 1.31.1 with a new battery profile setting, an indicator to highlight the toot is part of a thread, copy Mastodon account to clipboard by long-pressing it, auto-switch to offline mode if Internet is unavailable, several bug fixes, and other smaller UI/UX changes.

* {{ page.major }} **[Tower Collector](https://f-droid.org/packages/info.zamojski.soft.towercollector/)** collects GPS locations of GSM/UMTS/LTE/CDMA cell towers and sends them to the OpenCellID.org database. It was [updated](https://github.com/zamojski/TowerCollector/releases) from 1.22.2-fdroid to 2.0.0, with the following changes:
  * Added option to contribute to Mozilla Location Services (MLS).
  * Changed upload progress to report in percentage instead of parts.
  * Added new languages: Hungarian, Italian and Spanish :)
  * Added option to clear all data stored locally excluding configuration.
  * Added display short and long cid for LTE networks.
  * Added database refresh after import from file - restart no longer needed.
  * Fixed folder not created when exporting database or preferences to file.
  * Improved error handling.

* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)** was [updated](https://gitlab.com/gdroid/gdroidclient/tags) from 0.2.1 to 0.3.0, with tags for apps that are used for standard tasks, and a new logo with something purple.

* **[OSMBugs](https://f-droid.org/packages/org.gittner.osmbugs/)** was [updated](https://github.com/ChristopherGittner/OSMBugs/blob/HEAD/CHANGELOG.md) from 1-1-1 to 1-1-4, fixing the "Failed to load from Mapdust" bug, updating the Android annotations library, and fixing a translation error.

* **[OpenTopoMap Viewer](https://f-droid.org/packages/org.nitri.opentopo/)** was updated from 1.0.2 to 1.0.4. **[@Poussinou](https://forum.f-droid.org/u/poussinou)** writes: It removes a big bug that causes the crash of the app when opening a GPX file. You can now display your tracks easily in the map since it has been corrected! Issue [here](https://github.com/Pygmalion69/OpenTopoMapViewer/issues/2). I don't know if it's worth the price to mention this update, but the author has corrected the bug very quickly and tagged a new release ASAP. It was very impressive. I love developers like that!

* **[Your local weather](https://f-droid.org/packages/org.thosp.yourlocalweather/)** was [updated](https://raw.githubusercontent.com/thuryn/your-local-weather/HEAD/CHANGELOG) from 4.4.6 to 4.4.10, fixing a crash when the location has not been changed, OpenStreetMap API switched from http to https, and some translation changes.

* **[ToGoZip](https://f-droid.org/packages/de.k3b.android.toGoZip/)** allows to send files (i.e. jpg-photos or mp3-music) or text (i.e. urls) to one predefined zip file by adding “Add To Zip” to Android’s share/send menu. Version 2.0.17 adds send/view/edit/delete of zip file to Settings-Menu and adds optional support for automatic zip-subfolder discovery.

### Removed apps

* **[Solitaire](https://f-droid.org/wiki/page/com.kmagic.solitaire)** was moved to the archive, as it is abandoned and has been replaced with **[SolitaireCG](https://f-droid.org/packages/net.sourceforge.solitaire_cg/)**, which in turn has matured a lot, is well maintained and offers additional features and games.

* **[Omnidroid](https://f-droid.org/wiki/page/edu.nyu.cs.omnidroid.app)** was moved to the archive because it has been abandoned. You should switch to its successor, **[LibreTasks](https://f-droid.org/packages/libretasks.app/)**.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
