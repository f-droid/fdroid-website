---
layout: post
title: "TWIF 30: Publishing Applications through F-Droid, Gitlab Runners and Pluggable Transports"
edition: 30
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_updated_apps: 64
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Publishing applications through F-Droid, Private GitLab runners, Pluggable Transports and F-Droid Matrix server up and running. There are 7 new and **{{ page.number_of_updated_apps }}** updated apps.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Publishing applications through F-Droid

If you were interested in adding an app to F-Droid, **[David](http://www.boddie.org.uk/david/www-repo/)** wrote about [his experience of adding one of his apps to F-Droid](http://www.boddie.org.uk/david/www-repo/Personal/Updates/2018/2018-11-11.html). It points to the necessary documentation and gives a good idea of what you can expect.

> "In summary, it was easier than I had imagined to publish an application in the F-Droid catalogue. The process was smooth and people were friendly and happy to help. If you write your own Free Software applications for Android, I encourage you to publish them via F-Droid and to submit your own metadata for them to make publication as quick and easy as possible."

Read: [Publishing Applications through F-Droid](http://www.boddie.org.uk/david/www-repo/Personal/Updates/2018/2018-11-11.html)

#### Private GitLab runners

We now have the whole buildserver stack running on one of the [GCC Compile Farm](https://cfarm.tetaneutral.net) servers. **[@\_hc](https://forum.f-droid.org/u/hans)** has set it up as as a GitLab runner, so it's now possible to do real, full builds for [fdroiddata](https://gitlab.com/fdroid/fdroiddata) merge requests. This also includes using machine learning in the form of [LibScout](https://github.com/reddr/libscout) to scan the final APK for trackers. See [fdroiddata!3936](https://gitlab.com/fdroid/fdroiddata/merge_requests/3936) for an example.

The hard part is that the user who submitted the [merge request](https://gitlab.com/help/user/project/merge_requests/index.md) must register the runner for it to run on their merge requests. Please refer to [admin#106](https://gitlab.com/fdroid/admin/issues/106) on how to get access for yourself.

#### Pluggable Transports

The [Guardian Project](https://guardianproject.info) was approved a grant to work on integrating "Pluggable Transports" into three apps. The idea is to provide censorship circumvention by disguising traffic as something popular and innocuous, for example WebRTC traffic.

Most likely, this will include Wikimedia and F-Droid for prototypes, with **[@uniq](https://chaos.social/@uniq)** doing most of the work. It'll probably be hard to integrate into the official F-Droid releases, so this grant will most likely end up with working prototypes that people can use if they want.

#### F-Droid Matrix server up and running

The [Matrix](https://matrix.org) server we [wrote about last week]({{ site.baseurl }}{% post_url 2018-11-10-twif-29-new-matrix-server-and-mirror-testers-wanted %}#f-droid-matrix-server) is up and running! Consequently, our Matrix rooms are now available as "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)" and "[#fdroid-dev:f-droid.org](https://matrix.to/#/#fdroid-dev:f-droid.org)"!

Registration is restricted to F-Droid contributors, so if you are a core F-Droid contributor and want an account, ask **[Mathijs](https://forum.f-droid.org/u/mvgorcum)** or **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** to make one for you. Resource consumption is currently quite low, and we'd like to keep it that way. Therefore you mustn't join any public rooms, other than the ones we agreed upon beforehand. (This is not a Matrix server for personal use.) Opening internal discussion rooms and 1:1 chats is fine though.

#### Odds and ends

* At least 4 F-Droid contributors will be going to 35C3.
* **[@\_hc](https://forum.f-droid.org/u/hans)** will be speaking at 35C3 about F-Droid swap among other things, in his "Wind: Off-Grid Services for Everyday People".
* There was some commotion about [the Simple Mobile Tools going paid](https://medium.com/@tibbi/some-simple-mobile-tools-apps-are-becoming-paid-d053268f0fb2) **(medium.com)**. [It doesn't seem to be that bad](https://github.com/SimpleMobileTools/Simple-Gallery/issues/1074#issue-379411177), however.

#### New apps

* **[DarkCroc Theme](https://f-droid.org/packages/de.spiritcroc.darkcroc.substratum/)**: A dark substratum theme targeting android 9+.
* **[Default Dark Theme](https://f-droid.org/packages/de.spiritcroc.defaultdarktheme_oms/)**: A dark substratum theme targeting android 7 & 8.
* **[BeamControl for Smart Interface](https://f-droid.org/packages/eu.halaser.beamctrl/)**: Control / notification application for smart factory/industry 4.0 applications.
* **[Bits & Bäume 2018](https://f-droid.org/packages/info.metadude.android.bitsundbaeume.schedule/)**: The schedule for "Bits & Bäume", a German sustainability conference happing on the weekend of 17 & 18 November / Die konferenz für digitalisierung und nachhaltigkeit.
* **[SimpleEmail](https://f-droid.org/packages/org.dystopia.email/)**: Simple and minimalistic email app.
* **[Android XMRig Miner](https://f-droid.org/packages/org.elijaxapps.androidxmrigminer/)**: Mine cryptocoins with xmrig miner on your smartphone.
* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)**: An alternative client app to browse the F-Droid repository.

#### Updated apps

Lots of very small changes this week, at a total of **{{ page.number_of_updated_apps }}** updates. Here are the highlights:

* **[FairEmail](https://f-droid.org/packages/eu.faircode.email/)** was updated from 1.143 to 1.153, now with advanced setting to allow editing sender address, delete operation in multiple sections, new provider "dismail.de", two-column view in landscape mode, improved quick settings tiles, colorized notifications (Android 8+) and lots of color-related changes, and several other UI/UX improvements. **Note that you will need to set up your accounts again after updating.**

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)**, the Mastodon client, released 1.20.0 with the ability to use the direct timeline prior to Mastodon 2.6, see who boosted of favorited a toot, URL previews in toots including direct playing of videos, and several other improvements, changes, and bug fixes.

* **[MemeTastic](https://f-droid.org/packages/io.github.gsantner.memetastic/)**, an app to create memes also known as "image macros", was updated from 1.4.5 to 1.5.0, going back to its roots with a small amount of templates inside the project, and targeted at user-added templates in a local folder. Internet permission was removed and internet access completely disabled. It will no longer download from the MemeTastic archive.

* **[Markor](https://f-droid.org/packages/net.gsantner.markor/)**, a full-featured [Markdown](https://commonmark.org) editor, released 1.4.0 with a new color picker and editor color themes. See the full list of changes in its [release blog post](https://gsantner.net/blog/2018/11/12/markor-release-v1.4.html).

* **[Open Contacts](https://f-droid.org/packages/opencontacts.open.com.opencontacts/)**, a privacy-friendly contact list that can't be read by other apps, was updated from 5.0 to 6.0, with contact names now a bit bolder, contacts following similar structure to call logs with actions either side of contact, and the call log now updates contact names as soon as a contact is added, rather than ignoring existing calls in the log.

* **[The Light](https://f-droid.org/packages/org.hlwd.bible/)** released 3.5, now also in Portugese translation, and adding the Portuguese Bible: Almeida Corrigida Fiel.

* **[Wrong PIN Shutdown](https://f-droid.org/packages/org.nuntius35.wrongpinshutdown/)** was updated to 7, fixing a bug on devices with a fingerprint reader. Unlocking the phone by fingerprint did not reset the wrong PIN counter, and this bug is now fixed. However, note that attempts to unlock the phone with a wrong fingerprint will not be registered.

* **[Trackbook](https://f-droid.org/packages/org.y20k.trackbook/)**, a basic GPS logger with map, was updated from 1.1.11 to 1.1.13, fixing a crash and improving location at start of recordings.

* **[Manyverse](https://f-droid.org/packages/se.manyver/)** updated from 0.1810.24-beta to 0.1811.12-beta. This updates fixes [a crash](https://gitlab.com/staltz/manyverse/issues/260) and improves the looks of the splash screen.

  If you're interested in the off-the-grid social network Scuttlebutt behind this app, there's [a good essay about it](https://staltz.com/early-days-in-the-manyverse.html) by the creator of the app. It is nicely honest about the major difficulties of using the network, as well as suggesting possible solutions. (Credit: [switching.social](https://mastodon.at/users/switchingsocial/statuses/100933499495662465))

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
