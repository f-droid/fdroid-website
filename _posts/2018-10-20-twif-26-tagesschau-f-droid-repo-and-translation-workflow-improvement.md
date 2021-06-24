---
layout: post
title: "TWIF 26: Tagesschau F-Droid repo and translation workflow improvement"
edition: 26
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 79
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:matrix.org](https://matrix.to/#/#fdroid:matrix.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Tagesschau running an F-Droid repo, starting up translation improvements, finalizing buildserver automation, and 2 new and {{ page.number_of_updated_apps }} updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Tagesschau running their own F-Droid repository

We recently learned that [Tagesschau](https://en.wikipedia.org/wiki/Tagesschau_(German_TV_series)) distributes their official app through their own F-Droid repository at `https://service.tagesschau.de/app/repo`.

We see this move as a great step towards user rights and freedom. Sadly the app isn't [free and open source software](https://en.wikipedia.org/wiki/Free_and_open-source_software), although it is financed with public money. If it is public money, it should be [public code](https://publiccode.eu) as well.

Background for non-German readers: Tagesschau is essentially the German national TV news, airing every day at 20:00. For a longer and more nuanced description, please [refer to Wikipedia](https://en.wikipedia.org/wiki/Tagesschau_(German_TV_series)).

#### Starting up translation improvements around Weblate

**[@\_hc](https://forum.f-droid.org/u/hans)** and **[@uniq](https://chaos.social/@uniq)** will be working together to improve the Weblate workflow as part of a funded effort. The work is specifically targeted at Markdown, like we use on this website. Effort will also be going towards app store translations like [Fastlane](https://fastlane.tools) and [Triple-T](https://github.com/Triple-T). In addition, there is a little bit of time to work on stabilizing [Jekyll](https://jekyllrb.com), so that it can support more than 9 languages on our site. If you are a Ruby developer who likes to help with the latter, please [get in touch](https://f-droid.org/en/about/#contact).

#### Buildserver automation

**[@uniq](https://chaos.social/@uniq)** has been finalizing his awesome buildserver automation, with some help from **[@\_hc](https://forum.f-droid.org/u/hans)**. This same [ansible](https://en.wikipedia.org/wiki/Ansible_%28software%29) setup can also be used for [verification server](https://reproducible-builds.org)s.

#### New apps

* **[Adaptive Brightness Tile](https://f-droid.org/packages/com.rascarlo.adaptive.brightness.tile/)**: Quick settings tile for adaptive brightness.
* **[BookmarkOS](https://f-droid.org/packages/com.weskenyon.bookmarkos/)**: This application will allow you to share urls directly from your Android browsers right into BookmarkOS.

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.featured }} Did you know that nowadays apps can track where you are and what you're looking at using inaudible (to humans) high-frequency sounds? Listening via your phone's microphone, apps containing certain trackerware pick up tones from TV, radio and web page ads, but also billboards, retail outlets and sports stadiums. See [this SC magazine article](https://www.scmagazineuk.com/invasive-apps-track-ultrasonic-sounds-via-mobile-microphone/article/1474717), for example.

  Enter **[PilferShush Jammer](https://f-droid.org/packages/cityfreqs.com.pilfershushjammer/)**, both a passive and an active microphone jammer. Its primary mode of operation is to hold an exclusive lock on the microphone, blocking other apps from even opening it. If that doesn't work, or if you suspect system apps are in play, it also has an active jamming mode, emitting its own tones from the phone's speaker, which hopefully interfere with these tracking sounds. Obviously this is less reliable, and of course, it's even better to not install hostile closed-source apps in the first place.

  So this week PilferShush Jammer updated from 2.0.13 to 2.2.2, and it can now scan other apps, list their capabilities, and show which ones contain the NUHF beacon SDK. It can also scan a single app and show if it's accessing the microphone, among other things. Finally there are a new notifications channel, and other small improvements and bug fixes.

* **[Yalp Store](https://f-droid.org/packages/com.github.yeriomin.yalpstore/)** was updated from 0.43 to 0.45-legacy, adding multiple accounts support and properly handling APK splits, and a slew of other bug fixes and improvements.

* **[PocketMaps](https://f-droid.org/packages/com.junjunguo.pocketmaps/)** is a map viewer with navigation system. It was updated from 2.3 to 2.6, now showing the unzipping process on the status bar, and with a new select-option to enter map on each startup, a help entry in the main menu linking to online documentation, and several crash fixes.

* **[MatLog Libre](https://f-droid.org/packages/com.pluscubed.matloglibre/)** shows a scrolling (tailed) view of the Android "logcat" system log, hence the goofy name. In version 1.2.0 the widget was fixed for Android 8+, and a filtered tags setting, progress bar loading from file and kernel log in shared zip were added. Among other small improvements, several crashes were also fixed.

* {{ page.major }} The "simple mobile tools" **[File Manager](https://f-droid.org/packages/com.simplemobiletools.filemanager/)** and **[Flashlight](https://f-droid.org/packages/com.simplemobiletools.flashlight/)** were updated to 5.0.1 and 5.0.0 respectively, bumping the minimum required Android version to 5.0 (from 4.1), and replacing the G+ button with Reddit, among some small fixes.

* {{ page.major }} **[Open Link With](https://f-droid.org/packages/com.tasomaniac.openwith.floss/)** was updated from 1.9-floss to 2.3-floss. This app lets you open a link in another native app when you're stuck in the browser. It now supports browser selection, letting you choose between all browsers (previous behavior), one single browser, or to never suggest any browsers at all. Frequently-requested advanced settings were also added, and you can now set OLW itself as a browser, making all link clicks go through OLW automatically instead of having to use "share link".

* **[Password Store](https://f-droid.org/packages/com.zeapo.pwdstore/)** stores passwords in simple text files which are encrypted with OpenPGP. This update to 1.3.1 covers a new adaptive icon, ability to install to external [SD card](https://en.wikipedia.org/wiki/Secure_Digital), different password sort order, display of HOTP code if present, secure password entry, and other bug fixes and smaller improvements.

* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** was updated from 2.3.2+fcr to 2.3.4+fcr, updating translations, fixing connection issues with user@ip type JIDs and fixing sending OMEMO encrypted files to ChatSecure iOS users.

* {{ page.featured }} Huge updates for **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** yet again! This week it updated from 1.15.2 to 1.17.1, covering:
  - **Full [PeerTube](https://en.wikipedia.org/wiki/PeerTube) support**: Comment/Follow/Boost/Reply/Fav from your own Mastodon account!
  - New layout for PeerTube instances
  - New video player to make PeerTube compatible with all devices
  - Complete internal overhaul of live updates, now using websockets with the wss protocol on streaming URL
  - Ability to allow live updates only when the app is running
  - Added a red border to media that don't have a description when composing
  - Several smaller enhancements and bug fixes

* **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** and **[miniVector](https://f-droid.org/packages/com.lavadip.miniVector/)** both updated from 0.8.15 to 0.8.18. Riot is a [Matrix](https://matrix.org) client for (group) chat and VoiP/video, with optional end-to-end encryption. miniVector is a lightweight fork of Riot, dropping some heavy dependencies and needing less permissions, at the cost of lacking VoiP/video support. Changes include improvements to dialogs, video messages, and the previewer activity; a new Status.im theme; and support for "lazy loading", a huge under-the-hood change which reduces startup time, memory, and data consumption. This last feature is still considered unstable, and needs to be enabled via a "labs" setting.

* **[Syncopoli](https://f-droid.org/packages/org.amoradi.syncopoli/)** is an rsync client for your phone (currently only in the direction from phone to remote). Version v0.5 adds the ability to add multiple source directories, ability to verify ssh host fingerprint, proper space and string handling in rsync options, global configuration to exported config file, and various typo and crash fixes.

* **[Blokada v3 (ad blocker)](https://f-droid.org/packages/org.blokada.alarm/)** was updated from 3.4.100500 to 3.6.101401, with improved general tunnel stability, decreased data usage, new advanced settings screen, a setting to prevent the system from stopping Blokada when power saving, a setting to only update lists on WiFi, other small enhancements, and numerous bug fixes.

* **[The Light](https://f-droid.org/packages/org.hlwd.bible/)** has the bible in multiple languages. Version 3.4 is a small maintenance release adding 13 articles and 7 Youtubers.

* **[Emerald Launcher](https://f-droid.org/packages/ru.henridellal.emerald/)** is a lightweight customizable launcher which supports icon packs and has a good number of settings for its size. This week it updated from 0.5.6.2 to 0.6.0.2, now with shortcuts, fullscreen mode, "show keyboard on start" option, switch categories with volume buttons, improved tutorial theme, pick custom icon from memory, and several fixes.

* **[Manyverse](https://f-droid.org/packages/se.manyver/)** was updated from 0.18.10-02.beta to 0.1810.16-beta, and now lets you edit your profile picture, and does the initial sync 5x faster or better.

* **[AnySoftKeyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/)** was updated from 1.9.2055 to 1.9.2445 bringing:
  - Power-Saving mode improvements - you can pick which features to include in Power-Saving.
  - Also, we allow switching to dark, simple theme in Power-Saving mode. But this is optional.
  - New Workman layout, Terminal generic-top-row and long-press fixes. Done by Alex Griffin.
  - Updated localization: AR, BE, EU, FR, HU, IT, KA, KN, KU, LT, NB, NL, PT, RO, RU, SC, UK.
  - Fix for small suggestions text on some devices

#### Beta Updates

The following app was also updated, but will not be shown as upgradeable unless you enable "Unstable updates" in F-Droid settings:

* **[ownCloud](https://f-droid.org/packages/com.owncloud.android/)** was updated from 2.9.0-beta.1 to 2.9.0-beta.2

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
