---
layout: post
title: "This Week in F-Droid, Week 20"
author: "Coffee"
authorWebsite: "https://forum.f-droid.org/u/coffee"
---

[F-Droid](https://f-droid.org/) is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a [client](https://f-droid.org/packages/org.fdroid.fdroid/) to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### F-Droid core

* [Rudloff](https://social.rudloff.pro/profile/rudloff) has been very active again, and is responsible for most of the record-breaking 12 new apps!

* [_hc](https://forum.f-droid.org/u/hans) has tagged and released [fdroidserver](https://f-droid.org/en/docs/Installing_the_Server_and_Repo_Tools/) v1.0.4. This release finally fixes the problems mentioned [two weeks ago](https://f-droid.org/en/2018/05/04/this-week-in-fdroid-w18.html). So if users of your repository are complaining that they [can't update](https://forum.f-droid.org/t/unable-to-get-apps-and-update-f-droid), please update ASAP!

  Under the hood, fdroidserver can now accomplish most tasks without the Android SDK, relying on [androguard](https://pypi.org/project/androguard/) instead.

* [_hc](https://forum.f-droid.org/u/hans) also added a security scanner for Python to the build process. It didn't catch anything, but for an extra 1.5 minutes of build time, it's nice to have.

* [hotlittlewhitedog](https://forum.f-droid.org/u/hotlittlewhitedog) has been putting in some work to make the F-Droid client work on Android TV.

#### Community News

* [hellcp](https://forum.f-droid.org/u/hellcp) submitted [an icon](https://forum.f-droid.org/t/new-icon-for-fennec-f-droid/2810/3) for our Fennec icon challenge and it's looking quite good! There's a lively discussion going on, so feel free to [join in](https://forum.f-droid.org/t/2810), or maybe even [submit another icon](https://forum.f-droid.org/t/2810)!

#### New apps

* [JustChess](https://f-droid.org/packages/com.alaskalinuxuser.justchess/): Chess for one or two players
* [Om](https://f-droid.org/packages/com.enjoyingfoss.om/): Meditate mindfully for increased emotional intelligence
* [Torchlight](https://f-droid.org/packages/com.fake.android.torchlight/): Use the flash of your camera as a light
* [arXiv Papers](https://f-droid.org/packages/com.rockbyte.arxiv/): Search, download and save arXiv scientific papers
* [Password Hash](https://f-droid.org/packages/com.uploadedlobster.PwdHash/): Create passwords for each website
* [FragDenStaat](https://f-droid.org/packages/de.fragdenstaat.app/): Navigate FragDenStaat
* [sesam](https://f-droid.org/packages/de.larcado.sesam/): Hash based password manager
* [Router Keygen YoloSec](https://f-droid.org/packages/net.yolosec.routerkeygen2/): Generate default WPA/WEP keys
* [LeMonde.fr](https://f-droid.org/packages/org.mbach.lemonde/): Reads RSS feed from the website LeMonde.fr and fetch articles inside the App
* [SeaMapDroid](https://f-droid.org/packages/org.seamapdroid/): Browse OpenSeaMap on your phone
* [Pain Diary](https://f-droid.org/packages/org.secuso.privacyfriendlypaindiary/): Do you want to track and share your pain? Now you can, privately, using this program.
* [Episodie](https://f-droid.org/packages/pl.hypeapp.episodie/): Discover and track TV show time

#### Updated apps

In total, 68 apps were updated this week. Here are the highlights:

* [Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/) was updated from 1.8.8 to 1.9.0 and now actually _saves_ your profile changes :D, fixes home timeline freezes, and most importantly, now features both a dark theme _and_ a compact mode!

* [Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/) [1.8.0](https://github.com/tuskyapp/Tusky/releases/tag/v1.8.0) made it to F-Droid, bringing better notifications to Android 7+ (Nougat), links to statuses and profiles will now open internally, search now also finds statuses, and more.

* [Vespucci](https://f-droid.org/packages/de.blau.android/) was updated from 10.1.2-fdroid to 10.2.4.0, and now optionally supports "network" location providers, handles http to https redirects and TLS 1.2 for older Android versions, and several smaller changes and bugfixes. Furthermore, Vespucci should be auto-updating in F-Droid from now on.

* [Delta Chat](https://f-droid.org/packages/com.b44t.messenger/) had a major update from 0.16.0 to 0.17.2, with [a ton of changes](https://github.com/deltachat/deltachat-android/blob/HEAD/CHANGELOG.md#v0170).

* [OctoDroid](https://f-droid.org/packages/com.gh4a/) is now at 4.3.2, moving starred repos to the bookmarks screen and fixing some annoying crash bugs.

* The simple mobile tools ([Calculator](https://f-droid.org/packages/com.simplemobiletools.calculator/), [Calendar](https://f-droid.org/packages/com.simplemobiletools.calendar/), [Camera](https://f-droid.org/packages/com.simplemobiletools.camera/), [Contacts](https://f-droid.org/packages/com.simplemobiletools.contacts/), [Draw](https://f-droid.org/packages/com.simplemobiletools.draw/), [File Manager](https://f-droid.org/packages/com.simplemobiletools.filemanager/) and [Gallery](https://f-droid.org/packages/com.simplemobiletools.gallery/)) had a major version bump to 4.0.x across the board. The common change is that the app launcher icons have received a materialish shadow, and you can now customize the launcher color in `Settings -> Customize colors`.

#### Removed apps
* [RunnerUp](https://f-droid.org/packages/org.runnerup/) was completely removed because it depends on and includes the non-free ANT+ SDK.

#### In the next TWIF

What ends up in the next TWIF is all up to you! There are way too many app updates to keep track of them all, so we need your help to highlight the most interesting changes. And of course, we love to hear about all things involving F-Droid in some way.

Please tell us in the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum, or tag your update [#fdroid](https://mastodon.technology/tags/fdroid) on Mastodon. (And cc [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg) to make sure it reaches our instance.) The deadline to the next TWIF is Thursday 12:00 UTC.

Feedback? Come talk to us in #fdroid on [Freenode](https://freenode.net/), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together. You can also join us on the [forum](https://forum.f-droid.org/), [toot on Mastodon](https://mastodon.technology/@fdroidorg), or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).
