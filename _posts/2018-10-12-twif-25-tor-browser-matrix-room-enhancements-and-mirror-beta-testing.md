---
layout: post
title: "TWIF 25: Tor Browser, Matrix room enhancements and mirror beta testing"
edition: 25
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 114
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:matrix.org](https://matrix.to/#/#fdroid:matrix.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Tor Browser in Guardian Project, Matrix room improved, F-Droid bottom bar improvement, beta mirror up for testing, and 11 new apps and a record-breaking **{{ page.number_of_updated_apps }}** updates.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Tor Browser available in Guardian Project repository

An alpha version of the new Tor Browser is now available via the Guardian Project repository. It is the same APK as from the Tor Project website. The Guardian Project is working on getting it built [reproducibly](https://reproducible-builds.org), and once that is done we will work to add the reproducibly building Tor Browser to F-Droid.

Meanwhile, we are looking for a volunteer who want to add a not-reproducibly-building version to F-Droid. It would be great if someone who has experience with building Fennec could try building Tor Browser.

#### Growing our presence on Matrix

We have had an IRC room on Freenode since at least 2014, and that room has been bridged to Matrix since Matrix started bridging Freenode. Over the last year, we have been customizing the Matrix half of the room, adding a nice room avatar among other things, but the amount of customization we're allowed that way is limited.

So this week we went and made a Matrix room, and bridged it to IRC manually. The upshot of this is that we now have a Matrix room which is fully under our control. This has allowed us to set history visibility to public, so anyone can now read back the logs at [https://view.matrix.org/alias/#fdroid:matrix.org](https://view.matrix.org/alias/%23fdroid:matrix.org). We have also listed the room in matrix.org's room directory, so people who search for F-Droid can actually find us.

Finally, the room can now be reached at [#fdroid:matrix.org](https://matrix.to/#/#fdroid:matrix.org). This alias previously belonged to a third-party F-Droid room which has been running on Matrix since January 2017. They have graciously allowed us to use the alias for our room, for which our sincere thanks.

#### Compact bottom bar in F-Droid client

**[@Licaon_Kter](https://forum.f-droid.org/u/Licaon_Kter)** is working on a modified bottom bar in the F-Droid client, which has more room for text by collapsing the inactive items. This should fix problems with text getting cut off in languages other than English. You can see it in action [here](https://gitlab.com/fdroid/fdroidclient/merge_requests/756).

#### Tutanota on F-Droid spotlighted at Linux Journal

Tutanota, and the story of how they made their app suitable for F-Droid, have been [spotlighted](https://www.linuxjournal.com/content/foss-project-spotlight-tutanota-first-encrypted-email-service-app-f-droid) at Linux Journal. Of course, if you've been [following our blog]({{ site.baseurl }}{% post_url 2018-09-03-replacing-gcm-in-tutanota %}), this will sound very familiar.

#### Beta mirror up for testing

Tetaneutral is a non-profit ISP based in Toulouse, France. They have offered to host a mirror of our main F-Droid repository, as well as the archive. We are currently beta testing the setup, and if you'd like to give it a try, [tap here](https://fdroid.tetaneutral.net/fdroid/repo?fingerprint=43238D512C1E5EB2D6569F4A3AFBF5523418B82E0A3ED1552770ABB9A9C9CCAB) on your mobile device to add it as a "user mirror" for f-droid.org. (Link will not work on a PC or if you don't have the F-Droid app installed.)

#### New apps

* **[Cool Mic](https://f-droid.org/packages/cc.echonet.coolmicapp/)** is an open source Icecast source client. It livestreams audio captured by your Android device’s microphone or mic in / line in jack to any Icecast server.

* Ever wanted to create a fictional setting — for your next novel, comic, screenplay, or what-have-you — but find it difficult to keep everything organized? **[World Scribe](https://f-droid.org/packages/com.averi.worldscribe/)** eases the creation process by letting you keep track of every important element in your world, including the ways in which they're connected.

* **[Cryptolitycs](https://f-droid.org/packages/com.fproject.cryptolitycs/)** gives quick and easy access to cryptocurrency related information and allows the user to follow the cryptocurrency market.

* **[Identify Dog Breeds](https://f-droid.org/packages/com.jstappdev.dbclf/)**: Identify over one hundred different dog breeds with your smartphone.

* **[CPU Info](https://f-droid.org/packages/com.kgurgul.cpuinfo/)**: Information about device hardware and software.

* **[XOverrideHeadphoneJackDetection](https://f-droid.org/packages/de.antonarnold.android.xoverrideheadphonejackdetection/)** is an XPosed module that allows you to manually override the headphone jack detection of an Android device.

* **[Calcvac](https://f-droid.org/packages/de.drhoffmannsoftware.calcvac/)**: Calculate logitudinal one-dimensional pressure profiles in vacuum pipes.

* **[SQRL - Main](https://f-droid.org/packages/org.ea.sqrl/)**: An implementation for SQRL (Secure Quick Reliable Login).

* **[Flyve MDM Agent](https://f-droid.org/packages/org.flyve.mdm.agent/)**: Manage and secure effectively your mobile devices and applications.

* **[Quickly quit](https://f-droid.org/packages/quickly.quit/)**: Quickly quit what you were doing.

* {{ page.featured }} **[Manyverse](https://f-droid.org/packages/se.manyver/)**: At last a mobile client for the _[Secure Scuttlebutt](https://ssbc.github.io/secure-scuttlebutt/)_ protocol lands in F-Droid! SSB is a peer-to-peer protocol and social network optimized for off-line and off-grid use. You can share messages locally using bluetooth or local WiFi, directly with your friends over the internet, or optionally tap into more centralized nodes called "pubs".

    For in-depth details about the developer, André Staltz, and his motivations you can watch the [It's time to build our own Internet](https://www.youtube.com/watch?v=UjfWAbGfPh0) TEDxGeneva talk and the recent [Reinvent the social web](https://www.youtube.com/watch?v=8GE5C9-RUpg). If you're more inclined to read you can see his viral blog posts called [The Web began dying in 2014, here's how](https://staltz.com/the-web-began-dying-in-2014-heres-how.html) and the follow up [A plan to rescue the Web from the Internet](https://staltz.com/a-plan-to-rescue-the-web-from-the-internet.html).

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.major }} Lots of changes for **[VPN Hotspot](https://f-droid.org/packages/be.mygod.vpnhotspot/)**, which updates we haven't been picking up since early June. Updating straight from 1.3.2 to 2.0.3, it has refined masquerading rules, starting on boot, dark theme and Android TV support, identifying and blocking unwanted clients, recording per-client bandwidth, and a ton of UI improvements and fixes. Note that the functionality of this app is limited without root access.

* **[PasteBin](https://f-droid.org/packages/com.anoopknr.pastebin/)** is a client for Ubuntu pastebin. It was updated from 1.0 to 1.5, now with a stable and responsive UI, new recent post and about options, new custom toolbars and menu bars, and the usual bug fixes.

* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android/)** updated from 5.10.3 to 5.10.4, adding optimizations to its HTTPS upgrading solution.

*   **[TrebleShot](https://f-droid.org/packages/com.genonbeta.TrebleShot/)** allows you to send and receive files over available connections, and pause and resume transfer process even when an error is given. This update from 1.2.7.2 to 1.2.7.5 brings improved support for Android 9 (Pie), a theme update & dark theme, and an improved look for the app and the QR scanner, as well as new and updated translations and bug fixes.

* **[PocketMaps](https://f-droid.org/packages/com.junjunguo.pocketmaps/)** is a map viewer with navigation system and support for offline use. This update from 2.0 to 2.3 allows to load GPX files to show an analysis and route, mute voice guidance when in a phone call, make downloads visible in the notification bar, now accepts geo: links from other apps, and several UI improvements.

*   **[Calculator](https://f-droid.org/packages/com.simplemobiletools.calculator/)** 4.2.0 has some updated libraries + translation updates.

* **[File Manager](https://f-droid.org/packages/com.simplemobiletools.filemanager/)** 4.3.1 has some bugfixes and translation improvements.

* **[Gallery](https://f-droid.org/packages/com.simplemobiletools.gallery/)** 4.6.5 adds notch support for Android 9 (Pie), faster video seeking by dragging a finger at the bottom seekbar, a different way of displaying fullscreen GIFs, a new toggle for trying to show the best possible image quality, keep Favorite items marked after moving, and many smaller improvements and fixes.

* **[Elementary](https://f-droid.org/packages/com.ultramegatech.ey/)** is a simple Periodic Table and element reference application. Version 0.9.0 now requires at least Android 4.0 (up from 2.3), and has updated videos for Argon, Tin and Dubnium.

* {{ page.major }} **[Qz](https://f-droid.org/packages/com.vonglasow.michael.qz/)** (pronounced "queues") connects to an RDS/TMC receiver to receive live traffic messages, helping you avoid congestions. Version 2.0.0 is out, with the ability to send new messages as TraFF feeds to applications supporting it, updates to location tables, and fixing a bug causing the message list UI to miss some updates.

* {{ page.major }} **[Wownerujo](https://f-droid.org/packages/com.wownero.wownerujo/)** is a fork of the cryptocurrency Monero with primary alterations. Updating from 1.6.4.0 to 2.3.0.1, the app is now based on Wownero v0.3.0.0 Cool Cage.

* **[Tricky Tripper](https://f-droid.org/packages/de.koelle.christian.trickytripper/)** is an offline-compatible utility for managing travel expenses. 1.6.0 fixes online retrieval of currencies, but without support for El Salvador Colon and Sambian Kwacha.

* **[Tutanota](https://f-droid.org/packages/de.tutao.tutanota/)** 3.37.2 contains updated Terms & Conditions.

* **[EtchDroid](https://f-droid.org/packages/eu.depau.etchdroid/)** helps you write images to USB drives. You can use it to make a bootable GNU/Linux USB drive when your laptop is dead and you're in the middle of nowhere. It requires no root. Version 1.3 brings a dark theme, ability to open images from a file manager, and adds a workaround for an Android 9 (Pie) issue.

* **[NetGuard](https://f-droid.org/packages/eu.faircode.netguard/)** was updated from 2.207 to 2.212, now checking for always-on VPN, updated translations, and some fixes.

* **[Tachiyomi](https://f-droid.org/packages/eu.kanade.tachiyomi/)** is a manga reader. Version 0.8.0 brings quite a few changes, adding a new reader with many fixes, GIF support, showing all entries in the library even if their extensions are not installed, and several bug fixes.

* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** is an instant messenger with support for group chat, based on the XMPP protocol. Starting with version 2.3.0+fcr it brings support for TLSv1.3 and can now disable screen & switch to ear piece in audio player, enable foreground service by default for Android 8 (Oreo), view per-contact media files in contact and conference details screen, preview and ask for confirmation before sending media files, use consistent color generation, fix Quiet Hours on Android 8+, and addition of a video quality selector.

* {{ page.featured }} **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** is a featureful multi-account client for [Mastodon](https://joinmastodon.org). Lots of new features in this jump from 1.13.6 to 1.15.2, now with video and Peertube support:
  * Long-press on bookmark button to bookmark toots with another account
  * Verified URL on profiles (currently only available on mastodon.social)
  * Support for blocking whole instances
  * Allow to share videos
  * Howto videos in menu
  * Manage Peertube videos (fullscreen + comments)
  * Screen name not displayed in non-compact mode
  * Filter issue with local timeline
  * Follow Peertube instances with the ability to comment on videos with Mastodon accounts
  * Direct messages in a column (can be hidden in settings)
  * Many other changes, improvements and bug fixes

* **[Markor](https://f-droid.org/packages/net.gsantner.markor/)** 1.3.0 is out with an "Auto" theme, automatically switching between dark and light theme based on time of day. It also supports Chrome Custom tabs, will now start editing documents at last known cursor position, and enables link highlighting in plaintext format. Long-pressing an image now adds img-src with max-height, long-pressing the "Special key" jumps to top/bottom and long-pressing "Open external" opens context search. On top of that you'll find improvements to TextActions and Representation, and bug fixes.

* **[OsmAnd~](https://f-droid.org/packages/net.osmand.plus/)** 3.2.2 fixes a crash on startup that occurred with non-latin maps, improves rendering speed on Android 8.0 devices, adds support for the polygon (non-amenity) objects editings, and adds a "Measure" button to Actions in the context menu for the distance measuring plugin.

* **[Open Camera](https://f-droid.org/packages/net.sourceforge.opencamera/)** 1.44.1 adds a lot of new capabilities:
  * New photo mode "NR" Noise Reduction, takes a burst of photos and aligns and merges to reduce noise (Camera2 API only, only supported on high end devices)
  * New photo mode "Focus {}" to enable Focus Bracketing (Camera2 API only)
  * New option Settings/"Ghost image", to overlay either last photo taken, or a selected image on your device
  * New option Settings/On screen GUI/"Show audio level meter", to display on-screen audio level when recording video
  * New option Settings/Video settings/"Video flat (log) profile" to record video with a flat profile (Camera2 API only)
  * New options under Settings/"Processing settings..." for setting Edge Mode and Noise Reduction Mode filtering options (Camera2 API only)
  * New option Settings/Photo settings/"Distance unit" to allow using feet instead of metres for GPS altitude on photo stamp and video subtitles
  * On-screen flash icon (to show whether flash will fire or not) now supported for front screen flash
  * New Camera2 API debug option under Settings/"Photo settings" to disable taking photos whilst recording video feature (if your device has problems recording videos with Camera2 API enabled, try disabling this)
  * Camera2 support for high resolution photo resolutions (required for supporting highest resolutions on some devices, e.g., Nokia 6, Samsung Galaxy S6)
  * Launching from intent now recognises request for front or back camera
  * Video bitrate options for 150Mbps and 200Mbps (may not work on all devices)
  * New video audio source options: UNPROCESSED (requires Android 7) and `VOICE_RECOGNITION`
  * Partial Greek translation (thanks to Wasilis Mandratzis-Walz)
  * New option to disable ever showing the "What's New" dialog (under Settings/On screen GUI/ "Show What's New dialog")
  * _Many_ other updates and bug fixes

* {{ page.major }} Apparently we haven't been able to update **[PDF Converter](https://f-droid.org/packages/swati4star.createpdf/)** for 2 years. We now have 8.3.3 in the repository (previously 1.0) with too many changes to list. Of note is that we also picked up some older versions, and version 2.5 is the latest one that will install on Android 4.4. All versions after that require at least Android 5.0.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
