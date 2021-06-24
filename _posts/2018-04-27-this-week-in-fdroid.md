---
layout: post
title: "This Week in F-Droid"
author: "Coffee"
authorWebsite: "https://forum.f-droid.org/u/coffee"
---

Hi everyone! This is a little experiment triggered by the [Matrix Project](https://matrix.org/) starting their own [TWIM](https://matrix.org/blog/2018/04/20/this-week-in-matrix-2018-04-20/) (This Week In Matrix), who in turn stole the idea off [TWIR](https://this-week-in-rust.org/) (This Week In Rust). Therefore, we now give you the first trial TWIF!

[F-Droid](https://f-droid.org/) is an installable [catalogue](https://f-droid.org/packages/) of [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) (Free and Open Source Software) applications for the Android platform. The [client](https://f-droid.org/packages/org.fdroid.fdroid/) makes it easy to browse, install, and keep track of updates on your device. This post lists notable things that happened in and around F-Droid this past week.

#### What's happening in F-Droid

* If you see "error getting index file", temporarily switching to the old index format in settings will work around the problem. The bugfix for the wrong app titles broke the index generation. Sorry about this!
* Speaking of, there have been problems with some app titles showing up in Arabic. This should be fixed by androguard (see below).
* The [F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/) app saw two new updates this week. 1.2.2 fixes a critical bug on older android phones, where it was instantly crashing and restarting in a loop. It seems to be stable so far.
* Meanwhile, the next alpha (v1.3-alpha0) is tagged and should be built by the time you read this. The minSdk has been upped to 14 (Android 4.0 aka Ice Cream Sandwich), which allows all sorts of new things, and should make things easier to maintain.

  There will probably be more unstable v1.3 alphas since there were a lot of library updates, so please test! And don't upgrade unless you're really willing to use an alpha.
* CiaranG put androguard on the build server, which should finally fix [admin#65](https://gitlab.com/fdroid/admin/issues/65). This means that users of the Privileged Extension will finally be able to leave Unknown Sources off. It should also fix the arabic names and blank names.
* The $22K grant for translation workflow has been officially confirmed. It will include some web dev work. It is expected that this will happen in June.
* [Liberapay](https://liberapay.com/): The [F-Droid Data team](https://liberapay.com/F-Droid-Data) is currently receiving €61.05 per week from 144 patrons, making it the 5th largest team on Liberapay. Help us get that 3rd position back!
* If you hadn't noticed yet, **Bubu** made F-Droid accounts on Mastodon ([@fdroidorg](https://mastodon.technology/@fdroidorg)) and Twitter ([@fdroidorg](https://twitter.com/fdroidorg)). We've been surprised and excited that our Mastodon has proven much more popular than our Twitter! The set-up automatically mirrors everything between the two accounts, and Bubu has been doing a good job of pushing regular updates and answering people's questions.

#### Other News

* One of the GSOC projects from [Matrix](https://matrix.org/) is building an alternative to [GCM](https://en.wikipedia.org/wiki/Google_Cloud_Messaging) push for matrix. This will directly benefit the fdroid version of [Riot.im](https://f-droid.org/packages/im.vector.alpha/)!  
* **_hc**'s work under the [Guardian Project Viento](https://guardianproject.info/wind/) funding is coming to a close, with maybe one or two weeks left.

#### New apps

No new apps added this week.

#### Updated apps

* [Ring](https://f-droid.org/packages/cx.ring/) is finally up-to-date again on F-Droid! (And should hopefully not fall behind that much again.) We had to stop accepting updates because Ring introduced the proprietary [GCM](https://en.wikipedia.org/wiki/Google_Cloud_Messaging) push service. Although that was soon made optional, nobody had time to update the build recipe. (Until now.)
* [Telegram](https://f-droid.org/packages/org.telegram.messenger/): Russia doesn't like not being able to spy on people, and has been trying to block Telegram. The upcoming version of Telegram-FOSS will have better chances to connect through the Russian Telegram blocks. If you need it right now you can install the beta build from here: https://github.com/Telegram-FOSS-Team/Telegram-FOSS/releases/tag/v4.6b
* [Yalp Store](https://f-droid.org/packages/com.github.yeriomin.yalpstore/): There is an update for yalp store not being able to find any app updates.
* **Misc**: Updates for [Conversations](https://f-droid.org/packages/eu.siacs.conversations/), [Nextcloud Talk](https://f-droid.org/packages/com.nextcloud.talk2/), [Telegram](https://f-droid.org/packages/org.telegram.messenger/), [Duck Duck Go](https://f-droid.org/packages/se.johanhil.duckduckgo/), [Firefox Klar](https://f-droid.org/packages/org.mozilla.klar/), [Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/) 1.6.1, [Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/) 1.8.6, [BRouter](https://f-droid.org/packages/btools.routingapp/) 1.4.11, [Nextcloud](https://f-droid.org/packages/com.nextcloud.client/) 3.1.0 and many more!

#### Archived apps

* [Eleven](https://gitlab.com/ymber/Eleven) was moved to the archive because it is unmaintained and more or less broken according to the app's author.

#### In the next TWIF

Will there be another edition of TWIF? That's up to you, dear reader! We are hoping to publish a new TWIF every friday, but we can't do this without your help. If you are working on something F-Droid related, like to talk about your app that's getting updated or newly included in F-Droid, or have some news related to F-Droid, get in touch!

Come talk to us in #fdroid on [Freenode](https://freenode.net/), in Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or via [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). Join us on the [forum](https://forum.f-droid.org/). [Toot on Mastodon](https://mastodon.technology/@fdroidorg), or, if you absolutely must, [tweet us](https://twitter.com/fdroidorg).

