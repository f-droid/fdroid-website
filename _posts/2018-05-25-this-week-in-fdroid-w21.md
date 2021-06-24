---
layout: post
title: "This Week in F-Droid, Week 21"
author: "Coffee"
authorWebsite: "https://forum.f-droid.org/u/coffee"
---

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* We have new contributors and permissions in GitLab. [Rudloff](https://forum.f-droid.org/u/rudloff) now has **developer** access for [data](https://gitlab.com/fdroid/fdroiddata). [Poussinou](https://forum.f-droid.org/u/poussinou) has **reporter** (moderator) access to [rfp](https://gitlab.com/fdroid/rfp). [Izzy](https://forum.f-droid.org/u/izzy) has project-wide **reporter** access. We hope these changes will further speed up the process of adding new apps to F-Droid.

* [Rudloff](https://forum.f-droid.org/u/rudloff) is now a member of the [F-Droid Data team](https://liberapay.com/F-Droid-Data) over at [Liberapay](https://liberapay.com/), so he can get some reward for all his hard work.

* [_hc](https://forum.f-droid.org/u/hans) is getting the [Debian GSoC](https://wiki.debian.org/SummerOfCode2018) students started on the [Android SDK Tools in Debian](https://wiki.debian.org/SummerOfCode2018/Projects/AndroidSdkToolsInDebian). This work will directly benefit F-Droid as our build server runs Debian.

* [Bubu](https://forum.f-droid.org/u/Bubu) and [mimi89999](https://forum.f-droid.org/u/mimi89999) have been updating the [SPDX license identifiers](https://spdx.org/licenses/), mostly working on explicit separation between `GPL-3.0-only` and `GPL-3.0-or-later`.

* [Bubu](https://forum.f-droid.org/u/Bubu) and [Tovok7](https://blog.grobox.de/) have been working on fixing [reproducible builds](https://reproducible-builds.org) for [Briar](https://briarproject.org/fdroid.html) among others. The latest news is that this is now working. Stay tuned.

* **uniq** finished up the [documentation for bootstrapping the buildserver basebox](https://staging.f-droid.org/docs/Build_Server_Setup/#creating-the-debian-base-box).

* **uniq** also laid the groundwork to upgrade our build server to Debian _Stretch_, and we'll be experimenting with that in the next weeks. Once this upgrade is in place, it'll be much easier to build some applications with lots of native dependencies, e.g. [VLC](https://f-droid.org/packages/org.videolan.vlc/), [Ring](https://f-droid.org/packages/cx.ring/), [OsmAnd~](https://f-droid.org/packages/net.osmand.plus/).

* You may have noticed the total absence of any [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) related work. [We take your privacy seriously](https://f-droid.org/about/) and always have.

#### Community News

No news from the wider community this week.

#### New apps

* [Notepad](https://f-droid.org/packages/com.farmerbb.notepad/): A simple, bare-bones, no-frills note taking app
* [Binaural Beats](https://f-droid.org/packages/com.github.axet.binauralbeats/): Meditation helper
* [Batch Uninstaller](https://f-droid.org/packages/com.saha.batchuninstaller/): Uninstall multiple applications at once
* [Waistline](https://f-droid.org/packages/com.waist.line/): Free calorie counter and weight tracker
* The [Reader for Pepper&Carrot](https://f-droid.org/packages/nightlock.peppercarrot/) [dropped](https://peppercarrot.com/en/article441/android-e-reader-for-peppercarrot-by-imseaok) on F-Droid this week. It's a multi-language reader for the [CC-BY](https://creativecommons.org/licenses/by/4.0/) licensed [Pepper & Carrot Webcomic](https://peppercarrot.com). You should check it out because it's [cool](https://peppercarrot.com/en/static2/philosophy).
* [Werewolf](https://f-droid.org/packages/org.secuso.privacyfriendlycardgameone/): Play Werewolf with your friends
* [TermBot](https://f-droid.org/packages/org.sufficientlysecure.termbot/): SSH client for use with smart cards

#### Updated apps

In total, 54 apps were updated this week. Here are the highlights:

* **[MuPDF viewer](https://f-droid.org/packages/com.artifex.mupdf.viewer.app/) 1.13.0 [fixes several security holes](https://mupdf.com/news.html). You should update ASAP.**

* [NetGuard](https://f-droid.org/packages/eu.faircode.netguard/) is back! The developer _removed all ads and nonfree dependencies_ as the most hassle-free way to comply with the [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation). Way to go! More info [here](http://forum.xda-developers.com/showpost.php?p=76586346&postcount=6915).

  Version 2.197 is already in the main repository as of now. If you've used the GitHub release (so you can benefit from the hosts blocking feature) you can export your settings, uninstall that version, reinstall from F-Droid, import back the settings and reload your hosts file.

  **Important**: If you switch, you will lose any pro features you may have bought.

* [OsmAnd~](https://f-droid.org/packages/net.osmand.plus/) beta 3.0 is now in the repository, although it won't be installed by default. If you'd like to give it a try, expand the versions tab and install it manually. We haven't had any negative reports so far, but remember this is still beta!

* [Yalp Store](https://f-droid.org/packages/com.github.yeriomin.yalpstore/) was [broken](https://forum.f-droid.org/t/yalp-store-not-able-to-get-apps-from-play-store/2906) by Google. 0.41 is now in the repository and should fix this.

* [Easer](https://f-droid.org/packages/ryey.easer/) is a tool to automate many things like switching off WiFi when leaving home, or setting the volume when a headset is connected. The update from 0.6 to 0.6.2 brings some UI changes, a screen unlock event, and a bunch of crash fixes.

#### Archived and Removed apps

No apps were removed.

#### In the next TWIF

What ends up in the next TWIF is all up to you! There are way too many app updates to keep track of them all, so we need your help to highlight the most interesting changes. And of course, we love to hear about all things involving F-Droid in some way.

Please tell us in the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum, or tag your update [#fdroid](https://mastodon.technology/tags/fdroid) on Mastodon. (And cc [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) to make sure it reaches our instance.) The deadline to the next TWIF is Thursday 12:00 UTC.

Feedback? Come talk to us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together. You can also join us on the [forum](https://forum.f-droid.org/), [toot on Mastodon](https://mastodon.technology/@fdroidorg), or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).
