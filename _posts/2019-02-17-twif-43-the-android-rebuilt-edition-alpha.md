---
layout: post
title: "TWIF 43: The Android Rebuilt edition (alpha)"
edition: 43
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 15
number_of_removed_apps: 1
number_of_updated_apps: 69
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

In this edition: First alpha of android-rebuilds is up, F-Droid performance and Izzy triaging.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### First alpha of android-rebuilds is up

The first alpha of the android-rebuilds repo for sdkmanager is up: [https://mirror.f-droid.org/android-free/repository/repository.xml](https://mirror.f-droid.org/android-free/repository/repository.xml)

This is the free software rebuild of all the Android SDK components, done by **[@beuc](https://gitlab.com/beuc)**. See: [https://forum.f-droid.org/t/call-for-help-making-free-software-builds-of-the-android-sdk/](https://forum.f-droid.org/t/call-for-help-making-free-software-builds-of-the-android-sdk/)

The goal is to get it so that apps can use it instead of maven.google.com and any of the Google packages. It is very alpha, so anything could change or break at this point.

### F-Droid performance

**[@krombel](https://forum.f-droid.org/u/krombel)** is investigating why F-Droid is slow, so that we'll know what needs to be improved. Preliminary results:

* DNS and ping is in generally working well
* fdroid\_us is on average available at 88%
* fdroid\_de is in the same timeframe available on 64%
* nights (1-7 o'clock german time) are quite good (4-7 o'clock directly after an index update which contains often used apps) but daytime is in general bad performing (so taking more then 10s to respond on pings)

You can checkout [this](https://monitor.msg-net.de/d/kXzI4Jliks/worldping-endpoint-f-droid-org?orgId=2&from=now%2Fw&to=now&refresh=1m) for "this week so far" or play with different settings on that dashboard.

### Izzy triaging

**[@Izzy](https://forum.f-droid.org/u/izzy)** is finished with triaging, and issues/MRs are in a much saner state now, in both [fdroiddata](https://gitlab.com/fdroid/fdroiddata) and [rfp](https://gitlab.com/fdroid/rfp). In the remaining time of the week he has been weeding his repo. Kicked a bunch of apps out (most had far too many trackers, others had "moved" to the "official repo"), marked others "no longer maintained" and fixed up Anti-Features (could even remove some)...

### Website search updated

**[@uniq](https://chaos.social/@uniq)** worked on our website's search this week, fixing a few minor bugs, as well as doing the long overdue upgrade to django2. He has also started keeping a [changelog](https://gitlab.com/fdroid/fdroid-website-search/blob/master/CHANGELOG.md).

### New apps

* **[SUSI.AI](https://f-droid.org/packages/ai.susi/)**: Susi ai is an intelligent personal assistant.
* **[EVE Mining Calc](https://f-droid.org/packages/com.GTP.eveminer/)**: Mining helper for eve online.
* **[kboard](https://f-droid.org/packages/com.adgad.kboard/)**: A programmable keyboard for Android that lets you send phrases, lenny faces, macros, and data from the Internet in a single tap!
* **[MultiVNC](https://f-droid.org/packages/com.coboltforge.dontmind.multivnc/)**: Vnc viewer that aims to be easy to use and fast.
* **[TalkBack](https://f-droid.org/packages/com.google.android.accessibility.talkback/)**: Accessibility improvements.
* **[Streak Alarm](https://f-droid.org/packages/com.iatfei.streakalarm/)**: Snapchat streaks reminder.
* **[SQLiteViewer](https://f-droid.org/packages/com.orpheusdroid.sqliteviewer/)**: A simple sqlite database viewer.
* **[Simple Draw Pro](https://f-droid.org/packages/com.simplemobiletools.draw.pro/)**: The "pro" version replacing **[Draw](https://f-droid.org/wiki/page/com.simplemobiletools.draw)**. Follow through [here](https://github.com/SimpleMobileTools/Simple-Gallery/issues/1074) for the full story on what "pro" means.
* **[Stop-o-Moto](https://f-droid.org/packages/de.digisocken.stop_o_moto/)**: Make gif and video files by taking single pictures.
* **[Classical Music Scanner](https://f-droid.org/packages/de.kromke.andreas.mediascanner/)**: Auxiliary program for the unpopular music player and opus 1 music player.
* **[Bépo clavier externe](https://f-droid.org/packages/fr.bepo.clavierexterne/)**: Bépo pour clavier externe.
* **[Pi-hole Droid](https://f-droid.org/packages/friimaind.piholedroid/)**: Unofficial client that connects to your pi-hole to show charts and statistics.
* **[DSBDirect](https://f-droid.org/packages/godau.fynn.dsbdirect/)**: Access avh schweinfurt's dsb board.
* **[cone](https://f-droid.org/packages/info.tangential.cone/)**: Data entry tool for the plain text accounting ledger format.
* **[POuL BITS](https://f-droid.org/packages/org.poul.bits.android/)**

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.featured }} **[Nextcloud](https://f-droid.org/packages/com.nextcloud.client/)** has been [updated](https://github.com/nextcloud/android/blob/HEAD/CHANGELOG.md) to version 3.5.0. Highlights are the new Material design, a chunked upload depending on connection (wifi 10mb, mobile 1mb). One can now directly upload a captured image in any folder. Also the existing Document Provider integration got extended to be fully working, so e.g. creating & saving a text from editor is directly working without starting the Nextcloud app. Last but not least all downloaded files will be updated in a background job every 15 min when on Wifi, to ensure that you have always the latest copy. This deprecates the old “keep in sync” setting.

* **[App Launcher](https://f-droid.org/packages/com.simplemobiletools.applauncher/)** was [updated](https://github.com/SimpleMobileTools/Simple-App-Launcher/blob/HEAD/CHANGELOG.md) from 4.1.1 to 5.0.1, with completely rewritten item selection under the hood, and now requiring at least Android 5.0.

* **[Simple Calendar Pro](https://f-droid.org/packages/com.simplemobiletools.calendar.pro/)** was [updated](https://github.com/SimpleMobileTools/Simple-Calendar/blob/HEAD/CHANGELOG.md) to 6.3.0, adding default settings for start time/duration/event type for new events, allowing import and export of settings, and fixing some glitches.

* **[piggybudget](https://f-droid.org/packages/de.php_tech.piggybudget/)** was [updated](https://github.com/pmiddend/piggybudget/releases) from 1.0 to 2.1 with a competely overhauled GUI featuring pretty colors, a clickable three-dot menu on items in the transaction history, and the history now also shows the day of the week.

* **[StreetComplete](https://f-droid.org/packages/de.westnordost.streetcomplete/)** was [updated](https://github.com/westnordost/StreetComplete/releases) from 9.0 to 10.0. Quests previously hidden can now be made visible again from settings, all "other answer..." options leading to another dialog now have their text ending in "...", wording in maxspeed quest was clarified, the choices in the crops quest are now now sorted with new UN FAO data, the tactile paving bus stop quest is now shown for ways as well, and when showing a quest for an element (e.g. a shop) that is not at street level, show additionally on which floor it is located.

* **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.72.0 to 1.73.0, adding Friendica support (restricted due to Friendica API limitations), support for chromebooks, and several bugfixes.

* **[Tremotesf](https://f-droid.org/packages/org.equeim.tremotesf/)** was [updated](https://github.com/equeim/tremotesf-android/blob/HEAD/CHANGELOG.md) from 1.8.5 to 1.9.0, and now remembers used download directories and shows them in the dropdown menu when adding a torrent or changing location. Also added were an option to enable compact view for torrents, an option to show torrent names on multiple lines, and the ability to rename torrents directly from its context menu or its properties screen's menu.

* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)** was [updated](https://gitlab.com/gdroid/gdroidclient/tags) to 0.8.0, adding the ability to review and comment on apps via Mastodon!

* **[Tasks](https://f-droid.org/packages/org.tasks/)** was [updated](https://github.com/tasks/tasks/blob/HEAD/CHANGELOG.md) from 6.4.5 to 6.5.2, with improved notification accuracy, performance improvements, and many bug fixes and translation updates.

* **[Telegram](https://f-droid.org/packages/org.telegram.messenger/)** was [updated](https://github.com/Telegram-FOSS-Team/Telegram-FOSS/blob/HEAD/Changelog.md) from 5.2.1 to 5.3.1, now with blur and motion effects in chat backgrounds, custom colors as backgrounds and apply patterns, search for new backgrounds by color or topic, share and set backgrounds via links that work on all platforms, use backgrounds you set on one device on your other devices, and a selection of new backgrounds.

* **[UserLAnd](https://f-droid.org/packages/tech.ula/)** was [updated](https://github.com/CypherpunkArmory/UserLAnd/releases) from 2.2.1 to 2.3.4 with more robust crash logging to aid in debugging, initial XSDL support for devices running Android versions below 9.0, several crash fixes, more robust username validation for new filesystems, and now correctly displaying the reason for failed downloads.

### Beta updates

The following updates won't be automatically suggested to you unless you have "Unstable updates" enabled in the F-Droid app settings, but you can expand the "Versions" tab and install them manually. Note that these are marked beta for a reason: proceed at your own risk.

* **[Pix-Art Messenger](https://f-droid.org/packages/de.pixart.messenger/)** was [updated](https://github.com/kriztan/Pix-Art-Messenger/blob/HEAD/CHANGELOG.md) from 2.1.5 to 2.2.0 beta (2019-02-10)

* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** was [updated](https://github.com/siacs/Conversations/blob/HEAD/CHANGELOG.md) from 2.3.12+fcr to 2.4.0-beta+fcr:
  * New Backup / Restore feature
  * Clearly distinguish between (private) group chats and (public) channels
  * Redesigned participants view for group chats and channels
  * Redesigned create new contact/group chat/channel flow in Start Conversation screen

* {{ page.fdroid }} **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/)** was [updated](https://gitlab.com/fdroid/fdroidclient/raw/HEAD/CHANGELOG.md) from 1.5.1 to 1.6-alpha0

### Removed apps

* **[Draw](https://f-droid.org/wiki/page/com.simplemobiletools.draw)** was moved to the archive as it has been replaced by **[Simple Draw Pro](https://f-droid.org/packages/com.simplemobiletools.draw.pro/)**.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
