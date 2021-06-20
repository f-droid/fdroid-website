---
layout: post
title: "TWIF 34: F-Droid is a Planet"
edition: 34
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 3
number_of_updated_apps: 59
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Planet F-Droid now exists, call for submissions for Planet F-Droid and first article of Izzy's F-Droid series available in English.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Planet F-Droid now exists

F-Droid now has [its own planet](https://fdroid.gitlab.io/planet/), thanks to the hard work of **[@vanitasvitae](https://gitlab.com/vanitasvitae)**, who single-handedly set it all up! A so-called "planet" site aggregates the blogs of community members (see [http://planet.fsfe.org](http://planet.fsfe.org) or [https://planet.jabber.org](https://planet.jabber.org) as examples). And if you've been secretly following along via [the forum](https://forum.f-droid.org/t/planet-f-droid-org-feed-aggregator-for-android-dev-related-blogs/4481), Planet F-Droid now also has [the blog of Gregor Santner](https://gsantner.net/), of **[Markor](https://f-droid.org/packages/net.gsantner.markor/)**, **[MemeTastic](https://f-droid.org/packages/io.github.gsantner.memetastic/)** and **[dandelion\*](https://f-droid.org/packages/com.github.dfa.diaspora_android/)** fame.

### Call for submissions for Planet F-Droid

Hello FOSS Android enthusiasts and project leads! Do you want your FOSS and Android related blog to be included in [Planet F-Droid](https://fdroid.gitlab.io/planet/)? Please have a look at the Planet's [inclusion rules](https://gitlab.com/fdroid/planet/wikis/inclusion-rules), or [read more about it](https://gitlab.com/fdroid/planet/wikis/Planet-F-Droid).

### First article of Izzy's F-Droid series available in English

**[@Izzy](https://forum.f-droid.org/u/izzy)** [writes](https://mastodon.technology/users/IzzyOnDroid/statuses/101210904206926714):

I've just put the first article of my F-Droid series online. "F-Droid: The privacy-friendly alternative to Google Play Store" can be found at [https://android.izzysoft.de/articles/named/fdroid-intro-1](https://android.izzysoft.de/articles/named/fdroid-intro-1).

The German article is also online now at the same location.

![Article Screenshot]({% asset posts/2018-12-13-twif-34-f-droid-is-a-planet/izzy_ct_fdroid_article_part_1.jpg %})

### New apps

* **[DeltaCamera](https://f-droid.org/packages/de.uwepost.android.deltacam/)**: Record movement (deltas) in one single image.
* **[AnLinux](https://f-droid.org/packages/exa.lnx.a/)**: Run Linux on Android without root access with the help of **[Termux](https://f-droid.org/packages/com.termux/)** and **[RoMote](https://f-droid.org/packages/wseemann.media.romote/)**. Several distros and WM/DE combinations are available.
* **[/d/gapps](https://f-droid.org/packages/org.droidtr.deletegapps/)**: Delete/disable gapps.
* **[PeerTube](https://f-droid.org/packages/net.schueller.peertube/)** PeerTube is a federated (ActivityPub) video streaming platform using P2P (WebTorrent) directly in the web browser.
* **[DecSync CC](https://f-droid.org/packages/org.decsync.cc/)** & **[spaRSS DecSync](https://f-droid.org/packages/org.decsync.sparss.floss/)** These apps use the [DecSync](https://github.com/39aldo39/DecSync)-libs to synchronize key-value mappings without a server. They cover the Contacts/Calendars and the RSS use cases. To start synchronizing, all you have to do is synchronize the directory "DecSync" located in the primary external storage, using for example [Syncthing](https://f-droid.org/packages/com.nutomic.syncthingandroid/).
* **[NoSurf for reddit](https://f-droid.org/packages/com.aaronhalbert.nosurfforreddit/)** Calls itself "the world's first **non-addictive** Reddit client", and offers ways to limit time wasting on reddit.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[Music Player GO](https://f-droid.org/packages/com.iven.musicplayergo/)** was [updated](https://github.com/enricocid/Music-Player-GO/releases) from 3.5.0.2 to 3.5.2.1 with code cleaning and simplifications, new scroller with touching the edge of the screen, minor changes to UI and layout, a new Turkish translation, smaller APK, and assorted bugfixes.

* {{ page.featured }} **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.36.0 to 1.39.0 and now has an art timeline! The buttons for boosting or favoriting are now animated, "create toot" button is hidden while scrolling, there is support for scheduling _boosts_ (toots could already be scheduled), and many bugs were fixed. Oh, and it should now have textual descriptions for everything, for visually impaired users.

* {{ page.featured }} **[Markor](https://f-droid.org/packages/net.gsantner.markor/)** comes with lots of changes in 1.5.0. I could write a summary, but you should really just check the [release blog post](https://gsantner.net/blog/2018/12/09/markor-release-v1.5.html) which explains everything in pictures! (And also in words.)

* **[Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/)** was [updated](https://gitlab.com/sultanahamer/OpenContacts/blob/HEAD/CHANGELOG) from 7.0 to 9.0, featuring a dark theme, support for phone numbers with symbols, delete all contacts, several UI and UX improvements and bugfixes, including an important fix for a crash in Android 8 (Oreo). **Please export and reimport all your contacts** in order for search to work. Apologies, but it's only a one-time thing.

* **[AndStatus](https://f-droid.org/packages/org.andstatus.app/)** [updated](http://andstatus.org/changelog.html) to 45.01, adding the "unread notifications" timeline. It also has improved handling of HTML content.

* **[SimpleEmail](https://f-droid.org/packages/org.dystopia.email/)** 1.3.0 brings a better layout for the message list, refresh message list, and moves the color picker account outside of advanced.

* Since we've mentioned SimpleEmail, its upstream app **[FairEmail](https://f-droid.org/packages/eu.faircode.email/)** got plenty of updates and fixes in the mean time, way too many to list here. What we can mention is that the app has lowered its device requirements so now it's compatible with Android 5 too.

* And still talking about e-mail, **[InboxPager](https://f-droid.org/packages/net.inbox.pager/)** got a big update to 4.0 bringing an UI update and an internal file manager.

* **[Conversations](https://f-droid.org/packages/eu.siacs.conversations/)** & **[Quicksy](https://f-droid.org/packages/im.quicksy.client/)** Since TWIF 26, version 2.3.4+fcr, the apps were updated continuously up to the current 2.3.9+fcr, fixing bugs and adding small improvements:
  * Fixed group chat mentions when nick ends in a dot, asking for permissions after direct share, CVE-2018-18467, re-sending failed files in group chats and misc bug fixes for Android 9.
  * Improved handling of bookmark nicks, long press on 'allow' or 'add back' snackbar to bring up 'reject', made PEP avatars public to play nice with the newly released Prosody 0.11, OMEMO stability improvements.
  * Added context menu options for long pressing avatar in 1:1 chat and send PM menu entry in anonymous MUCs.

* **[IceCatMobile](https://f-droid.org/packages/org.gnu.icecat/)** The free software rebranding of the latest Firefox-ESR release just got updated to version 60, besides the usual plethora of new features it also moves the UI to Photon, and so it drops support for Android 4.0.4 and older. Users of the Sync feature should keep an eye on [this bug report](https://savannah.gnu.org/bugs/?50960) if it suddenly doesn't work.

* **[Hacker's Keyboard](https://f-droid.org/packages/org.pocketworkstation.pckeyboard/)** After almost 2 years of missing updates the keyboard was now updated, no ground-breaking features, but mostly fixes and compatibility updates for the new Android versions.

### Removed apps

* **[Iven News Reader](https://f-droid.org/wiki/page/com.iven.lfflfeedreader)** was moved to the archive because the app has been marked as "deprecated" by its author.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
