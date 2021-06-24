---
layout: post
title: "TWIF 24: The End of Logging As We Know It"
edition: 24
author: "Coffee"
authorWebsite: "https://open.source.coffee"
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 25
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

A light edition this week, due to the update process being stuck since Monday. This week we learn of BotBot.me shutting down, 4 new apps and {{ page.number_of_updated_apps }} updates, with a major update for SnoopSnitch.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### BotBot.me closing its doors

Citing the new [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) laws, and lack of development since 2015, the IRC logging service [BotBot.me](https://botbot.me) will be [shutting down on November 5th, 2018](https://lincolnloop.com/blog/saying-goodbye-botbotme/), after 6 years of service. BotBot.me is what logs our public IRC rooms, [#fdroid](https://botbot.me/freenode/fdroid/) and [#fdroid-dev](https://botbot.me/freenode/fdroid-dev/). We are currently thinking about what to do about the old logs, and what we should replace it with, if anything at all.

#### New apps

* **[Nomad](https://f-droid.org/packages/com.dfa.hubzilla_android/)**: This is an unofficial client for the distributed social network Hubzilla
* **[X11-Basic](https://f-droid.org/packages/net.sourceforge.x11basic/)**: X11-Basic is a dialect of the BASIC programming language with graphics capability. It has a very rich command set, though it is still easy to learn.
* **[Disroot App](https://f-droid.org/packages/org.disroot.disrootapp/)**: Disroot app is like your Swiss Army knife to the Disroot platform
* **[AFReplacer](https://f-droid.org/packages/ru.ifproject.android.afr/)**: Replace Amazfit Bip watchfaces in Mi Fit

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[Apple Flinger](https://f-droid.org/packages/com.gitlab.ardash.appleflinger.android/)** is a game inspired by Angry Birds. Version 1.5.0 adds achievements, and fixes a scoring bug.

* **[WaveUp](https://f-droid.org/packages/com.jarsilio.android.waveup/)**: Wake up your phone - switch the screen on - when you wave over the proximity sensor. Version 2.3.0 has a new "excluded apps" list. 

* {{ page.major }} **[SnoopSnitch](https://f-droid.org/packages/de.srlabs.snoopsnitch/)** was updated from 1.0.3 to 2.0.7. SnoopSnitch is a tool to check mobile network security on compatible phones with Root access. This update introduces the Android patch analysis feature, and reduces battery consumption. Also includes various UI/UX improvements, bugfixes and stability improvements.

* **[FairEmail](https://f-droid.org/packages/eu.faircode.email/)** was updated from 0.69 to 0.71, now sending plain text as alternative, and with updated tools and libraries, updated translations, and miscellaneous small improvements and bug fixes.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)**, the Mastodon client, clocks in with 1.13.6 at F-Droid. Conversations can now be opened from remote instances, and fit preview media are displayed in a 2x2 grid. Issues with URLs, filters and notifications were addressed and some crashes were fixed.

* **[Authorizer](https://f-droid.org/packages/net.tjado.passwdsafe/)** releases its first stable version, 0.3.0, after more than a year of inactivity. Authorizer turns an old smartphone into a hardware password manager, emulating an USB keyboard. This release now requires Android 5.0 to run (up from 4.0) and adds an OTP feature, placeholder feature, asymmetric encrypted backup, privacy policy, and several bug fixes and smaller changes.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to **[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)** and remember to tag with **[#TWIF](https://mastodon.technology/tags/twif)**. Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum](https://forum.f-droid.org/)**.
