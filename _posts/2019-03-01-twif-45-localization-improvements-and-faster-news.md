---
layout: post
title: "TWIF 45: Localization improvements and faster news"
edition: 45
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 2
number_of_removed_apps: 2
number_of_updated_apps: 64
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

In this edition: Localization improvements in the F-Droid repository, F-Droid News section is splitting off, german article on how to have your own F-Droid repository, and Calendar Notifications Plus unpublished from Play Store.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Localization improvements in the F-Droid repository

As part of the Linguine grant, [Weblate](https://weblate.org) has implemented F-Droid/Fastlane support for app description metadata. This makes it incredibly easy to add translations without needing to go through any extra intermediate conversion steps. **[@\_hc](https://forum.f-droid.org/u/hans)** has been deep diving into the localization workflow, converting several apps to this new workflow, including the F-Droid app itself.

### F-Droid News section is splitting off

**[@nicoalt](https://forum.f-droid.org/u/nicoalt)** has set up the hosting, and **[@\_hc](https://forum.f-droid.org/u/hans)** has set up the syncing, so [news.f-droid.org](https://news.f-droid.org) is now live and in beta! In the coming weeks we'll be converting the existing collection of newsposts to Hugo, finalize the site, and seamlessly integrate it into the main website.

The benefit of all this: More regular and timely updates. Instead of having to go through an approval process, and _then_ only going live with the next index update, whenever that happens, it will now be online within about a minute of publishing, instead of up to several days.

The site is already updating, and if you want the latest news the earliest, you can point your RSS readers at [https://news.f-droid.org/index.xml](https://news.f-droid.org/index.xml).

### German article on how to have your own F-Droid repository with Repomaker

The German version of **[@Izzy](https://forum.f-droid.org/u/izzy)**'s third F-Droid article will go online coming Sunday (the 3rd of March). The English article is already online. If you always wanted to know how to have your very own F-Droid repository, have a look at:

[Your own F-Droid Repository with Repomaker](https://android.izzysoft.de/articles/named/fdroid-intro-3) (English/German - language is auto-detected)
<!-- Note to German translator: German title is "Eigenes F-Droid Repository mit Repomaker erstellen und verwalten" -->

### Calendar Notifications Plus unpublished from Play Store

The developer of **[Calendar Notifications](https://f-droid.org/packages/com.github.quarck.calnotify/)** has [pulled their app from Google Play](https://www.reddit.com/comments/auiv3b), while leaving it on FDroid:

> I have realized yesterday that Play Store was a source of a constant stress recently. And for what? For an app that I develop as a fun-time activity and having absolutely zero profit from it. Recent SDK/API changes has forced me to kill/change some functionality that people liked and people were blaming me, not google.

### New apps

* **[LASKmobile](https://f-droid.org/packages/com.rfo.LASKmobile/)**: Data entry app for the field record LASK.
* **[Mozc for Android](https://f-droid.org/packages/org.mozc.android.inputmethod.japanese/)**: Japanese input method editor.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[EteSync](https://f-droid.org/packages/com.etesync.syncadapter/)** is a secure and end-to-end encrypted personal information sync for Android, the desktop and the web. (You will either need a paid account, or set up your own server.) It was [updated](https://github.com/etesync/android/blob/HEAD/ChangeLog.md) from 1.2.0 to 1.2.2, fixing the setting controlling change notifications, and fixing a crash during sync for some users.

* {{ page.major }} **[openScale](https://f-droid.org/packages/com.health.openscale/)**, a weight and body metrics tracker with support for Bluetooth scales, was [updated](https://github.com/oliexdev/openScale/releases) from 1.9.3 to 2.0.1:
  * replaced HelloCharts library with the MPAndroidChart library
  * added option to enable/disable graph legend
  * replaced statistic last week/month table view with radar graph
  * added rolling chart option
  * added graph marker and marker menu for line graphs
  * added option to enable/disable Y-axis
  * change indicator color depending on if you are going towards or away from your weight goal
  * fixed notification bug for Android O
  * simplified Bluetooth machine state for improved Bluetooth communication
  * grand access to fine location which includes coarse location access
  * disabled linear regression line
  * coloured y-axis and table icons correctly
  * fixed widget bug

* **[Indigenous](https://f-droid.org/packages/com.indieweb.indigenous/)**, an IndieWeb Micropub and Microsub Client, was [updated](https://github.com/swentel/indigenous-android/releases) from 0.31 to 0.33, now with manage channels and feeds, and support for sending location name. The floating action button on manage channel and feeds screen was moved to the action bar.

* {{ page.featured }} **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/)** is a Mastodon client. This is a big [update](https://github.com/tuskyapp/Tusky/releases) from 4.1 to 5.1 with too many changes to list. Please refer to the [release notes](https://github.com/tuskyapp/Tusky/releases/tag/v5.0) for changes and screenshots.

* **[miniVector](https://f-droid.org/packages/com.lavadip.miniVector/)** and **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** [both](https://github.com/LiMium/mini-vector-android/blob/HEAD/CHANGES.rst) [updated](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst) to 0.8.23, with a refreshed look and support for key backup! Other improvements include:
  * Support Split-screen mode (#1832)
  * Enable auto focus when taking picture with the camera (#2831)
  * Notification settings re-organization, added bing rule troubleshoot
  * Redact has been renamed to Remove to match riot/web (#2871)
  * Remove long click download action in MediaViewer (#2882)
  * Sender name colors in rooms
  * Remove beta e2e warning (#2946)

* **[Vinyl](https://f-droid.org/packages/com.poupa.vinylmusicplayer/)**, a light and slick material design music player, [updated](https://github.com/AdrienPoupa/VinylMusicPlayer/blob/HEAD/CHANGELOG.md) from 0.19.2 to 0.20.1, now with sort by date for Songs and Albums, song title text in a horizontal scrollview, swipe to remove song from queue, and SD card write access using SAF API.

* **[piggybudget](https://f-droid.org/packages/de.php_tech.piggybudget/)**, an expense tracker, was [updated](https://github.com/pmiddend/piggybudget/releases) to 2.2, now with support for exporting your entire transaction history to CSV, as well as the inverse, importing CSV files into piggybudget.

* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** was [updated](https://github.com/siacs/Conversations/blob/HEAD/CHANGELOG.md) from 2.3.12+fcr to 2.4.1+fcr, bringing a new Backup / Restore feature, clearer distinction between private group chats and public channels, a redesigned participants view for group chats and channels, and a redesigned "create new contact/group chat/channel" flow in the Start Conversation screen.

* **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)**, the swiss army knife of Activitypub-based platforms (Mastodon/Pleroma/Peertube/GNU Social/Friendica) was [updated](https://gitlab.com/tom79/mastalab/tags) to 1.75.0, featuring an ad blocker for its builtin browser, a renewed and simplified login page with auto-detection of the instance type, a "Console mode" layout, copy toot URL to clipboard, and "timed mute" accessible from all menus that have "mute".

* **[UserLAnd](https://f-droid.org/packages/tech.ula/)** was [updated](https://github.com/CypherpunkArmory/UserLAnd/releases) from 2.3.4 to 2.3.7, adding support for continuous deployment, user review request, and fixing the "getting started" link.

### Removed apps

* **[CACertMan](https://f-droid.org/wiki/page/info.guardianproject.cacert)** was moved to the archive, as it is completely unmaintained. (No updates since 2011.)

* **[FiSSH](https://f-droid.org/wiki/page/science.iodev.fissh)** was moved to the archive as the author apparently no longer wishes to publish it to F-Droid. No reason was specified.

{{ page.number_of_removed_apps }} apps were removed.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
