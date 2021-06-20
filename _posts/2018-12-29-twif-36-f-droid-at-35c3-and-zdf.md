---
layout: post
title: "TWIF 36: F-Droid at 35C3 and ZDF"
edition: 36
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 3
number_of_removed_apps: 0
number_of_updated_apps: 90
number_of_beta_updated_apps: 1
number_of_downgraded_apps: 0
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Second part of @Izzy's article series is available, Privacy-focused article at ZDF, F-Droid does 35C3 and F-Droid 1.5 released.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Second part of @Izzy's article series on F-Droid is available

For those who have been waiting, part 2 of **[@Izzy](https://forum.f-droid.org/u/izzy)**'s F-Droid series is now online: [F-Droid for advanced users and developers](https://android.izzysoft.de/articles/named/fdroid-intro-2?lang=en). (In English. German version coming soon.)

### Article on F-Droid at ZDF

[ZDF](https://www.zdf.de) published an article (in German) for helping their readers to protect their privacy on Android by introducing them to F-Droid and 10 of its apps: [https://www.zdf.de/nachrichten/heute/zehn-freundliche-android-apps-100.html](https://www.zdf.de/nachrichten/heute/zehn-freundliche-android-apps-100.html)

Torsten **[@Grote](https://blog.grobox.de)** was interviewed for this article, and because not all information made it into ZDF's articles, he has published [the full transcript](https://blog.grobox.de/2018/interview-zu-f-droid-mit-zdf-heute/) on his blog.

Meanwhile, [Mike Kuketz](https://www.kuketz-blog.de) [reminds us](https://social.tchncs.de/@kuketzblog/101289466745473597) that although this article is very nice, [ZDF's media app only exists in the Play Store, and doesn't function at all without Google Play services](https://www.kuketz-blog.de/zdfmediathek-app-nutzung-nur-mit-google-play-diensten/).

(ZDF is Germany's second public TV broadcaster.)

### F-Droid at 35C3

We had an amazing meetup at the first day of [35C3](https://events.ccc.de/congress/2018/wiki/index.php/Main_Page). The developers of **[K-9 Mail](https://f-droid.org/packages/com.fsck.k9/)**, **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/)**, **[Offi](https://f-droid.org/packages/de.schildbach.oeffi/)**, **[NewPipe](https://f-droid.org/packages/org.schabi.newpipe/)** and **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** were all there (and probably a few more)! Thank you all for coming.

* **[@\_hc](https://forum.f-droid.org/u/hans)** held his talk on "Wind", and [the video is up](https://media.ccc.de/v/35c3-9595-wind_off-grid_services_for_everyday_people).

* [Erik Albers](https://mastodon.social/@3rik) also held a talk [introducing F-Droid and 10 of its best apps](https://pretalx.35c3oio.freifunk.space/35c3oio/talk/UFZYAS/). (Presumably not the same ones featured by ZDF!)

### New apps

* **[Trime](https://f-droid.org/packages/com.osfans.trime/)**: Chinese ime with rime input method engine.
* **[OOS Firmware Extractor](https://f-droid.org/packages/fr.witchdoctors.c4ffein.oosfirmwareextractor/)**: Extract firmware from official oneplus roms.
* **[VLC](https://f-droid.org/packages/org.videolan.vlc/)**: VLC Media player returns to the main repository! VLC has been very difficult to build, so although we could occasionally update it, these updates went straight to the archive. We now feel we have the build process under control enough that we can keep it up-to-date in the main repository.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.fdroid }} **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/)** 1.5 [is out](https://gitlab.com/fdroid/fdroidclient/raw/HEAD/CHANGELOG.md)! This version brings improvements and bug fixes for "Nearby Swap", updated translations, support for swapping via [SD card](https://en.wikipedia.org/wiki/Secure_Digital)s, UX and language cleanup of App Details, and support for (ROM/OEM/vendor)-added repositories by means of `additional_repos.xml`.

  This version won't be suggested for automatic install yet, but if you are willing to deal with bugs and want to help test, you can expand the "Versions" tab and install it manually.

* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android/)** was [updated](https://github.com/duckduckgo/Android/releases) from 5.13.0 to 5.15.1, bringing in an anonymous survey capability, new settings to automatically clear your tabs and data, and under-the-hood improvements to enhance the data clearing process.

* **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** and **[miniVector](https://f-droid.org/packages/com.lavadip.miniVector/)** [updated](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst) from 0.8.18 to 0.8.20, finally enabling Lazy Loading by default (faster and uses less memory), and now with full RTL support, the ability to crop your profile picture before sending, ability to hide the status area for more room on your screen, better handling of missing parameters in slash commands, support for specifying kick and ban messages, [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) consent integrated into the registration flow, and many smaller improvements and bugfixes.

* **[Nextcloud](https://f-droid.org/packages/com.nextcloud.client/)** [updated](https://github.com/nextcloud/android/blob/HEAD/CHANGELOG.md) to 3.4.1 with the following changes:
  * hide download when creating share links
  * direct editing files with Collabora Server 4.0
  * sort deleted files by deletion date by default
  * setedit notes on shares
  * search inside of text files
  * actions on notifications
  * remember last path on upload
  * share file to Talk room
  * show local size in "on device" view
  * SSO add request header for deck app
  * various bug fixes

* **[Mysplash](https://f-droid.org/packages/com.wangdaye.mysplash/)** was [updated](https://github.com/WangDaYeeeeee/Mysplash/releases) from 3.4.1 to 3.4.5, now with an app downloader, select downloader option, auto night mode, and various smaller changes and bug fixes.

* {{ page.featured }} **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** & **[Quicksy](https://f-droid.org/packages/im.quicksy.client/)** [updated](https://github.com/siacs/Conversations/blob/HEAD/CHANGELOG.md): Just a point release since [TWIF 34]({{ site.baseurl }}{% post_url 2018-12-13-twif-34-f-droid-is-a-planet %}), but 2.3.10+fcr has some nice improvements:
  * Synchronize group chat join/leaves across multiple clients
  * Fixed sending PGP encrypted messages from quick reply
  * Try to guess initial location in ShareLocation based on SIM card
  * Show a warning snackbar before joining anon-non-private room (maybe you don't want your JID to be public)
  * Show accept button to confirm SASL downgrade (e.g. server reconfigured)

  ...but the big news is that thanks to the work of [Alex Palaistras](https://github.com/deuill), the minimum required Android version was lowered to Android 4.1. Previously, users who didn't have Android 4.4 (or newer) and users of Jolla/Blackberry devices with limited Android compatibility were stuck on Conversations 1.23.8, or needed to switch to **[Conversations Legacy](https://f-droid.org/packages/eu.siacs.conversations.legacy/)**. With this change, they can get up to date with the latest Conversations (and Quicksy) versions. That being said, be sure to read the whole [changelog](https://github.com/siacs/Conversations/blob/master/CHANGELOG.md) between 1.23.x and 2.3.10, so you don't get surprised by the new stuff (removed swipe, removed OTR, and so on and so forth).

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.41.2 to 1.50.3:
  * The timeline jump bug (fetch more/scroll down) was finally found and fixed!
  * New language: Norwegian
  * Better management of live notifications
  * Allow quickly switching between accounts
  * Open profiles faster
  * Fix for missing custom fields on some profiles
  * Miscellaneous layout improvements and bug fixes

  Meanwhile 1.61 is already out and expected in F-Droid soon, so keep your eyes peeled for Pixelfed compatibility and fully customizable tag timelines.

* **[KISS launcher](https://f-droid.org/packages/fr.neamar.kiss/)** is a lightning-fast search-based launcher for your apps, contacts and settings. In this [update](https://github.com/Neamar/KISS/releases) from 3.5.2 to 3.6.1, the icon loading system has been revamped and should be faster. There were also small improvements to custom search engines, and the option to add SMS senders to history was removed to comply with Play Store policy.

* **[Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/)** was [updated](https://www.mozilla.org/en-US/firefox/android/notes/) to 64.0.1, with faster and more responsive scrolling. There are performance fixes for users with installed password manager apps, and the loading indicator uses less CPU and power. From now on, files saved to the downloads folder will no longer be deleted on uninstalling Fennec. Files downloaded before this update will still be deleted: to safeguard them, move them to a different folder.

* **[Transdroid](https://f-droid.org/packages/org.transdroid.full/)** is a bittorrent client manager, supporting all popular clients such as µTorrent, Transmission, rTorrent and many others. This [update](https://github.com/erickok/transdroid/releases) brings us from 2.5.10 to 2.5.14 and includes fixes for Deluge adapter file uploads, several edge case crashes, background service crashes, even more fixes, and if you hadn't noticed, a fix so it builds on F-Droid again. The defunct barcode scanner was removed, support for Android 9 plaintext (non-TLS) was added, qBittorrent set location is now supported and sizes in GB are shown in 2 decimal places.

And that's it for this year! Best wishes, and see you in 2019!

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
