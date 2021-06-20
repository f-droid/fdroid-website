---
layout: post
title: "TWIF 40: The NewPipe Broken Builds edition"
edition: 40
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 20
number_of_removed_apps: 2
number_of_updated_apps: 71
number_of_beta_updated_apps: 1
number_of_downgraded_apps: 1
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: NewPipe and broken builds, and more than 5000 followers on Mastodon.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

Hi everyone, here's a fresh new TWIF for you! Many thanks to **[@Licaon\_Kter](https://forum.f-droid.org/u/Licaon_Kter)** for writing [edition 38]({{ site.baseurl }}{% post_url 2019-01-12-twif-38 %})! Unfortunately we had a problem with updating the website, which means it was delayed by almost two weeks. We now have a temporary solution in place for faster updates and are working on a permanent one. This edition will cover both TWIF 39 and 40.

### NewPipe and broken builds

We've had problems with building most apps, and with **[NewPipe](https://f-droid.org/packages/org.schabi.newpipe/)** in particular. **[@Bubu](https://forum.f-droid.org/u/Bubu)** reports:

1. Google changes some things in Youtube's webinterface --> NewPipe can't play Youtube videos anymore (previous version works though).
2. The NewPipe team soon releases an update that fixes the problem.
3. F-Droid buildserver is not fully stable at this point so builds are only running ~ every 2 days.
4. First build of NewPipe fails with a Github internal server error. (Great!)
5. At this point Google somehow pushes a license change to the Android SDK repositories (adding some [GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation) stuff), but as the license hash is checked programmatically by the SDK tools, this breaks all CI pipelines that install Android SDK components. It also breaks most builds in F-Droid, including the next build of NewPipe. (Great, again!)
6. I'm trying to figure out what we need to change in our buildserver setup scripts to make it work again. Apparently solutions which other projects have found are not working for us as we are forced to use an older sdk-tools revision.
7. After almost a day of rebuilding F-Droid buildservers without success, everything magically starts working again without us changing anything. (So Google reverted their change?). Progress was tracked [here](https://gitlab.com/fdroid/fdroidserver/issues/620) and [here](https://gitlab.com/fdroid/fdroidserver/merge_requests/610).

Lessons learned:

* Everything breaks at the most inconvenient of times.
* NewPipe needs a faster update channel than the main F-Droid repository. The discussion about this can be found [here](https://github.com/TeamNewPipe/NewPipe/issues/1981).
* We need to mirror the sdkmanager repository, such that Google can't remotely break all our infrastructure.

The long-term fix for this is to [create free software builds of the Android SDK](https://forum.f-droid.org/t/call-for-help-making-free-software-builds-of-the-android-sdk/4685) so we are completely free from Google and their restrictive license terms. If you are as annoyed by this as we are, please have a look at the [forum thread](https://forum.f-droid.org/t/call-for-help-making-free-software-builds-of-the-android-sdk/4685) to see if you can help! **--@Coffee**

### Over 5000 followers on Mastodon

We surpassed 5000 followers on Mastodon this month. We are happy to see that more and more people are finding us, and also that Mastodon keeps growing.

### Downgraded apps

* Version 2.1 of the game **[2048](https://f-droid.org/packages/com.uberspot.a2048/)** was broken, and has been removed from the repository. Version 2.2 is expected to arrive soon.

### New apps

Our volunteers have been busy adding new apps, {{ page.number_of_added_apps }} in total!

* **[YidKey KD](https://f-droid.org/packages/click.dummer.yidkey/)**: Yiddish keyboard (compatibility decomposition).
* **[Diceware Password Generator](https://f-droid.org/packages/com.aptasystems.dicewarepasswordgenerator/)**: Generate diceware passwords.
* **[Librery](https://f-droid.org/packages/com.example.harisont.librery/)**: Manage your ebooks.
* **[NextCompanion](https://f-droid.org/packages/com.example.hochi.nextcompanion/)**: Rogue client for nextbike (unofficial).
* **[File Manager](https://f-droid.org/packages/com.github.axet.filemanager/)**: File manager with root browser.
* **[Turtl](https://f-droid.org/packages/com.lyonbros.turtl/)**: A secure, encrypted evernote alternative.
* **[M-Droid](https://f-droid.org/packages/com.mdroid/)**: Unofficial material designed client for f-droid.
* **[Simple Decred Widget](https://f-droid.org/packages/com.simpledecredwidget/)**: Widget for viewing decred exchange rate.
* **[NorthDog Audio Compass](https://f-droid.org/packages/cz.harvie.northdog/)**: 3d audio compass.
* **[House of Cards](https://f-droid.org/packages/eu.veldsoft.house.of.cards/)**: Solitaire-like card game.
* **[Lona](https://f-droid.org/packages/io.github.lufte.lona/)**: A snake-like html5 game.
* **[App Lock](https://f-droid.org/packages/io.github.subhamtyagi.privacyapplock/)**: Privacy app lock.
* **[HgLauncher](https://f-droid.org/packages/mono.hg/)**: A launcher for a slow day.
* **[TpmsMonitor](https://f-droid.org/packages/nodomain.freeyourgadget.tpmsmonitor/)**: Manage bluetooth tire pressure monitor sensors.
* **[Flyve MDM Agent](https://f-droid.org/packages/org.flyve.mdm.agent.mqtt/)**: Manage and secure effectively your mobile devices and applications.
* **[FASTer App Search Tool](https://f-droid.org/packages/org.ligi.faster/)**: Find apps just by typing.
* **[Presence Publisher](https://f-droid.org/packages/org.ostrya.presencepublisher/)**: Regularly publish to an mqtt topic.
* **[Tape Measure](https://f-droid.org/packages/org.secuso.privacyfriendlytapemeasure/)**: Turn your device into a tape measure or ruler.
* **[News](https://f-droid.org/packages/press.condense.www/)**: A news recommendation engine with user customizable parameters.
* **[Pixel Artist](https://f-droid.org/packages/rodrigodavy.com.github.pixelartist/)**: Make pixel art on android.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* There was a [bug](https://github.com/Telegram-FOSS-Team/Telegram-FOSS/issues/288) in maintenance release 4.9.1a of **[Telegram](https://f-droid.org/packages/org.telegram.messenger/)**, where it wouldn't sync any messages for some people. We've removed this version from F-Droid. For those who already updated, upstream sources of 5.2 have been published and we are expecting these to land in F-Droid soon.

* Some significant updates for **[Rocket.Chat](https://f-droid.org/packages/chat.rocket.android/)** 3.2.0, with a new user screen and a new room screen, support for muted state in the room, ability to delete the account, take a photo and send directly, and several other improvements.

* Several months worth of development for **[Waistline](https://f-droid.org/packages/com.waist.line/)**, a calorie and weight tracker app, which [updated](https://github.com/davidhealey/waistline/releases) from 2.3.7 to 2.4.2. Too many changes to list, but a selection: simplified food filter; filter by country; a new combined foods, meals and recipes page replacing the individual pages; and much more.

* **[SecScanQR](https://f-droid.org/packages/de.t_dankworth.secscanqr/)** [updated](https://github.com/Fr4gorSoftware/SecScanQR/releases) from 1.1.9 to 1.2.0, adding the search engine Startpage, "are you sure" dialog before deleting history, and round launcher icons. A security fix prevents the OS from taking screenshots, and the "WRITE EXTERNAL STORAGE" permission is now only needed when you want to save the generated QR-code.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.64.1 to 1.65.1, now with support for deleting Peertube videos, NSFW control for Peertube videos, and many bug fixes.

* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)** [updated](https://gitlab.com/gdroid/gdroidclient/tags) from 0.6.2 to 0.7.1, with a new list view, show similar apps ordered by similarity, pull-down to refresh, different sorting methods, show apps the user might also like, uninstall button, and several other improvements and bug fixes.

* **[Sugarizer](https://f-droid.org/packages/org.olpc_france.sugarizer/)** is an implementation of the [Sugar Learning Platform](https://sugarlabs.org), a learning platform for children. In this [update](https://github.com/llaske/sugarizer/blob/HEAD/CHANGELOG.md) to 1.1.0, the activities Ebook Reader, Exerciser and Sprint Math were added, as well as a sort palette in Journal. It will now allow action on multiple items in Journal, copy from Journal to device and from device to Journal, show help tutorial on initial screen, and show help on activities in list view. This release also contains many bug fixes.

* {{ page.major }} **[OONI Probe](https://f-droid.org/packages/org.openobservatory.ooniprobe/)** released version 2.0.0, with a major UI overhaul. OONI Probe is a tool to measure internet censorship and other forms of interference. It can help to detect things like [this](https://ooni.torproject.org/post/zimbabwe-protests-social-media-blocking-2019/). Highlights of this [update](https://github.com/ooni/probe-android/releases) include an overview screen for all test results, enhanced website testing where you can test a website of your choice, and data usage tracking on a test-by-test basis.

### Beta updates

The following updates won't be automatically suggested to you unless you have "Unstable updates" enabled in the F-Droid app settings, but you can expand the "Versions" tab and install them manually. Note that these are marked beta for a reason: proceed at your own risk.

* **[F-Droid Privileged Extension](https://f-droid.org/packages/org.fdroid.fdroid.privileged/)** was updated from 0.2.8 to 0.2.9

### Removed apps

* **[Mathdroid](https://f-droid.org/wiki/page/org.jessies.mathdroid)**
* **[33C3 Schedule](https://f-droid.org/wiki/page/org.ligi.fahrplan)**

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
