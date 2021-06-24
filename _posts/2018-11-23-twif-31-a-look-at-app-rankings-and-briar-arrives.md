---
layout: post
title: "TWIF 31: A look at app rankings and Briar arrives"
edition: 31
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 16
number_of_updated_apps: 58
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: A look into app rankings and Briar arrives as reproducible build.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### A look into app rankings

**Mobilsicher** looked into how various app stores rank their apps in search results. F-Droid was mentioned as an option that deliberately uses a very simple ranking algorithm, although it's not very effective. [Article in German](https://mobilsicher.de/hintergrund/kritisch-hinterfragt-app-rankings-auf-android-und-ios).

#### New apps

* **[Image SMS](https://f-droid.org/packages/click.dummer.imagesms/)**: Send very small photos with long text sms and without mms or internet.

* **[The Kana Quiz](https://f-droid.org/packages/com.noprestige.kanaquiz/)**: A simple app to quiz the user on identifying japanese characters.

* The Pro versions of the **Simple Mobile Tools** are landing in F-Droid: **[Simple Contacts Pro](https://f-droid.org/packages/com.simplemobiletools.contacts.pro/)**, **[Simple File Manager Pro](https://f-droid.org/packages/com.simplemobiletools.filemanager.pro/)**, **[Simple Gallery Pro](https://f-droid.org/packages/com.simplemobiletools.gallery.pro/)** and **[Simple Notes Pro](https://f-droid.org/packages/com.simplemobiletools.notes.pro/)**. For background, see [this forum thread](https://forum.f-droid.org/t/simple-mobile-tool-are-becoming-paid/4553).

* **[KindMind](https://f-droid.org/packages/com.sunyata.kindmind/)**: Be aware of sad feelings and unmet needs.

* **[Quoting Stars](https://f-droid.org/packages/de.fzi.bettyrieckmann.quotingstars/)**: App for silent communications 2017.

* **[Wave Lines Wallpaper](https://f-droid.org/packages/de.markusfisch.android.wavelines/)**: Wavy wallpaper.

* **[Quicksy](https://f-droid.org/packages/im.quicksy.client/)**: A spin off of the popular Jabber/XMPP client [Conversations](https://f-droid.org/packages/eu.siacs.conversations/) by the same developer.  It adds automatic contact discovery.  Sign up with your phone number and Quicksy will automatically suggest possible contacts based on phone numbers in the local address book. This solves the "empty contact list" issue that a user faces on a new XMPP account. Unlike other messenger applications that use phone numbers, Quicksy keeps the federated nature of XMPP intact.

* **[Aruba Networks Login](https://f-droid.org/packages/io.mkg20001.arubanetworkslogin/)**

* **[Acastus Photon](https://f-droid.org/packages/name.gdr.acastus_photon/)**: An online address/poi search for navigation apps.

* {{ page.featured }} **[Briar](https://f-droid.org/packages/org.briarproject.briar.android/)** has finally landed! This is a messenger and social network app that doesn't depend on the internet (but can take advantage of it when available), exchanging messages between phones directly. It is comparable to **[Manyverse](https://f-droid.org/packages/se.manyver/)** in that way. Thanks to **[@Tovok7](https://blog.grobox.de)** setting up [disorderfs](https://salsa.debian.org/reproducible-builds/disorderfs), this now builds [reproducibly](https://reproducible-builds.org), which the author requires for us to be allowed to publish it.

* **[XScreenSaver](https://f-droid.org/packages/org.jwz.xscreensaver/)**: The famous collection of screen savers shipped on most linux and unix systems, now available on your mobile phone!

* **[OpenTopoMap Viewer](https://f-droid.org/packages/org.nitri.opentopo/)**: Opentopomap viewer with gpx import.

* **[UserLAnd](https://f-droid.org/packages/tech.ula/)**: Easiest way to run gnu/linux distros on android - no root required.

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.major }} **[MinCal Widget](https://f-droid.org/packages/cat.mvmike.minimalcalendarwidget/)** was updated from 0.4.0 to 1.0.0, citing "technical improvements". It now requires at least Android 8.0 to run, which is a _huge_ jump up from 4.4.

* {{ page.major }} A major update for **[Scarlet FDroid](https://f-droid.org/packages/com.bijoysingh.quicknote/)**, the rich note-taking app formerly known as **Material Notes**. It was updated from 4.5.4 to 5.9.7 bringing improved search (by tags) with color, improved export features allowing markdown, lots of new features, and new UX for note options and all menus.

* **[Music Player GO](https://f-droid.org/packages/com.iven.musicplayergo/)** is a very slim music player with a colorful and simple "Unified UI". It was updated from 3.1.3.2 to 3.4.2, with UI refinements, adding a stroke to the selected album, theme changes, a search bar, and more.

* **[aRevelation](https://f-droid.org/packages/de.igloffstein.maik.aRevelation/)**, a password manager, updated to 1.9 with a fix for Nokia 8 phones and other minor bugfixes.

* **[Tutanota](https://f-droid.org/packages/de.tutao.tutanota/)** was updated from 3.37.2 to 3.40.3 with lots of changes. Now with multi-select in search view, storing of IP addresses changed to opt-in, security hardening, cleaning of content pasted to mail/signature editors, and many UI/UX changes and fixes.

* Also a notable update for **[oandbackup](https://f-droid.org/packages/dk.jens.backup/)**, moving from 0.2.13 (released in March this year) to 0.3.4-universal. This adds a binary written in Rust to handle tasks which can only be done as root, and other improvements to the build.

* **[Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/)**, the secure contact list, released 7.0 with a crash fix for lineageos, help text for caller ID, a fix for notifications on missed calls, and a "what's new" item in the main menu.

* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)**, an alternative client for the F-Droid repository, was updated from 0.1.4 to 0.2.1, fixing the layout on very small and very large screens, fixing the update button for installed apps, a loading animation for loading images, 2 new main screen views, and other UI improvements and fixes.

* **[The Light](https://f-droid.org/packages/org.hlwd.bible/)**, multi-language bible, was updated to 3.6, adding support for Android 8.0. The widget will be ported to Android 8.0 later, and is disabled for now.

* **[AtmosphereLogger](https://f-droid.org/packages/org.tamanegi.atmosphere/)** is an atmospheric pressure logger using your device's barometer sensor. It came back to life after 2 years, going from 0.1.4 to 0.2.3. Unfortunately it does not have published changelogs, but it appears to have grown an export feature at least.

* **[Transistor](https://f-droid.org/packages/org.y20k.transistor/)**, a bare-bones app for listening to internet radio, released 3.1.0, featuring a new app icon, improved handling of links from radio-browser.info, a new color scheme, and several bug fixes.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
