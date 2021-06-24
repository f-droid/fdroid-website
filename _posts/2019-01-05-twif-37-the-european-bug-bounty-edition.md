---
layout: post
title: "TWIF 37: The European Bug Bounty Edition"
edition: 37
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 11
number_of_removed_apps: 6
number_of_updated_apps: 72
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

In this edition: Happy New Year, @Izzy's third F-Droid article on-line and Europe to fund bug bounties for 15 open source programs.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps, with a major release for UserLAnd.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Happy New Year

It's a new year! The F-Droid team wishes you a great 2019 in health, prosperity and freedom.

### @Izzy's third F-Droid article on-line

**[@Izzy](https://forum.f-droid.org/u/izzy)** [writes](https://mastodon.technology/users/IzzyOnDroid/statuses/101334420638305540):

Always wanted to run your own F-Droid repo – but were afraid it's too complicated? No longer, as part 3 of my [@fdroidorg](https://mastodon.technology/@fdroidorg) series shows:

[Your own F-Droid Repository with Repomaker](https://android.izzysoft.de/articles/named/fdroid-intro-3)

### Europe to fund bug bounties for 15 open source programs

Starting in January, [the European Commission is going to fund bug bounty programs for a number of open source projects](https://betanews.com/2018/12/30/european-commission-bug-bounty-open-source/), as part of the [FOSSA project](https://juliareda.eu/FOSSA/). Projects include Drupal, Notepad++, and of interest to F-Droid users: **[VLC](https://f-droid.org/packages/org.videolan.vlc/)**.

(via [@kuketzblog](https://social.tchncs.de/users/kuketzblog/statuses/101334611047910088))

### New apps

* **[DCipher](https://f-droid.org/packages/com.adityakamble49.dcipher/)**: Secret text with 100% offline encryption.
* **[arXiv eXplorer](https://f-droid.org/packages/com.gbeatty.arxiv/)**
* **[Vanilla Metadata Fetch](https://f-droid.org/packages/com.kanedias.vanilla.metadata/)**: Vanilla music player metadata retrieval plugin.
* **[apps\_Packages Info](https://f-droid.org/packages/com.oF2pks.applicationsinfo/)**: Updated applicationsinfos with colors & mini-tags (and basic fixes).
* **[Classical Music Tagger](https://f-droid.org/packages/de.kromke.andreas.musictagger/)**: A plain audio file metadata editor especially for classical music.
* **[Tri Peaks Solitaire for Android](https://f-droid.org/packages/eu.veldsoft.tri.peaks/)**: Solitaire card game.
* **[My Wifi Passwords](https://f-droid.org/packages/info.aario.mywifipasswords/)**: View your wi-fi passwords.
* **[Meritous](https://f-droid.org/packages/net.asceai.meritous/)**: Dungeon crawl game.
* **[PhoneTrack](https://f-droid.org/packages/net.eneiluj.nextcloud.phonetrack/)**
* **[35C3 Wifi Setup](https://f-droid.org/packages/nl.eventinfra.wifisetup/)**: Official noc application for connecting to the 35c3 wifi.
* **[SuperUStats](https://f-droid.org/packages/superustats.tool.android/)**

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **DAVdroid** is now known as **[DAVx⁵](https://f-droid.org/packages/at.bitfire.davdroid/)**. You can read more about this [here](https://www.davx5.com/faq/general/what-does-davx5-stand-for). It was also [updated](https://forums.bitfire.at/category/4/davdroid?tag=announcement) from 2.0.7-ose to 2.1-ose, removing the "Accounts may be gone after rebooting" startup dialog, and offering several smaller changes and bug fixes, and behind-the-scenes changes.

* **[A Time Tracker](https://f-droid.org/packages/com.markuspage.android.atimetracker/)** lets you easily track how much time you spend on various activities. After 2½ years of inactivity, it [updated](https://github.com/netmackan/ATimeTracker/releases) to 0.50, moving all menu items to the Settings menu on the main screen, improving its F-Droid listing and making under-the-hood changes to its build process.

* **[QKSMS](https://f-droid.org/packages/com.moez.QKSMS/)** was [updated](https://github.com/moezbhatti/qksms/releases) from 3.5.4 to 3.6.1, adding the ability to share contact cards and to share multiple images directly from other apps. It also features an updated search bar style, faster startup, more detailed MMS summary, contact photo in notifications, and several bug fixes.

* **[FOSS Browser](https://f-droid.org/packages/de.baumann.browser/)** 6.1.1 [is out](https://github.com/scoute-dich/browser/blob/HEAD/CHANGELOG.md), with an overview instead of startPage, order and filter bookmarks, edit url of bookmark, open favorite website on start, Code of Conduct site, and a Privacy Declaration. There are updates to the adBlock hosts list, help dialog, and French and Portugese translations. Beyond that you'll find many more fixes and improvements.

* **[Yaacc](https://f-droid.org/packages/de.yaacc/)** lets you play media from UPNP/DLNA devices on your network, and lets UPNP/DLNA devices play media from your phone. This [update](https://github.com/tobexyz/yaacc-code/releases) to 2.1.0 will activate the device when unplugged in order to prevent device suspend; it will display cover art, current item and next item in the network player; and it adds new app icons.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** keeps moving at light speed, as it [updates](https://gitlab.com/tom79/mastalab/tags) from 1.50.3 to 1.62.1. This update includes Pixelfed readyness, although it requires something to be changed on the Pixelfed side as well. This change is expected to land any day now.

  Also adds ability to:
  * Mix tag timelines (Any of these words/All of these words/None of these words) - Your instance needs to support it (next Mastodon release)
  * Rename tag timelines
  * Follow Misskey instances
  * Open XMPP links and emails with external applications (custom fields)
  * Set custom icons for videos & GIF media
  * Display "follow request sent" in profile for locked accounts (undo the follow + flag)

* **[KISS launcher](https://f-droid.org/packages/fr.neamar.kiss/)**'s [update](https://github.com/Neamar/KISS/releases) to 3.7.0 adds an AMOLED black theme.

* **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** 0.8.21 [made](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst) it into F-Droid, with the following improvements:
  * Show userId below display name in member detail screen ([#2756](https://github.com/vector-im/riot-android/issues/2756))
  * Clicking on a user and a room avatar opens a new screen with animation to view the avatar in full screen, with zoom capabilities ([#2455](https://github.com/vector-im/riot-android/issues/2455))
  * Added Troubleshoot Notification settings page
  * Added badge to indicate number of group invitations on the Home Screen ([#1923](https://github.com/vector-im/riot-android/issues/1923))

  This release also contains many bug fixes, and improvements to notification code.

* **[Markor](https://f-droid.org/packages/net.gsantner.markor/)** is a text editor centered around simple markup formats like [Markdown](https://commonmark.org) and [todo.txt](http://todotxt.com) for note-taking and list management. Version 1.6.0 [is out](https://github.com/gsantner/markor/blob/HEAD/CHANGELOG.md) and comes with a way to insert date and/or time, and adds the website title when sharing into Markor. For more improvements and fixes, see the author's [blog post](https://gsantner.net/blog/2018/12/30/markor-release-v1.6.html).

* **[SleepyWifi](https://f-droid.org/packages/nl.devluuk.sleepywifi/)** brings back "turn Wi-Fi off when the phone is in sleepmode" for Android 8.1. It [updated](https://github.com/DevLuuk/SleepyWifi/releases) from 1.1 to 1.3, adding a foreground notification, a 10-second delay for the notification, a Dutch translation and an "About" screen. Known bug: the app sometimes fails to re-enable Wi-Fi.

* **[Your local weather](https://f-droid.org/packages/org.thosp.yourlocalweather/)** was [updated](https://raw.githubusercontent.com/thuryn/your-local-weather/HEAD/CHANGELOG) from 4.5.3 to 4.6.3, adding per-widget location setting and settings for graphs and weather forecast, a combined graph and widgets with combined graph. Also fixes negative temperature in notifications, and weather forecast in widget.

* **[Manyverse](https://f-droid.org/packages/se.manyver/)** is a very different messenger than you're used to, because it works locally and off-grid. If you are unfamiliar with Manyverse and its underlying protocol, Secure Scuttlebutt, you should probably [read this background article](https://staltz.com/early-days-in-the-manyverse.html).

  This [update](https://gitlab.com/staltz/manyverse/blob/HEAD/CHANGELOG.md) from 0.1811.14-beta to 0.1901.2-beta brings the following new features:
    * add notes on internet p2p invite codes
    * delete an internet p2p invite code
    * re-share an internet p2p invite code
    * block profiles, publicly or secretly

  And fixes:
    * navigation bug between profile screens
    * UI glitch in profile screen
    * Wi-Fi discovery and sync on some devices

  Other improvements include quicker startup when user has many P2P invites and showing an informative text when loading takes too long.

* {{ page.major }} **[UserLAnd](https://f-droid.org/packages/tech.ula/)** lets you run GNU/Linux Distros on Android - no root required. It [updated](https://github.com/CypherpunkArmory/UserLAnd/releases) to version 2.0.0, adding a built-in terminal to UserLAnd. (Version 2.1.0 is expected in F-Droid soon and should fix crashes in the new terminal.)

### Beta updates

The following updates won't be automatically suggested to you unless you have "Unstable updates" enabled in the F-Droid app settings, but you can expand the "Versions" tab and install them manually. Note that these are marked beta for a reason: proceed at your own risk.

* **[Nextcloud Talk](https://f-droid.org/packages/com.nextcloud.talk2/)** [released 3.2.0beta1](https://github.com/nextcloud/talk-android/releases/tag/v3.2.0beta1) with a completely reworked UI flow, and support for loading remote images. (There was also a regular 
[update](https://github.com/nextcloud/talk-android/releases) to 3.1.3 with some bug fixes.)

### Removed apps

* Most of the old simple mobile tools were moved to the archive: **[Calendar](https://f-droid.org/wiki/page/com.simplemobiletools.calendar)**, **[Contacts](https://f-droid.org/wiki/page/com.simplemobiletools.contacts)**, **[File Manager](https://f-droid.org/wiki/page/com.simplemobiletools.filemanager)**, **[Gallery](https://f-droid.org/wiki/page/com.simplemobiletools.gallery)** and **[Notes](https://f-droid.org/wiki/page/com.simplemobiletools.notes)**. They are no longer maintained, and have been replaced by their "Pro" counterparts.

* **[AddressToGPS](https://f-droid.org/wiki/page/me.danielbarnett.addresstogps)** was [moved to the archive](https://gitlab.com/fdroid/fdroiddata/merge_requests/4207) because the network service it relies on stopped working recently, and there hasn't been activity from the app's maintainer in over 2 years. For more details, see [this issue](https://github.com/DanielBarnett714/AddressToGPS/issues/13). As replacement, we suggest **[Acastus Photon](https://f-droid.org/packages/name.gdr.acastus_photon/)**, or although heavy, **[OsmAnd~](https://f-droid.org/packages/net.osmand.plus/)** which can look up addresses even when offline.

{{ page.number_of_removed_apps }} apps were removed.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
