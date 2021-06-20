---
layout: post
title: "TWIF 28: NewPipe YouTube Client Edition"
edition: 28
author: "Blendergeek"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 89
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:matrix.org](https://matrix.to/#/#fdroid:matrix.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Not too much occured this week but we do have a good number of updated apps including updates to the much loved NewPipe YouTube client and a streaming music app for YouTube too. All total there are 6 new and {{ page.number_of_updated_apps }} updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.


#### Added Apps

* [MinCal Widget](https://f-droid.org/packages/cat.mvmike.minimalcalendarwidget/): Minimal month calendar widget
* [SauceNAO](https://f-droid.org/packages/com.luk.saucenao/): Unofficial SauceNAO client
* [ForceDoze](https://f-droid.org/packages/com.suyashsrijan.forcedoze/): Enable Doze mode immediately after screen off and turn off motion sensing
* [baresip](https://f-droid.org/packages/com.tutpro.baresip/): baresip SIP client
* {{ page.featured }} For all people who love streaming music from YouTube, [MusicPiped](https://f-droid.org/packages/deep.ryd.rydplayer/) is just the app for you. This app allows you to browse youtube and stream music directly in a clean, material design interface.
* [Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/): Hide contacts away from apps stealing your contacts information


#### Updated Apps

* {{ page.major }} [Rocket.Chat](https://f-droid.org/packages/chat.rocket.android/) version 3.0.0 entered F-Droid this week. Messages are now stored in an offline database so users can view them without a network connection. Emojis received better support with better autocomplete and reactions can now use custom emojis. Security has been improved with a fix for email based 2 factor authentication. Other new features include per channel draft messages collapse/uncollapse for text attachments on messages. To see the full set of changes view the [changelog](https://github.com/RocketChat/Rocket.Chat.Android/releases).
* [OpenLauncher](https://f-droid.org/packages/com.benny.openlauncher/) is an alternative "homescreen" app for android. Version 0.6.0 fixes some issues with gestures while also adding more color preferences and better backup/restore options for settings.
* The SimpleMobileTools continue to get better. Release 5.1.1 of [Calendar](https://f-droid.org/packages/com.simplemobiletools.calendar/) brings pull-to-refresh for CalDAV events along with better filters and colors support. Like all 5.x releases of SimpleMobileTools apps, the minimum supported Android version is now 5.0.
* In addition to a higher minimum suported Android version, [Contacts](https://f-droid.org/packages/com.simplemobiletools.contacts/) 5.1.0 brings an optional nickname field, an option to show only contacts with phone numbers, a fix for disappearing contacts and more!
* [StreetComplete](https://f-droid.org/packages/de.westnordost.streetcomplete/) is a fun, easy app for improving OpenStreetMap. Version 8.3 provides several enhancements for quests involving accessibility and enhances the opening hours form along with a few other improvements. 
* [FairEmail](https://f-droid.org/packages/eu.faircode.email/) has seen a bit of development since 1.106. Several security related feautures have been added including encryption support, even for attachments. An advanced setting was also added to allow users the choice to make insecure connections without passwords. 
* [Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/) is a rebrand of Mozilla Firefox for F-Droid. Version 63 landed in F-Droid this week, now targeting Android Oreo. New features include  picture in picture video support, notification channels, and a Canadian English (en-CA) locale. 
* {{ page.featured }} [NewPipe](https://f-droid.org/packages/org.schabi.newpipe/) is a client for the popular video streaming site YouTube. Version 0.14.2 brought with it better layouts for tablets and a list layout for downloaded media. Further, users can now share subscribed channels easily from the longpress menu.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
