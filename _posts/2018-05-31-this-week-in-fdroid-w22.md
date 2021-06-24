---
layout: post
title: "This Week in F-Droid, Week 22"
author: "Coffee"
authorWebsite: "https://forum.f-droid.org/u/coffee"
---

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* We haven't received any more submissions for our [Fennec icon challenge](https://forum.f-droid.org/t/new-icon-for-fennec-f-droid/2810) this week. We'll continue to take submissions until Sunday the 10th of June, 24:00 UTC, after which we'll start the vote. So if you are working on something and haven't sent it in yet, be sure to finish up and submit before then.

* [Rudloff](https://forum.f-droid.org/u/rudloff) has prepared even more new apps to be added to F-Droid. He has however indicated that the pool of "easy" apps is running out. It will become increasingly difficult to add further projects, as they need additional work to be buildable by our buildserver. We can always use more help with this. There are still 245 open issues in [Requests For Packaging](https://gitlab.com/fdroid/rfp/issues) for you to sink your teeth into.

* [_hc](https://forum.f-droid.org/u/hans) is working on adding a "full" and a "basic" build flavor to [fdroidclient](https://gitlab.com/fdroid/fdroidclient). The "full" flavor will be F-Droid as you know it, and "basic" will be a version that is as small as possible. This should make it easier to make [whitelabel versions]({{ site.baseurl }}/docs/Whitelabel_Builds/) of F-Droid. This brings [F-Droid Light](https://gitlab.com/fdroid/fdroidclient/issues/48) within reach of any Android developer with a little time to implement a minimal list view screen for finding apps to install.

* We are going into beta testing with mirrors of the official [F-Droid repository](https://f-droid.org/packages/). We have a server that receives the official F-Droid pushes. From there, it will be shared out via rsync. Once this is ready, anyone can run "secondary" mirrors as they see fit. If anyone wants to run a public mirror and participate in this beta, please get in touch with [_hc](https://forum.f-droid.org/u/hans).

* Perhaps you don't know about this, but half of these points come from our [weekly online contributor meeting](https://gitlab.com/fdroid/fdroidclient#irc) on IRC. If you contribute to F-Droid, you are invited to hop onto #fdroid-dev on [Freenode](https://freenode.net/) and participate! The meetings start every [Thursday at 11:30 UTC](https://www.wolframalpha.com/input/?i=next+thursday+11:30+AM+UTC).

  Everyone else is invited to listen in, either via the their own favourite client or via the [archive](https://botbot.me/freenode/fdroid-dev/) which updates in real time. Please be respectful of the fact that this is a meeting for actual contributors. See the bottom of this post for general questions and feedback.

  The room is also bridged to Matrix via [#freenode_#fdroid-dev:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org).

#### Community News

* You may have heard about this already, but for those who have not: [Huawai has quietly stopped providing bootloader unlock codes](https://www.xda-developers.com/huawei-stop-providing-bootloader-unlock-codes/). That is to say, newly released devices won't be unlockable at all, and if you think you might ever want to unlock your older device, you should request an unlock code ASAP. You have 50 days or less by the time you read this. Thank you for your understanding, indeed.

#### New apps

* [BookList](https://f-droid.org/packages/com.ames.books/): Unofficial Google Books viewer
* [ShellMS](https://f-droid.org/packages/com.android.shellms/): Send SMS via Android SDK
* [TEdit](https://f-droid.org/packages/com.atr.tedit/): A simple text editor
* [SecondScreen](https://f-droid.org/packages/com.farmerbb.secondscreen.free/): Better screen mirroring
* [twitlatte](https://f-droid.org/packages/com.github.moko256.twitlatte/): Twitter, Mastodon and Pleroma client
* [Hoplite Keyboard](https://f-droid.org/packages/com.philolog.hoplitekeyboard/): A keyboard extension which allows the user to type in Polytonic Greek
* [BatteryCalibration](https://f-droid.org/packages/de.perflyst.batterycalibration/): Calibrate your battery
* [Föhnix](https://f-droid.org/packages/foehnix.widget/): The Foehnix weather widget aims at helping pilots with weather conditions
* [nitroxCalc](https://f-droid.org/packages/fr.cap_rel.fr.sagc_plongee.fr.nitroxCalc/): Nitrox Calculator for Diving
* [Taskkeeper](https://f-droid.org/packages/io.gitlab.allenb1.todolist/): Keep track of to-dos
* [Apollo Trivia](https://f-droid.org/packages/net.jakevossen.apollotrivia/): Learn more about the Apollo Moon missions
* [NC Bookmark Viewer](https://f-droid.org/packages/org.lenchan139.ncbookmark/): This is a lightweight viewer for Nextcloud bookmarks
* [Libreflix](https://f-droid.org/packages/org.libreflix.app/): Stream and watch independent films

#### Updated apps

In total, 46 apps were updated this week. Here are the highlights:

* [NewPipe](https://f-droid.org/packages/org.schabi.newpipe/) updated to 0.13.4 to comply with [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) for their crash reporting.

* [Gallery](https://f-droid.org/packages/com.simplemobiletools.gallery/) 4.1.1 brings several UX and stability improvements and bugfixes.

* [Kore](https://f-droid.org/packages/org.xbmc.kore/) was updated from v2.3.3 to v2.4.0. Kore™ aims to be a simple, easy to use and beautiful remote that lets you control your Kodi® / XBMC™ media center from your Android™ device. This update enables playing movies locally on device, a new setting to use skip steps instead of seeking, and other improvements and bug fixes.

* [Calendar Trigger](https://f-droid.org/packages/uk.co.yahoo.p1rpp.calendartrigger/) was updated from 1.2.0 to 2.2 adding support for playing sounds with notifications, the Next Location feature and the ability to save and load settings. Also fixes crashes and several smaller nuisances.

* [My Location](https://f-droid.org/packages/net.mypapit.mobile.myposition/) 1.3.1 has a new foreground service for trying to get location until it's found, and a more modern UI.

* We already mentioned it being in beta last time, and now [OsmAnd~](https://f-droid.org/packages/net.osmand.plus/) 3.0.2 [has finally been released](http://osmand.net/blog?id=osmand-3-0-released). The 3.0 release brings a completely new 'Travel' menu integrating WikiVoyage data, updates to GPX import and a new way of starting subscriptions. [Check it out!](http://osmand.net/blog?id=osmand-3-0-released)

* [Movie DB](https://f-droid.org/packages/org.notabug.lifeuser.moviedb/) saw a new major release in 2.0.0, although this update mainly contains bug fixes. Most features that were originally planned for 2.0.0 were already included in the 1.9.0 release. [Changelog here](https://notabug.org/nvb/MovieDB/releases).

* [Etar](https://f-droid.org/packages/ws.xsoh.etar/) 1.0.13 is in, adding support for displaying lunar/festival when Language is Chinese, fixing a permission [bug](https://github.com/Etar-Group/Etar-Calendar/issues/249) in which Etar fails to run after first install on Android 6+, and many other fixes.

* [KeePassDroid](https://f-droid.org/packages/com.android.keepass/) was set back to 2.2.2.4. Apparently we automatically pulled in a prerelease which just crashes on opening the DB. Technical details are [here](https://github.com/bpellin/keepassdroid/issues/291).

I would like to point out that some apps that could have been in this overview were passed over, because they didn't have any changelogs that I could find. If you'd like your app to be picked up, be sure you _have_ changelogs, and make sure they are linked in the fdroid metadata or in fastlane format inside your repository. Better yet, if you have important updates coming out, drop us a line! See below.

#### Archived and Removed apps

All apps have been kept safe and sound this week.

#### In the next TWIF

What ends up in the next TWIF is all up to you! There are way too many app updates to keep track of them all, so we need your help to highlight the most interesting changes. And of course, we love to hear about all things involving F-Droid in some way.

Please tell us in the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum, or tag your update [#fdroid](https://mastodon.technology/tags/fdroid) on Mastodon. (And cc [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) to make sure it reaches our instance.) The deadline to the next TWIF is Thursday 12:00 UTC.

Feedback? Come talk to us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together. You can also join us on the [forum](https://forum.f-droid.org/), toot at [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) on Mastodon, or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).
