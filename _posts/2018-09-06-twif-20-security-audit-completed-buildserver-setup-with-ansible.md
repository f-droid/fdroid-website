---
layout: post
title: "TWIF 20: Security audit completed, buildserver setup with ansible"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
---

This Week In F-Droid 20, Week 36, 2018

In this edition: Second security audit completed, automating the buildserver setup with ansible, a light week with updates for Just Notes, Cow's Revenge, Feeel, and others.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Second security audit completed

In case you missed it, [our second security audit has been completed]({{ site.baseurl }}{% post_url 2018-09-04-second-security-audit-results %}). All important issues have been fixed, and work on the remaining issues is ongoing. **[@Tovok7](https://blog.grobox.de)** has been working on [repomaker](https://gitlab.com/fdroid/repomaker) issues found in the audit, uploaded a pre-release to [pypi](https://pypi.org) and started to write [installation instructions](https://gitlab.com/fdroid/repomaker#installation). If you are a developer or a power user, we could use your help with testing these.

**[@\_hc](https://forum.f-droid.org/u/hans)** writes: <q>We are satisfied with the results, which confirmed again that the core security model and standard operations are solid.</q> [_Read more_]({{ site.baseurl }}{% post_url 2018-09-04-second-security-audit-results %}).

For those who are curious about the _first_ security audit, which happened in 2015, [this post]({{ site.baseurl }}{% post_url 2018-01-20-upcoming-security-audit %}) looks back on it.

#### Automating buildserver setup with ansible

**@uniq** is currently working on automating the [buildserver](https://gitlab.com/fdroid/fdroidserver) setup with [ansible](https://en.wikipedia.org/wiki/Ansible_%28software%29). Although we already have `makebuildserver`, this completely automates it, and all you have to do is run `vagrant up` and you'll get a VM with [fdroidserver](https://gitlab.com/fdroid/fdroidserver) set up for doing builds with a nested buildserver inside. This is different from `makebuildserver` in that it also builds the host.

#### Community News

* Öffi returns to the Google Play Store ([article in German](https://www.heise.de/newsticker/meldung/Nahverkehrs-App-Oeffi-ist-zurueck-im-Play-Store-4153880.html)), after being [kicked out]({{ site.baseurl }}{% post_url 2018-07-12-this-week-in-fdroid-w28 %}) and [open sourced in response]({{ site.baseurl }}{% post_url 2018-07-21-twif-13-public-transport-edition %}) earlier.

#### New apps

* **[Fit Notifications](https://f-droid.org/packages/com.abhijitvalluri.android.fitnotifications/)**: Enable all notifications for compatible Fitbit devices

* **[ADBKeyBoard](https://f-droid.org/packages/com.android.adbkeyboard/)**: Android Virtual Keyboard Input via ADB

#### Updated apps

This week, **24** apps were updated, which is by far the lightest week we've had since the start of TWIF. We are not aware of any technical problems, and the index has been updating regularly. This slowdown appears to be entirely natural.

* **[Just Notes](https://f-droid.org/packages/com.alaskalinuxuser.justnotes/)** released version 2.0, now with scrolling notes!

* {{ page.featured }}  **[Cow's Revenge](https://f-droid.org/packages/org.pipoypipagames.cowsrevenge/)** is an awesome game in which you play a cow that was abducted and genetically enhanced by aliens. Seriously, who doesn't want to be THE COWEST? In version 1.0.5 you can toggle the sound on and off in the settings, enjoy Gamepad improvements, change weapons with shoulder buttons, and more.

* **[Feeel](https://f-droid.org/packages/com.enjoyingfoss.feeel/)** is an app for doing simple at-home exercises. The update from 1.1 to 1.91 adds multiple workouts and fixes a bug that makes it actually work on Android 4.x, as well as SailfishOS.

* **[Draw](https://f-droid.org/packages/com.simplemobiletools.draw/)** is a dead simple drawing app. Version 4.3.0 adds an initial Zoom implementation, which is disabled by default.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** 1.11.0 is out! Links to toots now open the conversation inside the app, detailed bug reports can be sent by email, GIFs can be imported from the Android keyboard, instances can be followed from profiles, markdown is accepted for links in toots, and more. There's also a slew of bug fixes and better Pleroma support.

* **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** is an instant messenger and team collaboration tool based on the [Matrix](https://matrix.org) protocol/network. It skipped a version on F-Droid, updating straight to 0.8.15. This update has a lot of quality improvements under the hood, an updated settings icon and notification logo, the ability to send messages starting with a slash (`/`) and automatically escapes nickname mentions starting with a slash.

#### Tips and Feedback

Don't forget to send in your tips! There are way too many app updates to keep track of them all, and we'd love your help to find the important ones. And of course, if you're doing anything involving F-Droid in any way, tell us about it!

Send tips via [Mastodon](https://joinmastodon.org) to **[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)** on and remember to tag with **[#TWIF](https://mastodon.technology/tags/twif)**. Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum](https://forum.f-droid.org/)**.
