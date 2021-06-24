---
layout: post
title: "This Week in F-Droid, Week 27"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
---

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* We have gradle 4.8 on the buildserver now, which fixes some builds.

* Our [OsmAnd~](https://f-droid.org/packages/net.osmand.plus/) build got even more complicated, but now includes a patched library which fixes Persian font rendering. Many thanks to [Hague](https://gitlab.com/Hague) for working on it.

* There have been some hiccups during the publishing stage lately. New apps get built, but not published. We are [working on it](https://gitlab.com/fdroid/fdroidserver/issues/509).

#### Community News

* [Quaap](http://quaap.com) says: I’ve created a “My favourite apps on F-Droid” article: [http://quaap.com/D/use-fdroid](http://quaap.com/D/use-fdroid). It’s mostly something I use to evangelize F-Droid to non-FOSS people, because sometimes the sheer volume of apps available leads people to wonder where to start.

* The European Parliament has [voted against the new copyright law proposal](https://blog.mozilla.org/netpolicy/2018/07/05/copyrightplenary/), which would have forced most platforms to add mandatory upload filters, and would have required websites to buy a license to link to news sites. It will be under vote again in September.

#### New apps

* [AdGuard Content Blocker](https://f-droid.org/packages/com.adguard.android.contentblocker/): Block advertisements on Yandex Browser and Samsung Internet browser.
* [Flavordex](https://f-droid.org/packages/com.ultramegasoft.flavordex2/): Tasting journal for keeping track of things you tasted. Comes with preloaded categories for beer, wine, whiskey, and of course _coffee_, and is fully customizable if none of those fit your needs.
* [Fairphone 1 Launcher](https://f-droid.org/packages/community.fairphone.launcher/): Launcher originally designed for the Fairphone 1
* [Funktrainer](https://f-droid.org/packages/de.hosenhasser.funktrainer/): Learn for your German ham radio exam

#### Updated apps

In total, 49 apps were updated this week. Here are the highlights:

* Another app changed package ID. [Flym](https://f-droid.org/packages/net.frju.flym/) changed from [net.fred.feedex](https://f-droid.org/packages/net.fred.feedex/) to [net.frju.flym](https://f-droid.org/packages/net.frju.flym/). The remedy is the same as last week's. In order to update, and to continue receiving updates, you will need to uninstall and reinstall [Flym](https://f-droid.org/packages/net.frju.flym/) once. Remember to export your feeds as an OPML file before uninstalling. You can also have both installed side by side until the new app is set up and working to your satisfaction.

* The [Wikipedia](https://f-droid.org/packages/org.wikipedia/) app became about 5mb smaller by excluding some unused native library architectures, courtesy of [Bubu](https://forum.f-droid.org/u/Bubu).

* [LaunchTime](https://f-droid.org/packages/com.quaap.launchtime/) launcher/homescreen was updated to version 0.7.6 to fix some Oreo issues and beta-enable some Oreo features like Pinned Shortcuts.

* [AnySoftKeyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/) updated (to 1.9.2055) and so did some of its language packs: [Brazilian](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.brazilian/), [Norwegian](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.norwegian/) [Spanish](https://f-droid.org/packages/com.anysoftkeyboard.languagepack.spain/), [Czech](https://f-droid.org/packages/org.herrlado.ask.languagepack.czech/).

* [twitlatte](https://f-droid.org/packages/com.github.moko256.twitlatte/) 1.3.0 now supports TLSv1.2 on Android 4.4 devices. If you have one of those and twitlatte was failing to connect to your favourite instance, you might want to give this app another try. Other improvements include the ability to open links in an external browser, highlight of the selected account on the drawer, and bug fixes.

* [Gallery](https://f-droid.org/packages/com.simplemobiletools.gallery/) 4.3.1 brings a recycle bin, grouping media thumbnails by different criteria, and assorted UI and stability improvements.

* [Tremotesf](https://f-droid.org/packages/org.equeim.tremotesf/) is a remote GUI for the [Transmission BitTorrent client](https://transmissionbt.com). Version 1.7.0 can show available free space when adding torrents, disable finished torrent notifications, notify about added torrents, and shows the donation dialog once two days after install.

#### In the next TWIF

If you just released a significant update and want it to get some attention here, please get in touch. There are way too many app updates to keep track of them all, so we need your help to highlight the important ones. And of course, if you're doing anything involving F-Droid in some way, we love to hear about it!

Please tell us in the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum, or toot us at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and tag with [#TWIF](https://mastodon.technology/tags/twif). The deadline to the next TWIF is Thursday 12:00 UTC.

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
