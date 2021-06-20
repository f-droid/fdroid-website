---
layout: post
title: "TWIF 23: Successful update to Stretch"
edition: 23
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 66
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Buildserver successfully upgraded to Stretch, SET Anti-Feature fixed, new F-Droid sweatshirts, and F-Droid 1.4 marked stable. There are 3 new apps and {{ page.number_of_updated_apps }} updates, including Music Player GO, FOSS Browser, StreetComplete, and Bimba.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Stretch upgrade successful

The buildserver guest was upgraded to Debian Stretch, and has published its first index update!

#### SET Anti-Feature fixed

As of the latest index update, the [SET Anti-Feature](https://f-droid.org/wiki/page/Antifeature:SET) has been cleared from all apps. In case you were still wondering what the SET Anti-Feature is... it isn't! That's the bug. [See the bug](https://gitlab.com/fdroid/fdroidserver/issues/565).

#### New F-Droid sweatshirts coming

<span style="font-variant: small-caps; text-transform: lowercase;">Hellotux</span>, whom you may remember from [TWIF 15]({{ site.baseurl }}{% post_url 2018-08-03-twif-15-announcing-f-droid-1-3 %}), is bringing new [F-Droid sweatshirts](https://www.hellotux.com/f-droid) on-line. These should be available soon, in addition to the T-shirts and polo shirts already for sale. Remember that F-Droid gets €3 for every shirt sold!

#### New apps

* **[MatLog Libre](https://f-droid.org/packages/com.pluscubed.matloglibre/)**: Material Design logcat reader based on CatLog
* **[BatteryFu](https://f-droid.org/packages/com.tobykurien.batteryfu/)**: Battery saving
* **[EtchDroid](https://f-droid.org/packages/eu.depau.etchdroid/)**: An application that helps you write images to USB drives, no root required

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[ICSdroid](https://f-droid.org/packages/at.bitfire.icsdroid/)** fetches remote iCalendar files (like your school/university time tables, or events of your favourite sports team) and synchronizes them into local, read-only Android calendars. No other data is transferred; there are no accounts and no logins. This update to 1.6 brings better support for large calendars, and various minor improvements.

* {{ page.major }} **[Music Player GO](https://f-droid.org/packages/com.iven.musicplayergo/)** had a major update to 3.0.0 and then some, bringing it up to 3.1.1. [Changes](https://github.com/enricocid/Music-Player-GO/releases) are unclear.

* **[Nextcloud](https://f-droid.org/packages/com.nextcloud.client/)** 3.3.0 adds support for Trashbin, device credentials, media streaming, and has new media detection for AutoUpload, improved TalkBack screenreader support, offline/maintenance info, and many more improvements and bug fixes.

* **[Waistline](https://f-droid.org/packages/com.waist.line/)**, the calorie counter and weight tracker, was updated from 2.2.3 to 2.3.3, adding the ability to enter your own [Open Food Facts](https://world.openfoodfacts.org) credentials, a setting to change the app's home screen, support for the fibre nutriment, saturated fat and fibre goals, under-the-hood changes to improve performance and ease maintenance, and several bug fixes centering around date problems.

* {{ page.major }} **[FOSS Browser](https://f-droid.org/packages/de.baumann.browser/)** released 6.0. FOSS Browser is a simple browser based on Android's builtin WebView. This release has new translations for Taiwan Traditional Chinese, Italian, Portuguese, and the Polish translation was updated. Besides that there are many more fixes and improvements.

* **[RasPi Check](https://f-droid.org/packages/de.eidottermihi.raspicheck/)** was updated from 1.8.0 to 1.8.11, after 2 years of not updating in F-Droid. RasPi Check shows you the current system status of a running Raspberry Pi computer. The minimum version of Android needed to run this is now 5.0 (up from 2.3). Given that this update spans two years, there are numerous changes which are hard to summarize. You can check the [changelog](https://github.com/eidottermihi/rpicheck/releases) for details.

* {{ page.featured }} {{ page.major }} **[StreetComplete](https://f-droid.org/packages/de.westnordost.streetcomplete/)** had a major update to 8.0! It comes with a huge redesign to the quest forms and the dialogs, bringing it more in line with Google's "material design 2.0". Downloading quests has been made more seamless, allowing for easier editing. Other improvements include a new "Railway crossing" quest, and several improvements to existing quests. Performance problems when downloading quests were addressed (especially when downloading house numbers and building types), and you'll find several other UX enhancements, as well as the usual bug fixes.

* **[FairEmail](https://f-droid.org/packages/eu.faircode.email/)** had a lot of small releases, encompassing many changes. We have 0.69 in the repository now, with more in the pipeline. See the [changelog](https://github.com/M66B/open-source-email/releases?after=0.70) for details.

* {{ page.major }} **[Bimba](https://f-droid.org/packages/ml.adamsprogs.bimba/)** comes out of beta testing with its 2.0 release. Bimba is the first Free Software Poznań Wandering Guide (public transport app). New in version 2.0:
  - official timetable from ZTM
  - VM can be used without offline timetable
  - offline timetable uses exact dates
  - VM is quicker and is more reliable
  - favourites rewritten from scratch
  - app is movable to external storage
  - new colours—grey and green—fitting new Poznań style
  - multiple bug fixes

* **[Shelter](https://f-droid.org/packages/net.typeblog.shelter/)** runs "Big Brother" apps inside an isolated profile. Version 1.2 brings optimizations and fixes to the initialization process, so more devices should be able to use Shelter. In-app sharing is now allowed to cross the profile boundary, security of cross-profile interactions has been improved, and the new feature "File Shuttle" was added as well.

* {{ page.fdroid }} **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/)** 1.4 has been out for about two weeks, but we've now marked it as the current stable version, meaning it will appear on the upgrade list, or if you have the [privileged extension](https://gitlab.com/fdroid/privileged-extension/blob/HEAD/README.md) installed, do the upgrade fully automatic. New in 1.4:
  - huge overhaul of the "Versions" list in the App Details screen, and many other UI improvements, thanks to new contributor [@wsdfhjxc](https://gitlab.com/wsdfhjxc)
  - fix keyboard/d-pad navigation in many places, thanks to new contributor [@doeffinger](https://gitlab.com/doeffinger)
  - show "Open" button when media is installed and viewable
  - add Share button to "Installed Apps" to export CSV list
  - add clickable list of APKs to the swap HTML index page
  - retry index downloads from mirrors
  - fix "Send F-Droid via Bluetooth" on recent Android versions

* **[Kiwix](https://f-droid.org/packages/org.kiwix.kiwixmobile/)** is an _offline_ [Wikipedia](https://www.wikipedia.or) reader. Version 2.4 adds download time estimation, manual update of storage location, sort bookmarks, and fixes some bugs, among others with external [SD card](https://en.wikipedia.org/wiki/Secure_Digital)s.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to **[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)** and remember to tag with **[#TWIF](https://mastodon.technology/tags/twif)**. Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum](https://forum.f-droid.org/)**.

#### And finally

You may have noticed that the design of the "Featured" label has changed, and that TWIF sprouted new "Major" and "F-Droid" labels. We'd like to hear what you think of the idea itself, as well as how it looks. Please share your thoughts!
