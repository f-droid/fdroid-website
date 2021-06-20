---
layout: post
title: "TWIF 27: New Servers and First Alpha Release of F-Droid 1.5"
edition: 27
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 32
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:matrix.org](https://matrix.to/#/#fdroid:matrix.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Two new heavy duty servers, first alpha release of F-Droid 1.5, metadata cleanup, automatic buildserver setup, Portuguese Courts rule against Google, and F-Droid confirmed malware-free. There are 4 new and {{ page.number_of_updated_apps }} updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Two new servers from the GCC Compile Farm Project

Many thanks to the [GCC Compile Farm Project](https://cfarm.tetaneutral.net), who have arranged two bare-metal servers for F-Droid, each with 16 cores, 145 GB RAM, and 2.6 TB disk. These are actually old Facebook machines, but the specs are still pretty impressive! And this is _in addition to_ the [F-Droid mirror from Tetaneutral]({{ site.baseurl }}{% post_url 2018-10-12-twif-25-tor-browser-matrix-room-enhancements-and-mirror-beta-testing %}#beta-mirror-up-for-testing).

The _GCC Compile Farm Project_ is a facilitator for free software developers to get access to resources. The management system for this project is hosted by [Tetaneutral](https://tetaneutral.net), and the machines themselves are hosted by various organizations around the world. These two machines will actually be hosted by the [Oregon State University Open Source Lab](https://osuosl.org) (OSUOSL).

For people who will be working with them: Remember that these machines have real hard disks, not running in RAID configuration. They should only hold disposable content, as the hard disks could fail.

#### First alpha of F-Droid client 1.5 released

F-Droid client 1.5-alpha0 is out with a new ROM feature. There is now [a way to pre-install F-Droid with additional repositories](https://gitlab.com/fdroid/fdroidclient/merge_requests/705). These repositories can only be added, and can't override the main f-droid.org repositories. Also, the user is free to disable and delete, so this is only for the initial setup.

So for example, Lineage could supply an image with a standard F-Droid APK pre-installed, and have it preconfigured with a specific repository. Or this could be Replicant, Fairphone, etc. This feature was designed in cooperation with Emteria, who largely implemented it, with substantial contributions from F-Droid people.

#### F-Droid metadata cleanup

**[@Izzy](https://forum.f-droid.org/u/izzy)** has been working hard behind the scenes, doing the dirty grunt work that nobody else wants to do. In [this round](https://gitlab.com/fdroid/fdroiddata/issues/1414), he is removing all the website links which merely point at the source code.

If you follow the "Website" link from an app's description page, it should lead to a real website. Otherwise, it should be absent. Our metadata is full of cases where the website links to the source code, either directly duplicating the "Source code" link, or pointing somewhere very similar, for example to the README file. This work is fixing that, and unifying the way in which we link to things, which makes for a smoother experience.

#### Progress with automatic buildserver setup

This week we created the new [fdroid-bootstrap-buildserver](https://gitlab.com/fdroid/fdroid-bootstrap-buildserver) project in GitLab. This project holds the [ansible](https://en.wikipedia.org/wiki/Ansible_%28software%29) script responsible for setting up and configuring a buildserver fully automatically. It has already successfully set up two buildservers. Once the script can do everything, which is quite close, the whole buildserver setup, including host and guest, will be recreatable and thus disposable. This is huge for us, especially in combination with the news above.

#### Portuguese Courts rule against Google on behalf of Aptoide

Aptoide is an alternative app store. Incidentally, the one the F-Droid app was originally forked from. Apparently Google have been remotely removing/hiding the Aptoide app store on over 2.2 million devices in the last 60 days.

Fortunately, the Portuguese Courts ruled that Google has to stop doing that. This isn't the end of it, as Aptoide will also be filing for damages caused by this. Read the full story [here](https://www.prnewswire.com/news-releases/aptoide-eu-national-court-rules-against-google-in-anti-trust-process-821883497.html).

#### Independent academic confirmation that F-Droid is free of malware

We only just learned of this, although the study was actually conducted in 2017. We now have another independent, academic confirmation of 0 malware in F-Droid. Download the results of the study [here (PDF)](https://nsl.cs.waseda.ac.jp/wp-content/uploads/2018/04/submitted_wama2017.pdf).

#### New apps

* **[Hide "running in the background" Notification](https://f-droid.org/packages/com.iboalali.sysnotifsnooze/)**: Hide the annoying "running in the background" notification.
* **[lWS](https://f-droid.org/packages/net.basov.lws.fdroid/)**: Lightweight web server (lws).
* **[lWS QR](https://f-droid.org/packages/net.basov.lws.qr.fdroid/)**: Lightweight web server qr code generator plugin (lws qr).
* **[Weather Forecast](https://f-droid.org/packages/uk.org.boddie.android.weatherforecast/)**: View weather forecasts from yr.no.

#### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* {{ page.major }} More updates for the simple mobile tools. This time **[Calculator](https://f-droid.org/packages/com.simplemobiletools.calculator/)**, **[Music Player](https://f-droid.org/packages/com.simplemobiletools.musicplayer/)** and **[Notes](https://f-droid.org/packages/com.simplemobiletools.notes/)** updated to major version 5, again bumping up the minimum required Android from 4.1 to 5.0 and replacing the G+ button with Reddit.

* **[Periodical](https://f-droid.org/packages/de.arnowelzel.android.periodical/)** was updated from 1.16 to 1.18, bringing updated translations from Crowdin, and reverting language codes back to their generic form to avoid missing translations when a regional language setting is used.

* {{ page.major }} **[Zapp](https://f-droid.org/packages/de.christinecoenen.code.zapp/)** released version 2.0.0, with background playback of "Mediathek" videos, automatic pausing when a different app plays sound or during a phone call, a lockscreen widget, progress bar only showing when the video really stalls, and minimum Android version increased from 4.4 to 5.0.

* **[AntennaPod](https://f-droid.org/packages/de.danoeh.antennapod/)** was updated from 1.6.5 to 1.7.0, with the new ExoPlayer, a fix for Bluetooth Forward, preferences + search redesign, notification improvements, different screens for feed info and settings, sort queue with Random or Smart Shuffle, true black AMOLED theme, improvements to feed parsing, and a fix for being killed by Android Oreo.

* {{ page.major }} **[AFWall+](https://f-droid.org/packages/dev.ukanth.ufirewall/)** released version 3.0.0 with better support for Android Nougat, Oreo and Pie; a firewall toggle tile; adaptive icons; notifications channel; compatibility with magisk 17.x; better handling of background processes; and updated libraries, translations, and bug fixes. The minimum required Android was bumped from 4.0.3 to 5.0.

* **[SQRL - Main](https://f-droid.org/packages/org.ea.sqrl/)** updated to version 0.11.0, now handling screen rotations, offering manual language choice, and implementing x=n functionality. It has three new languages: French, Japanese and Spanish.

* **[Your local weather](https://f-droid.org/packages/org.thosp.yourlocalweather/)** updated from 4.2.6 to 4.3.1, with rewritten background services for faster and smoother updates, indication of wind direction in the current weather and forecast, and an option for time format.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
