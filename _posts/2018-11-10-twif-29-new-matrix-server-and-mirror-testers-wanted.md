---
layout: post
title: "TWIF 29: New Matrix Server and Mirror Testers Wanted"
edition: 29
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

In this edition: Lots of F-Droid news. We're looking for Mirror testers, and help with developing an auditing proxy. We are also setting up our own Matrix server, and have some news about Fairphone as a Service. In the app department, we have 12 new and {{ page.number_of_updated_apps }} updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Mirror testers wanted

We have everything needed to support mirrors in place and running. Now we just need users to use them! This is still beta, so please report any problems you have to either the [forum](https://forum.f-droid.org/t/call-for-testing-add-a-mirror-as-a-source-for-your-f-droid/4490) or the [admin issue tracker](https://gitlab.com/fdroid/admin/issues). To add a mirror, scan the QR code or click on it from your Android device, and send it to F-Droid. F-Droid will then prompt you to add it as a mirror to F-Droid.

These are the mirrors:

&nbsp;&nbsp;&nbsp;<a href="https://fdroid.tetaneutral.net/fdroid/repo?fingerprint=43238D512C1E5EB2D6569F4A3AFBF5523418B82E0A3ED1552770ABB9A9C9CCAB">
![fdroid.tetaneutral.net]({% asset posts/2018-11-10-twif-29-new-matrix-server-and-mirror-testers-wanted/fdroid.tetaneutral.net.png %})</a>
&nbsp;&nbsp;&nbsp;<a href="https://mirror.cyberbits.eu/fdroid/repo?fingerprint=43238D512C1E5EB2D6569F4A3AFBF5523418B82E0A3ED1552770ABB9A9C9CCAB">
![mirror.cyberbits.eu]({% asset posts/2018-11-10-twif-29-new-matrix-server-and-mirror-testers-wanted/mirror.cyberbits.eu.png %})</a>
&nbsp;&nbsp;&nbsp;<a href="https://bubu1.eu/fdroid/repo?fingerprint=43238D512C1E5EB2D6569F4A3AFBF5523418B82E0A3ED1552770ABB9A9C9CCAB">
![bubu1.eu]({% asset posts/2018-11-10-twif-29-new-matrix-server-and-mirror-testers-wanted/bubu1.eu.png %})</a>

#### Help wanted with auditing proxy

**[@uniq](https://chaos.social/@uniq)** has put together an [auditing proxy](https://gitlab.com/fdroid/fdroidserver/issues/418) that forces all downloads to match a trusted whitelist during the build process. In order for this to reliably work, it needs to be able to act on HTTPS downloads as well. We are looking for help from people with experience with MITMproxy or similar things so that we can put together a solid, trustworthy configuration.

#### Hourly website translation updates

We recently started a [project to streamline the translation process](https://forum.f-droid.org/t/calling-all-translators-new-project-to-streamline-translation-process/3877), with a specific focus on the website and the Android client. **[@\_hc](https://forum.f-droid.org/u/hans)** [announced](https://forum.f-droid.org/t/calling-all-translators-new-project-to-streamline-translation-process/3877/38) the first concrete improvement to this workflow: we now have hourly rebuilds of [https://staging.f-droid.org](https://staging.f-droid.org). If you are translating the website, the build process will check for updates once an hour.

#### Fairphone as a Service (FaaS)

[Commown](https://commown.fr) (website in French only, sorry) is a French cooperative that supports fair and sustainable electronics by buying, and then leasing [Fairphones](https://www.fairphone.com/en/) to their customers. They recently announced you can now choose between Fairphone OS (Android with Google apps) and Fairphone Open OS (AOSP without any proprietary app).

They preinstall several apps on the open version (F-Droid, Fennec, Silence, Amaze, etc.) so the user experience for beginners is better than only having the outdated AOSP system apps. All these apps are installed from F-Droid so they will continue to be updated by the F-Droid client.

More reading:

* [Commown at Solarimpulse](https://solarimpulse.com/companies/commown)
* [Commons as the model for the future](https://medium.com/@myriamboure/commons-the-model-of-post-liberal-capitalism-55375f052a22) (Medium.com link. Sorry again.)

#### F-Droid Matrix server

Several core F-Droid contributors use Matrix to communicate, both amongst themselves and with the F-Droid IRC rooms, which are bridged with Matrix. As Matrix became more popular for this, we've been building up our presence, establishing "real" rooms instead of the ones the bridge creates for us.

We've reached consensus within F-Droid that as the next step in this, we'd like to [set up our own Matrix server](https://gitlab.com/fdroid/admin/issues/94). We will be starting out small, only allowing core F-Droid contributors access, and only for the F-Droid rooms. **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** and **[Mathijs](https://forum.f-droid.org/u/mvgorcum)** have volunteered to administrate the server as independent F-Droid contributors. **[@\_hc](https://forum.f-droid.org/u/hans)** has contributed a VM for this purpose, and it is now in the process of being set up.

We'd also like to thank **Max Dor** for his very generous offer to host and administrate a corporate-quality Matrix setup, with all bells and whistles, as part of a sponsorship deal with [Kamax](https://www.kamax.io). However, at this point we chose to go with a minimal setup, for which we can rely on our own resources and independent contributors.

#### New apps

* **[Keikai Launcher](https://f-droid.org/packages/com.anpmech.launcher/)**: Fast, minimalistic launcher.
* **[Aria2App](https://f-droid.org/packages/com.gianlu.aria2app/)**
* **[Pretend You're Xyzzy](https://f-droid.org/packages/com.gianlu.pretendyourexyzzy/)**
* **[Share my number](https://f-droid.org/packages/com.github.characterdog.share_my_number/)**
* **[Gotify](https://f-droid.org/packages/com.github.gotify/)**: A client for receiving push notifications.
* **[Drowser](https://f-droid.org/packages/com.jarsilio.android.drowser/)**: Simple background app killer.
* **[CineLog](https://f-droid.org/packages/com.ulicae.cinelog/)**: Save reviews of movies.
* **[aRevelation](https://f-droid.org/packages/de.igloffstein.maik.aRevelation/)**: Password manager based on revelation password manager file format.
* **[Travel Mate](https://f-droid.org/packages/io.github.project_travel_mate/)**: A complete travel guide.
* **[wX](https://f-droid.org/packages/joshuatee.wx/)**: Weather app geared towards storm chasers, meteorologists and weather enthusiasts.
* **[YouTube Stream](https://f-droid.org/packages/org.thiolliere.youtubestream/)**: Get youtube stream and open it with local application.
* **[SuperFreezZ](https://f-droid.org/packages/superfreeze.tool.android/)**

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

Due to time shortage, apps lacking a changelog URL in their F-Droid metadata were skipped this week.

* **[Cythara](https://f-droid.org/packages/com.github.cythara/)** is a musical instrument tuner, and was updated from 2.8 to 2.9. This update adds cello tuning, sets chromatic tuning as the default, and fixes a scrolling issue in landscape mode.

* **[Apple Flinger](https://f-droid.org/packages/com.gitlab.ardash.appleflinger.android/)** is a funny single- and multiplayer game, where you use a slingshot to shoot with apples. This update from 1.5.3 to 1.5.5 adds 12 more winter levels, more stats on-screen, a list of translators in the credits screen, and several translation updates. Additionally, there is now a wiki page on the website describing how to create new levels.

* Are you sick of bloated non-free RSS readers that steal your personal information? Tired of convoluted syncing setups? Fed up having to create accounts everywhere? Try **[Feeder](https://f-droid.org/packages/com.nononsenseapps.feeder/)**! Version 1.8.0 removes the option to sync on Hotspots, fixes automatic synchronization not running on mobile, adds an option to sync when the app is opened, improves caching to reduce data use, improves sync speed, adds Simplified Chinese translation, and some smaller fixes.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)**, your full-featured Mastodon (and Peertube) client, was updated to 1.19.2. This update adds the ability to block a domain from a profile, adds support for "Boost to Original Audience". The light theme was reworked, and it also has an improved theme picker. In addition to that, there are many smaller UX improvements (still a work in progress), and a host of bug fixes.

* **[SolitaireCG](https://f-droid.org/packages/net.sourceforge.solitaire_cg/)** is an adaptation of Ken Magic's "Solitaire" for devices with few hardware buttons. Version 3.3 makes the upper right hand suit in large card art more visible. Other changes are fixed help file hyperlinks, now with back-to-top links. Under the hood, it now builds using gradle instead of ant. With big thanks to Rudy Sudrich for making this release a reality.

* **[Simpletask](https://f-droid.org/packages/nl.mpcjanssen.simpletask/)** was updated from 10.2.7 to 10.2.9, fixing a crash when (un)completing a task, fixing state of completion checkbox when task list changes, and fixing tags sorting.

* {{ page.featured }} **[Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/)** hides contacts away from apps stealing your contacts information, by keeping contacts safe in a different database. It handles magic like showing the person's name upon receiving a call. Version 5.0 makes call log entries more consistent by placing icons to either side, adds a "help" activity, puts all activities in portrait mode, and the "invalid number" error in Dialer is now shown in-line rather than as an alert.

* **[Tasks](https://f-droid.org/packages/org.tasks/)** was updated from 6.1.3 to 6.3.1, with a new location row in the task edit screen, location departure notifications, set CalDAV completion percentage and status, a new white theme color, new icons, new list and tag chips, and many other UI and UX improvements. Additionally, the minimum required Android version was bumped from 4.0.3 to 4.1.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
