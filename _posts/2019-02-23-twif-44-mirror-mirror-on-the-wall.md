---
layout: post
title: "TWIF 44: Mirror, mirror on the wall"
edition: 44
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 7
number_of_removed_apps: 0
number_of_updated_apps: 35
number_of_beta_updated_apps: 1
number_of_downgraded_apps: 0
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Mirror work in F-Droid 1.6 alpha 1, new blog on Planet F-Droid, submission queue maintenance, and part 4 of Izzy's F-Droid series published in print.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### Mirror work in F-Droid 1.6 alpha 1

**[@\_hc](https://forum.f-droid.org/u/hans)** has spent most of the week on mirror support in F-Droid. All that work is contained in the next alpha release of F-Droid 1.6, alpha 1. There were a number of small related fixes, and it will now choose a random mirror for each APK download.

For the index itself, the old failover model is still in use, meaning it always starts with the main F-Droid repo, and will only move to a mirror if that fails. We need to put some more thought into this, as **[@\_hc](https://forum.f-droid.org/u/hans)**'s experiments with randomizing mirrors for the index show that it causes many unnecessary index downloads.

In closing: important changes ahead! Please test 1.6-alpha1!

### New blog on Planet F-Droid

**[@vanitasvitae](https://gitlab.com/vanitasvitae)** added [Handy News Reader](https://handynewsreader.blogspot.com/) to [Planet F-Droid](https://fdroid.gitlab.io/planet/). As the blog feed also contains posts in German and Polish, he is looking for some way to filter these out. 

### Submission queue maintenance

After **[@Izzy](https://forum.f-droid.org/u/izzy)** finished his cleanup work in [rfp](https://gitlab.com/fdroid/rfp) and [fdroiddata](https://gitlab.com/fdroid/fdroiddata), he has gone into maintenance mode, keeping up with new issues and making sure things are progressing. There are quite a few apps ready for packaging now, waiting for someone to pick them up.

If you've been wondering why so many new apps keep being added to F-Droid, this is why!

### Part 4 of Izzy's F-Droid series published in print

The fourth part of **[@Izzy](https://forum.f-droid.org/u/izzy)**'s F-Droid series was published in **c't** magazine. This corresponds to part 3 of his blog series, which should be online in about 1 week from now.

### New apps

* **[AusweisApp2](https://f-droid.org/packages/com.governikus.ausweisapp2/)**: Eperso mit dem handy nutzen.
* **[Indigenous](https://f-droid.org/packages/com.indieweb.indigenous/)**: Indieweb micropub and microsub client.
* **[Money Manager Ex](https://f-droid.org/packages/com.money.manager.ex/)**: Money management and expenses tracking.
* **[Binary Eye](https://f-droid.org/packages/de.markusfisch.android.binaryeye/)**: Yet another barcode scanner.
* **[LDAP Sync](https://f-droid.org/packages/de.wikilab.android.ldapsync/)**: Sync your contacts with ldap.
* **[Chord Reader](https://f-droid.org/packages/org.handmadeideas.chordreader/)**: Search for, display, transpose and save chords on your phone.
* **[Crazyflie Client](https://f-droid.org/packages/se.bitcraze.crazyfliecontrol2/)**: Control your crazyflie quadcopter from your mobile device.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[DuckDuckGo Privacy Browser](https://f-droid.org/packages/com.duckduckgo.mobile.android/)** was [updated](https://github.com/duckduckgo/Android/releases) from 5.15.1 to 5.18.0. It fixes a bug that prevents opening homescreen or shared links in the app, adds an information box to let you know how to install the search widget, and improves the data clearing process. The URL bar was also polished and received a few small bugfixes.

* **[EteSync](https://f-droid.org/packages/com.etesync.syncadapter/)** 1.2.0 [is in](https://github.com/etesync/android/blob/HEAD/ChangeLog.md), adding a button to install OpenTasks if it isn't installed, and warning about clients that don't support email attachments when sending event invites.

* **[PianOli](https://f-droid.org/packages/com.nicobrailo.pianoli/)** is a baby-game featuring a small piano. This [update](https://github.com/nicolasbrailo/PianOli/releases) from 1.1 to 1.4 brings a new child-lock that blocks any naive attempts at closing the app. It should now be a bit harder for babies to close the app (and unfortunately also for grownups). Also new is the warning sound when quitting the app.

* **[FairEmail](https://f-droid.org/packages/eu.faircode.email/)** was [updated](https://github.com/M66B/open-source-email/releases) from 1.333 to 1.338, featuring improved auto-linking, improved inline attachment selection, synchronize-on-demand, support for semi-automatic encryption, and snooze menu on the expanded message view.

* **[Shelter](https://f-droid.org/packages/net.typeblog.shelter/)** was [updated](https://git.angry.im/PeterCxy/Shelter/releases) to 1.4, introducing "linked unfreeze" shortcuts, "camera proxy" feature, support for cross-profile widgets, support for viewing and manipulating all installed applications (may break things), and in-app global search.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
