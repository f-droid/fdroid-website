---
layout: post
title: "TWIF 17: The reproducible builds and encrypted e-mail edition"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
---

This Week In F-Droid 17, Week 33, 2018

In this edition: Voting on Fennec icon, Mattermost advocacy, USB/SD card swap demonstrated, fixing OsmAnd~, Featured badge, using custom ROMs, and integrating F-Droid with the fediverse. In apps, Tutanota is in and the reproducible builds Öffi and Briar finally dropped.
<!--more-->

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* Voting on the **Fennec icon** has started at last! After stalling out due to lack of manpower, [Nuntius](https://forum.f-droid.org/u/Nuntius) has graciously offered to run the vote. Please [cast your vote on one of these great icons](https://forum.f-droid.org/t/poll-vote-on-new-icon-for-fennec/3513)!

* In the [previous TWIF]({{ site.baseurl }}{% post_url 2018-08-10-twif-16-the-note-taking-todo-text-editor-edition %}), we mentioned how **[Rocket.Chat](https://rocket.chat)** merged **[@Bubu](https://forum.f-droid.org/u/Bubu)**'s FOSS build flavor. If you would like the same to happen for **Mattermost** so it can be included in F-Droid, please add your voice [here](https://github.com/mattermost/mattermost-mobile/issues/566) or [here](https://mattermost.uservoice.com/forums/306457-general/suggestions/14836608-build-android-app-without-google-play-services).

* **[@\_hc](https://forum.f-droid.org/u/hans)** presented his [USB OTG](https://en.wikipedia.org/wiki/USB_On-The-Go) and [SD card](https://en.wikipedia.org/wiki/Secure_Digital) swap demo at the [Mozilla WINS competition](https://wirelesschallenge.mozilla.org). You can see the video [here](https://youtu.be/FOWrappjLsY?t=2h2m12s). (The [Guardian Project](https://guardianproject.info) chunk lasts about 8 minutes.)

* Since there are few active contributors to the **F-Droid client** right now, **[@\_hc](https://forum.f-droid.org/u/hans)** has been trying to polish things up so that it'll be stable for a while without regular work. We would definitely prefer to have more people contributing, though!

* **[OsmAnd~](https://f-droid.org/packages/net.osmand.plus/)** had two build failures this week. **[@hague](https://gitlab.com/Hague)** has hopefully fixed this for 3.1, with assistance from **[@Bubu](https://forum.f-droid.org/u/Bubu)**.

* This edition of TWIF has an experimental "Featured" badge in front of some apps. Let us know how you like it, and if there's anything we can do to improve/tweak its appearance.

#### Community News

* **[@chinmayamahesh](https://mastodon.xyz/@chinmayamahesh)** wrote a [quick guide](https://chin123.gitlab.io/fossandroid.html) on how to free your phone with the help of custom ROMs and F-Droid.

* **[@codingquark](https://mathstodon.xyz/@codingquark)** also [wrote his thoughts](https://codingquark.com/floss/2018/07/04/android-floss-life.html) on custom ROMs, exploring how far one can go about being FLOSS-only on Android. If you have questions or improvements, they would very much appreciate your feedback.

* **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** wrote down [an idea for integrating F-Droid repositories](https://gitlab.com/NicoAlt/fdroidpub/blob/master/README.md#fdroidpub) with the [fediverse](https://en.wikipedia.org/wiki/Fediverse). This could finally offer a way for people to comment on apps, as well as produce opt-in statistics about an app's popularity, creating something that is truly more than the sum of its parts. You are invited to [the discussion](https://forum.f-droid.org/t/fdroidpub-let-apps-in-f-droid-toot-to-the-fediverse/3553)!

#### New apps

* **[Simple ToDo](https://f-droid.org/packages/apps.jizzu.simpletodo/)**: To-Do / Task list with beautiful minimalistic design and reminders

* **[Device Locator](https://f-droid.org/packages/at.bitfire.devicelocator/)**: Android lost/stolen device locator which does not require Internet access

* **[VlcFreemote](https://f-droid.org/packages/com.nicolasbrailo.vlcfreemote/)**: Remotely control a VLC server

* **[Event Sync for Facebook](https://f-droid.org/packages/cz.dvratil.fbeventsync/)**: Sync your Facebook Events into your calendar

* {{ page.featured }} **[Öffi](https://f-droid.org/packages/de.schildbach.oeffi/)** made it in [at last]({{ site.baseurl }}{% post_url 2018-07-21-twif-13-public-transport-edition %})! For those who haven't been keeping up, Öffi is an all-in-one app for public transit. Like **[Transportr](https://f-droid.org/packages/de.grobox.liberario/)**, but completely different. Built [reproducibly](https://reproducible-builds.org) so you can switch seamlessly from Öffi's private repository to F-Droid main without uninstalling!

* {{ page.featured }} **[Tutanota](https://f-droid.org/packages/de.tutao.tutanota/)** has [dropped on F-Droid](https://tutanota.com/blog/posts/open-source-email)! We are happy to see how enthusiastic Tutao, the company behind Tutanota, is about F-Droid and free software, having [rewritten their app from scratch](https://tutanota.com/blog/posts/secure-mail-open-source) so it could be included in our main repository. Furthermore, they take special measures to avoid tracking you, and end-to-end encryption and two-factor authentication are core features.

  In all fairness, many features work best between Tutanota users, and interoperability with regular e-mail is more limited, as you might expect. If you are looking for a privacy-respecting alternative to gmail with built-in encryption support, this is definitely worth checking out though.

  **Important**: Those who want to switch from the Play Store version to the F-Droid version need to uninstall Tutanota before installing it from F-Droid.

* **[GPSd Client](https://f-droid.org/packages/io.github.tiagoshibata.gpsdclient/)**: Service to forward NMEA messages to a GPSd server

* **[OSMTracker](https://f-droid.org/packages/net.osmtracker/)**: GPS Track Recorder

* **[Briar](https://f-droid.org/wiki/page/org.briarproject.briar.android)** also finally made it! Unfortunately it was published straight to the archive as we can only build the older version 1.0.1 of this app for now. The solution lies in upgrading the build server to Debian Stretch. If you want to play with it, you'll need to enable the F-Droid archive in your repository settings. Or you can add the [Briar repository](https://briarproject.org/fdroid.html) and get access to the latest version. Oh yeah, Briar is built reproducibly, and [here's the how and why](https://blog.grobox.de/2018/building-briar-reproducible-and-why-it-matters/).

#### Updated apps

In total, 72 apps were updated this week. Here are the highlights:

* **[Vanilla Music](https://f-droid.org/packages/ch.blinkenlights.android.vanilla/)** is a music player with a simple interface similar to the stock music player. Version 1.0.70 has an option to synchronize m3u playlists, can read artwork from embedded tags, and now has an option to scroll to the current song in the queue view.

* **[Delta Chat](https://f-droid.org/packages/com.b44t.messenger/)** is an instant messenger using e-mail as its transport. Version 0.20.0 improves reliability with size checks before sending videos, files and other attachments, retries an appropriate number of times on sending problems, detects size-related problems and does not retry, shows message errors in the message info, and more.

* Big update from 5.6.0 to 5.8.8 for **[Persian Calendar](https://f-droid.org/packages/com.byagowi.persiancalendar/)**. The Persian calendar is not supported by Android natively, and that is where this app comes in. It can now show device calendar events and birthdays with search capability, adds an "add an event" button, and will not play Athan when on a phone call, doesn't always need to restart on coming back from preferences, and lots of other improvements and fixes.

* **[Taskbar](https://f-droid.org/packages/com.farmerbb.taskbar/)** has a major release out at 4.0. This app puts a start menu and recent apps tray on top of your screen. Freeform now works on Android Pie (9)! There is improved tasker support to show/hide the Taskbar, toggle the start menu and toggle the dashboard. Also includes better handling of options such as default window sizes, faster app switching, a letter popup to fast scrollbar on start menu, and many other small visual tweaks and improvements.

* **[Suntimes](https://f-droid.org/packages/com.forrestguice.suntimeswidget/)** had a big update to 0.9.0. This update switches to a different data source (by default) which supports altitude-based refinements. Enhancements to the data source selector, data sources (plugins), add elevation to all default locations and an elevation UI, custom action for long-press, tons of new permissions, _world map displaying day/night and moonlight_, and many other improvements, fixes, and translation updates.
 
* **[Cythara](https://f-droid.org/packages/com.github.cythara/)** is a musical instrument tuner. This update to 2.8 enables installation on external storage. Other recent updates include a new German translation and a new logo.

* **[twitlatte](https://f-droid.org/packages/com.github.moko256.twitlatte/)** is a client for Twitter, Mastodon and Pleroma. Version 1.5.0 adds configuration switches to show images of quoted tweet on timeline, show tweet count per 24 hour on trends, collapse/expand text of toot having content warning, show custom emojis at user name, and contains many other improvements as well as some bug fixes.

* **[QKSMS](https://f-droid.org/packages/com.moez.QKSMS/)** is the most beautiful replacement for the stock AOSP messaging app you’ve ever used. This update from 3.4.2 to 3.4.5 adds enhanced logging support, customizable swipe conversation actions, invite friends, can delete messages from notification, and several improvements and bug fixes such as better scrolling performance throughout the app.

* **[Vespucci](https://f-droid.org/packages/de.blau.android/)** is an [OpenStreetMap](https://www.openstreetmap.org) editor. Version 11.0.2.0 updates imagery and translations, adds maxspeeds to geocontext for PT and CZ, updates OH Fragment, protects against crash when layouting empty preset views, fixes regression restoring state in PropertyEditor, tries to avoid crash with null Context in PresetSearch, and adds conveying and priority to direction dependent keys.

* Everybody's favourite app, **[Easy xkcd](https://f-droid.org/packages/de.tap.easy_xkcd/)**, joins the list of apps sporting an [adaptive icon](https://developer.android.com/guide/practices/ui_guidelines/icon_design_adaptive). Other additions are a simplified Chinese translation, fixed What-if thumbnails, and Chrome Custom Tabs can now be disabled in the settings. 

* **[Commons](https://f-droid.org/packages/fr.free.nrw.commons/)** is an app to upload images to Wikimedia Commons. It was updated from 2.7.2 to 2.8.1, adding automatic Wikidata p18 edits upon Nearby upload, explore feature to browse other Commons images, Achievements feature to see current level and upload stats, quiz for users with high deletion rates, and more.

* Version 0.8.13 of the group messenger **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** is out, adding a previewer to preview media before sending it into a room, _replies_, autocompletion for slash commands, improved external keyboard support for newer Androids, and [many other changes, fixes and improvements](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst#changes-in-riot-0813-2018-08-09).

* {{ page.featured }} **[Markor](https://f-droid.org/packages/net.gsantner.markor/)**, a [markdown](https://commonmark.org) based text editor, released version 1.0.0, with all new description and screenshots in F-Droid! Markor now supports an additional export for calendar appointments, has improved widget and [SD card](https://en.wikipedia.org/wiki/Secure_Digital) handling, and better separator placement in ShareInto, among other things. A blog post detailing the 1.0.0 release should appear on the app's [website](https://gsantner.net/project/markor.html) soon.

* **[Gadgetbridge](https://f-droid.org/packages/nodomain.freeyourgadget.gadgetbridge/)** lets you use your Pebble/Mi Band/Amazfit Bip/Hplus device without the vendor's closed source application and without the need to create an account and transmit any of your data to the vendor's servers. Version 0.29.0 adds initial support for the ID115 and Lenovo Watch9, now shows a splash screen on startup, vertically aligns device icon in main activity, untested support for the google clock application, and improvements for Amazfit Cor and Bip.

* **[Tremotesf](https://f-droid.org/packages/org.equeim.tremotesf/)** is a remote control app for the [Transmission](https://transmissionbt.com) BitTorrent client. 1.8.0 adds support for Android 9 (Pie) and the ability to reannounce torrents. Also improved support for self-signed certificates, better behavior when disconnecting from server, and prevents crashing on saving servers.

* **[Video Transcoder](https://f-droid.org/packages/protect.videoeditor/)** was updated from 0.11 to 0.12, extending support to Android 4.4! (Previously 5.0+) Video Transcoder lets you encode videos into different formats, trim videos, and extract audio, right on your own phone without connecting to the internet. This update also adds support for custom video resolutions, removes hard-coded video resolutions and only displays the original resolution with 1/2 and 1/4 resolutions.

#### In the next TWIF

Hey there, developers! Do you know what would be a good thing to do for your project? [Keep a changelog](https://keepachangelog.com)! It lets humans quickly understand what's changed in your software. If there's anything of note in there, you might even see it featured in the next TWIF!

As great as changelogs are, don't forget to send in your tips! There are way too many app updates to keep track of them all, and we'd love your help in highlighting the important ones. And of course, if you're doing anything involving F-Droid in any way, tell us about it!

Send tips to [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) and remember to tag with [#TWIF](https://mastodon.technology/tags/twif). Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is Thursday 12:00 UTC.

#### Feedback

Got Feedback? We are very tootable at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon. If you'd like to have a chat, you can find us in #fdroid on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the [forum](https://forum.f-droid.org/).
