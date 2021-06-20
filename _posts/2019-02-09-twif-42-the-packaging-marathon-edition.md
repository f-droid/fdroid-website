---
layout: post
title: "TWIF 42: The Packaging Marathon Edition"
edition: 42
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 45
number_of_removed_apps: 0
number_of_updated_apps: 98
number_of_beta_updated_apps: 4
number_of_downgraded_apps: 0
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Help needed with Debian Android Tools and Requests for Packaging marathon.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Help needed with Debian Android Tools

As you might know, we are trying to get the Debian Android Tools into Debian, so it becomes possible to build Android apps using only free and open source software from Debian. There are two key packages from the Debian Android Tools suite that are currently not going to make it into the new Debian Buster release. But with your help, this could still change! Read on for details...

The core of the problem is that Buster is using Java 11, and the Android AOSP code base still uses Java 8 and, only in some cases, Java 9. As far as **[@\_hc](https://forum.f-droid.org/u/hans)** can tell, just rebuilding the current Stretch package or updating will have more or less the same problems there.

So far, **apo** of the Java Team, **seamlik** of the Java/Android teams, and **[@\_hc](https://forum.f-droid.org/u/hans)** have all tried quite a bit to get something working. Now they are banging their heads against details in Java builds that none of them have ever dealt with before. So we're putting out a call for help to find someone with this knowledge. Right now, it seems we need to figure out the new Java 9 "modules", specifically using the `--patch-module=` flag to javac and java.

This issue is urgent as the [soft freeze](https://release.debian.org/buster/freeze_policy.html) starts Tuesday the 12th of February. Any packages not in Testing by Monday will not make it into Buster!

For more information, including contact information, please see [https://lists.debian.org/debian-java/2019/01/msg00052.html](https://lists.debian.org/debian-java/2019/01/msg00052.html).

### Requests for Packaging marathon

[Requests for Packaging](https://gitlab.com/fdroid/rfp) is our submission queue for new apps to be added to F-Droid's main repository. This week, **[@Izzy](https://forum.f-droid.org/u/izzy)**, **[@Rudloff](https://forum.f-droid.org/u/rudloff)**, **[@Licaon\_Kter](https://forum.f-droid.org/u/Licaon_Kter)** and **[@Relan](https://forum.f-droid.org/u/relan)** have been going through old issues, spearheaded by **[@Izzy](https://forum.f-droid.org/u/izzy)**'s triaging work. As a result, they closed nearly 40% of all open issues, and we have a whopping {{ page.number_of_added_apps }} new apps to show for it! 24 of these were added in a single day!

### New apps

* **[Dart Checker](https://f-droid.org/packages/com.DartChecker/)**: Dart scoreboard/counter for physical dart matches.
* **[Change Detection](https://f-droid.org/packages/com.bernaferrari.changedetection/)**: Automatically track website changes in background.
* **[Space Trader](https://f-droid.org/packages/com.brucelet.spacetrader/)**: Port of the palm os game of the same name.
* **[MobilePauker++](https://f-droid.org/packages/com.daniel.mobilepauker2/)**: Learn intuitively with flash cards and synchronize your lesson with dropbox.
* **[Monkeyboard Keystone Radio](https://f-droid.org/packages/com.freshollie.monkeyboard.keystoneradio/)**: Monkeyboard fm & dab/dab+ radio interface.
* **[Darkness Immunity](https://f-droid.org/packages/com.github.axet.darknessimmunity/)**: Darkness immunity digital amulet.
* **[Tinte Webcoms](https://f-droid.org/packages/com.halftough.webcomreader/)**: Reader for selected webcomics.
* **[Status](https://f-droid.org/packages/com.james.status/)**: An overlay-based statusbar replacement.
* **[AnkiEditor](https://f-droid.org/packages/com.jkcarino.ankieditor/)**: An advanced note editor plug-in for ankidroid.
* **[Limbo x86](https://f-droid.org/packages/com.limbo.emu.main/)**: A qemu-based emulator.
* **[FlashCards](https://f-droid.org/packages/com.quchen.flashcard/)**: Simple flash card app with csv files as input.
* **[Repeat Me](https://f-droid.org/packages/com.samarthdesai.repeatme/)**: Schedule custom, interval based reminders.
* **[Slim Launcher](https://f-droid.org/packages/com.sduduzog.slimlauncher/)**: Minimalistic launcher.
* **[Calculator Notification](https://f-droid.org/packages/com.tananaev.calculator/)**: Calculator application in the android notification drawer.
* **[OpenHub](https://f-droid.org/packages/com.thirtydegreesray.openhub/)**: A github client app, faster and concise.
* **[k3pler](https://f-droid.org/packages/com.tht.k3pler/)**: Network connection blocker and packet analyzer.
* **[HU Berlin Wi-Fi Installer](https://f-droid.org/packages/de.hu_berlin.eduroam/)**: Eduroam setup tool for humboldt university of berlin.
* **[DeuFeiTage](https://f-droid.org/packages/de.micmun.android.deufeitage/)**: Find the german public holidays per state and year.
* {{ page.featured }} **[SmsMatrix](https://f-droid.org/packages/eu.droogers.smsmatrix/)**: This app turns your phone into an SMS <-> Matrix bridge.
* **[Bhagavad Gita](https://f-droid.org/packages/eu.quelltext.gita/)**
* **[Brainstonz](https://f-droid.org/packages/eu.veldsoft.brainstonz/)**: Brainstonz is a board game for two players.
* **[Hungarian Rings](https://f-droid.org/packages/eu.veldsoft.hungarian.rings/)**: Puzzle game.
* **[Kechi](https://f-droid.org/packages/eu.veldsoft.kechi/)**: Board game for two players.
* **[VitoshaPokerOdds](https://f-droid.org/packages/eu.veldsoft.vitosha.poker.odds/)**: Monte carlo based texas holdem calculator.
* **[Easy Weather](https://f-droid.org/packages/github.vatsal.easyweatherdemo/)**: Easy and quick weather app.
* **[ClipboardCleaner](https://f-droid.org/packages/io.github.deweyreed.clipboardcleaner/)**: Check and clean your clipboard.
* **[UnicodePad](https://f-droid.org/packages/jp.ddo.hotmist.unicodepad/)**: Input every character in unicode.
* **[GrowTracker](https://f-droid.org/packages/me.anon.grow/)**: Help record data about growing plants.
* **[Easy Diary](https://f-droid.org/packages/me.blog.korn123.easydiary/)**: A diary application optimized for user experience.
* **[ykDroid](https://f-droid.org/packages/net.pp3345.ykdroid/)**: Yubikey challenge-response usb and nfc driver.
* **[Blitzortung Lightning Monitor](https://f-droid.org/packages/org.blitzortung.android.app/)**: Get an overview of the current thunderstorm situation.
* **[Wikivoyage European Travels](https://f-droid.org/packages/org.kiwix.kiwixcustomwikivoyageeurope/)**: Offline version of the wikivoyage travel guide.
* **[2048](https://f-droid.org/packages/org.secuso.privacyfriendly2048/)**: Try to reach 2048 in this puzzle game.
* **[Board Game Clock](https://f-droid.org/packages/org.secuso.privacyfriendlyboardgameclock/)**: A timer for board games like chess.
* **[Minesweeper](https://f-droid.org/packages/org.secuso.privacyfriendlyminesweeper/)**: Find and mark every mine without triggering the mines.
* **[WiFi Manager](https://f-droid.org/packages/org.secuso.privacyfriendlywifimanager/)**: Manages your device's wifi based on your location.
* **[ZimLX](https://f-droid.org/packages/org.zimmob.zimlx/)**: Powerful launcher with smart features to make your device easy to use.
* **[Progress Tracker](https://f-droid.org/packages/pl.kuben.progressapp/)**: Any activity progress tracker.
* **[Handy News Reader](https://f-droid.org/packages/ru.yanus171.feedexfork/)**: Rss reader with full offline support fulltext articles with images.
* **[Riseup VPN](https://f-droid.org/packages/se.leap.riseupvpn/)**: Secure vpn powered by bitmask.
* **[Krautschlüssel](https://f-droid.org/packages/space.kraut.schluessel/)**
* **[Wifi QR Code Creator](https://f-droid.org/packages/tk.superl2.xwifi/)**: View wifi credentials and share networks as qr codes.
* **[FreeDCam](https://f-droid.org/packages/troop.com.freedcam/)**: Camera app.
* **[VirtualSoftKeys](https://f-droid.org/packages/tw.com.daxia.virtualsoftkeys/)**: A simple, safe and easy softkeys (navigation bar).
* **[eduroamCAT](https://f-droid.org/packages/uk.ac.swansea.eduroamcat/)**: Eduroam configuration assistant tool.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[Scarlet Notes FD](https://f-droid.org/packages/com.bijoysingh.quicknote/)** was [updated](https://github.com/BijoySingh/Scarlet-Notes/releases) from 5.9.7 to 6.6.3 with a new UI, a new search bar, the ability to sync externally with folder, and many other changes and stability improvements.

* **[EteSync](https://f-droid.org/packages/com.etesync.syncadapter/)** was [updated](https://github.com/etesync/android/blob/HEAD/ChangeLog.md) from 1.0.1 to 1.0.4 with improved import of contact groups, updated event invitation signature, minor UI improvements, some color fixes, and stability improvements.

* **[Red Moon](https://f-droid.org/packages/com.jmstudios.redmoon/)** was [updated](https://github.com/LibreShift/red-moon/blob/HEAD/app/src/main/assets/changelog.md) from 3.3.2 to 3.4.0, adding preliminary support for Android 8+ devices, _also_ adding support for Android versions going back to 4.0 (previously 4.2), more intuitive behavior when saving filters with the same name, new changelog format, a zillion translation updates, and some bug fixes.

* **[miniVector](https://f-droid.org/packages/com.lavadip.miniVector/)** was [updated](https://github.com/LiMium/mini-vector-android/blob/HEAD/CHANGES.rst) from 0.8.21 to 0.8.22b, with an extra fix for the blank screen bug on Android 4.x devices. For other changes, see **Riot** below.

* **[Forecastie](https://f-droid.org/packages/cz.martykan.forecastie/)** was [updated](https://github.com/martykan/forecastie/releases) from 1.7.2 to 1.9.1, adding an adaptive icon, a dialog when searching for a location when there are multiple results, and changed OWM logic to use cityid instead of city.

* **[Easy xkcd](https://f-droid.org/packages/de.tap.easy_xkcd/)** was [updated](https://github.com/T-Rex96/Easy_xkcd/blob/HEAD/CHANGELOG.md) from 6.1.2 to 7.3, with new transitions when entering and leaving overview mode, an AMOLED night theme, dividers in the overflow menu, complete rewrite of the app's database, a new fullscreen mode that is toggled by tapping a comic, manual download for missing comics, and some smaller UI improvements and bug fixes.

* {{ page.major }} **[MusicPiped](https://f-droid.org/packages/deep.ryd.rydplayer/)** was [updated](https://github.com/deep-gaurav/MusicPiped/releases) from 0.2.3-beta to 1.0.2 and has been completely rewritten in flutter with a completely revamped UI and functionality.

* **Mastalab** now goes through life as **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** with accompanying new logo! This [update](https://gitlab.com/tom79/mastalab/tags) from 1.70.0 to 1.72.0 adds GNU Social support, a split notification timeline, expand all CW in a thread with a single click, an upload button for Peertube, a quick button to delete toots for Pleroma admins and moderators, and some smaller improvements and bug fixes.

* **[Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/)** was [updated](https://www.mozilla.org/en-US/firefox/android/notes/) from 64.0.2 to 65.0, with improved performance, support for the [WebP](https://developers.google.com/speed/webp/) image format, and enhanced security via stronger stack smashing protection. Also, a new icon. (Changed by Mozilla, not us.)

### Beta updates

The following updates won't be automatically suggested to you unless you have "Unstable updates" enabled in the F-Droid app settings, but you can expand the "Versions" tab and install them manually. Note that these are marked beta for a reason: proceed at your own risk.

* **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** was [updated](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst) from 0.8.21 to 0.8.22. Note that this version was not released to the Play Store, and should be considered beta quality. It has an annoying display bug on Android 4.x devices. This version brings an all-new key backup and recovery UI, refreshed themes and a new icon, support for split-screen, autofocus when taking a picture, reorganized notification settings, and many bug fixes.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
