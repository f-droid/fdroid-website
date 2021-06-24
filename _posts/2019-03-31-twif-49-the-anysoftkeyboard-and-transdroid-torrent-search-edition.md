---
layout: post
title: "TWIF 49: The AnySoftKeyboard and Transdroid Torrent Search edition"
edition: 49
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 7
number_of_removed_apps: 0
number_of_updated_apps: 76
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

In this edition: Miscellaneous F-Droid work, AnySoftKeyboard and Transdroid Torrent Search updated.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### F-Droid work

**[@\_hc](https://forum.f-droid.org/u/hans)** worked on the F-Droid client this week, and has tagged 1.6-alpha2 for release. It has a few big usability improvements, and improvements to code quality, making some confusing parts of the code a lot easier to understand. This should hit the repository soon, if it's not already up by the time you read this.

In other news, the translation work with Weblate is starting to pay off for smoothing out the website translation workflow, and it's almost ready for anyone to run the sync process.

**[@nicoalt](https://forum.f-droid.org/u/nicoalt)** worked on [including the latest fdroidserver in Repomaker](https://gitlab.com/fdroid/repomaker/merge_requests/215) which is currently the last blocker for a release. When doing this, he found a [bug](https://gitlab.com/fdroid/fdroidserver/merge_requests/636) for which he's currently awaiting feedback (and a merge) by others.

### New apps

* **[Working Time Alert](https://f-droid.org/packages/com.androidfromfrankfurt.workingtimealert/)**: Never miss the time to go home.
* **[Aegis](https://f-droid.org/packages/com.beemdevelopment.aegis/)**
* **[HeaterRC](https://f-droid.org/packages/com.dynamite.heaterrc/)**: Remote control heater via sms.
* **[Ghost Commander - SFTP plugin](https://f-droid.org/packages/com.ghostsq.commander.sftp/)**: Access files over sftp.
* **[VirtualXposed](https://f-droid.org/packages/io.va.exposed/)**: Use xposed without root, unlock the bootloader or modify system image.
* **[Aard 2](https://f-droid.org/packages/itkach.aard2/)**: Offline dictionary.
* **[Firefox Lite](https://f-droid.org/packages/org.mozilla.rocket/)**: Fast and lightweight web browser.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[EteSync](https://f-droid.org/packages/com.etesync.syncadapter/)** was [updated](https://github.com/etesync/android/blob/HEAD/ChangeLog.md) to 1.4.0, changing the sync to also do the initial preparation in chunks, which should help with massive syncs.

* **[Cythara](https://f-droid.org/packages/com.github.cythara/)** 3.1 [adds](https://github.com/gstraube/cythara/releases) viola tuning.

* {{ page.featured }} **[AnySoftKeyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/)** was [updated](https://github.com/AnySoftKeyboard/AnySoftKeyboard/releases) to 1.10.364, adding adaptive colors, which will match the keyboard colors to the current app. Also new is the Night Mode, which will switch the keyboard and app to a dark theme. There are also power saving tweaks, an updated build process yielding a smaller binary, Halmak keyboard layout for English, and your usual translation updates and bug fixes.

* **[Simple Calendar Pro](https://f-droid.org/packages/com.simplemobiletools.calendar.pro/)** was [updated](https://github.com/SimpleMobileTools/Simple-Calendar/blob/HEAD/CHANGELOG.md) from 6.3.2 to 6.4.1, now with email reminders and improved CalDAV event syncing in the background.

* **[OpenUntis](https://f-droid.org/packages/de.perflyst.untis/)** is an alternative FLOSS Android client for the Untis timetable system. The [update](https://github.com/Perflyst/OpenUntis/releases) to 2.2.0 now mutes the phone on lesson begin, and focuses the login button after scanning the QR code or restoring from prefs.

* **[DarkCroc Theme](https://f-droid.org/packages/de.spiritcroc.darkcroc.substratum/)** was [updated](https://github.com/SpiritCroc/DarkCroc-Android-theme/releases) to 1.4, adding a rounded corner option and removing the aggressive system theming option.

* **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.76.0 to 1.77.1, adding support for polls on Mastodon, a setting to remove the picture when sharing an URL, and a setting to hide the 'delete' button in notifications.

* **[ClipboardCleaner](https://f-droid.org/packages/io.github.deweyreed.clipboardcleaner/)** [updated](https://github.com/DeweyReed/ClipboardCleaner/releases) to 1.3.0 bringing a timeout option for the service, and a help icon to explain why this app may not work.

* **[DroidShows](https://f-droid.org/packages/nl.asymmetrics.droidshows/)** is a reboot of the DroidSeries Offline TV Shows Tracker with many extra features and an improved interface. After a hiatus of almost 1.5 years, a new [update](https://github.com/ltGuillaume/DroidShows/releases) has landed, bringing it up to 7.8.0. This update brings proper support for Android Pie, and you can now change the synopsis language per show, and set the folder for daily backups via the Backup button. You'll also find various smaller UI/UX improvements and fixes.

* **[Telegram](https://f-droid.org/packages/org.telegram.messenger/)** [updated](https://github.com/Telegram-FOSS-Team/Telegram-FOSS/blob/HEAD/Changelog.md) to 5.4.0, now with autoplaying videos, new settings for automatic media download, and logout alternatives. This update also includes fixes for OpenStreetMap and an option to switch between three tileservers.

* {{ page.major }} **[Transdroid Torrent Search](https://f-droid.org/packages/org.transdroid.search/)** [updated](https://github.com/erickok/transdroid-search/releases) from 3.12 to 4.0. This update increases the minimum supported Android version to 4.0, and adds support for custom RSS search feeds.

* **[VLC](https://f-droid.org/packages/org.videolan.vlc/)** jumped many [updates](https://code.videolan.org/videolan/vlc-android/blob/HEAD/NEWS) from 3.0.13 to 3.1.0, and now requires at least Android 4.2. Notable new features include an onboarding screen for new users, A-B repeat, a manual orientation lock in video player, an option to group videos by folder, and compact audio lists on small screens.

* **[Simple sms remote](https://f-droid.org/packages/tranquvis.simplesmsremote/)** lets you remotely control a phone through sms messages. The [update](https://github.com/tranquvis/SimpleSmsRemote/releases) to 1.3.0 adds a new module for audio recording, a new logo, and improved notifications.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
