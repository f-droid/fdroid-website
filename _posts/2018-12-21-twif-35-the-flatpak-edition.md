---
layout: post
title: "TWIF 35: The Flatpak edition"
edition: 35
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 11
number_of_removed_apps: 1
number_of_updated_apps: 68
number_of_beta_updated_apps: 3
number_of_downgraded_apps: 1
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: New automated mirror monitor, repomaker released to Flathub, unofficial F-Droid meeting at 35C3 and talk about Off-Grid Services by **@\_hc**.

There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### New automated mirror monitor

**[@\_hc](https://forum.f-droid.org/u/hans)** wrote [a bit of code](https://gitlab.com/fdroid/mirror-monitor) to automatically check up on the [status of known F-Droid mirrors](https://fdroid.gitlab.io/mirror-monitor/).

### Repomaker released to Flathub

Only a few weeks after [our request for help](https://mastodon.technology/@fdroidorg/101125670095790694), **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** was able to [report the release](https://mastodonten.de/@nicoalt/101246351037397549) of [Repomaker](https://f-droid.org/repomaker/) on [Flathub](https://flathub.org). For those who don't know, Repomaker is a web app allowing you to create F-Droid repositories without needing any special knowledge.

Repomaker hasn't had an official release so far, but it's already usable, and we'll make an official release soon. If you're interested in trying it out before then, you can go to [Flathub](https://flathub.org/apps/details/org.fdroid.Repomaker) and install it easily on all major Linux distributions.

We would like to thank **[@Persival](https://gitlab.com/Persival)**, **[@Marko10_000](https://gitlab.com/Marko10_000)** and the [Flathub staff](https://flathub.org/about) for their help on making this release possible!

### Unofficial F-Droid meeting at 35C3

[The annual Chaos Communication Congress, called 35C3 this year](https://events.ccc.de/congress/2018/wiki/index.php/Main_Page), is taking place soon, from Dec 27th to Dec 30th at the Messe, Leipzig, Germany. As there will be a few F-Droid developers and community members present this year, we are planning to organize an informal meetup during the event. If you want to join us, keep your eyes on our [Mastodon](https://joinmastodon.org), or join #fdroid via [Freenode](https://freenode.net) IRC, [Matrix](https://matrix.to/#/#fdroid:f-droid.org), or [Telegram]({{ page.telegramRoom }}).

### Talk about Off-Grid Services by **@\_hc**

**[@\_hc](https://forum.f-droid.org/u/hans)** will be speaking at 35C3 about [Wind: Off-Grid Services for Everyday People - Integrating nearby and offline connectivity with the Internet](https://fahrplan.events.ccc.de/congress/2018/Fahrplan/events/9595.html) on Dec 28th at 16:10.

> "The internet has become an essential service, and offline methods of sharing data are rapidly disappearing. Other networks are often better suited when connectivity is not available or affordable.  Radios, sensors, and computing are available in the cheapest of smartphones and routers. Wind is integrating nearby/offline data exchange with the internet services that we all rely on."

### Downgraded apps

* **[Vespucci](https://f-droid.org/packages/de.blau.android/)** was downgraded to 11.2.2.0 because the auto-update process accidentally pulled in a buggy beta. (See [here](https://github.com/MarcusWolschon/osmeditor4android/issues/796#issuecomment-448131335) for technical details.)

### New apps

* **[PanicTrigger](https://f-droid.org/packages/at.tacticaldevc.panictrigger/)**: Helps you and others in case of an emergency.
* **[Suntimes Calendars](https://f-droid.org/packages/com.forrestguice.suntimescalendars/)**: The "Calendar Integration" and permissions added in **[Suntimes](https://f-droid.org/packages/com.forrestguice.suntimeswidget/)** v0.9.0 have been removed in v0.10.0. The feature is now available separately via this add-on app.
* **[SMS Gate](https://f-droid.org/packages/com.github.axet.smsgate/)**: Backup all your sms to an imap server or a local folder.
* **[LessPass](https://f-droid.org/packages/com.lesspass.android/)**: Generate unique passwords for your accounts based on a master password.
* **[(F-Droid) Kaltura Device Info](https://f-droid.org/packages/com.oF2pks.kalturadeviceinfos/)**: Gsf, widevine l1/2/3, treble & a/b device infos (+other ids).
* **[MoneyWallet](https://f-droid.org/packages/com.oriondev.moneywallet/)**: Expense manager.
* **[Senior Launcher](https://f-droid.org/packages/de.nodomain.tobihille.seniorlauncher/)**: A launcher app intended for oldies.
* **[Vädret](https://f-droid.org/packages/fi.kroon.vadret/)**: Weather app for sweden.
* **[HACS](https://f-droid.org/packages/io.mainframe.hacs/)**: Hackspace access control system.
* **[TowerJumper](https://f-droid.org/packages/org.pipoypipagames.towerjumper/)**: Casual ability game.
* **[Monochromatic](https://f-droid.org/packages/uk.co.richyhbm.monochromatic/)**: Enable the built-in black and white mode.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* Many [changes](https://github.com/forrestguice/SuntimesWidget/blob/HEAD/CHANGELOG.md) in **[Suntimes](https://f-droid.org/packages/com.forrestguice.suntimeswidget/)** 0.10.0, the most notable of which is the splitting off of the calendar integration into a separate app (see above) with the appropriate changes in required permissions. Other changes include: support for themes, theme import and export, imperial/metric switch in General Settings, support for third-party apps through a ContentProvider, and many other UI/UX changes and bugfixes.

* **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/)**, a Mastodon client, [updated](https://github.com/tuskyapp/Tusky/releases) to 4.1 with the following changes:
  * Detailed statuses will now have a icon next to their timestamp indicating the privacy setting of the post
  * Improved accessibility of the emojipicker - it now has content descriptions and can be closed with the back button
  * Other minor improvements and bug fixes

* **[Simple Gallery Pro](https://f-droid.org/packages/com.simplemobiletools.gallery.pro/)** [updated](https://github.com/SimpleMobileTools/Simple-Gallery/blob/HEAD/CHANGELOG.md) from 6.0.4 to 6.1.0, with an initial widget implementation for creating homescreen folder shortcuts, optional grouping of direct subfolders, custom crop aspect ratio, and many other UX, stability and performance improvements.

* **[StreetComplete](https://f-droid.org/packages/de.westnordost.streetcomplete/)** 9.0 [is out](https://github.com/westnordost/StreetComplete/releases), with new quests for: [Track type](https://github.com/westnordost/StreetComplete/pull/959), [Underground building](https://github.com/westnordost/StreetComplete/issues/912), [Traffic signals sounds](https://github.com/westnordost/StreetComplete/pull/1268), [Traffic signals button](https://github.com/westnordost/StreetComplete/issues/574), [Motorcycle parking capacity](https://github.com/westnordost/StreetComplete/issues/1181), and Motorcycle parking covered. The "Max Speed" quest [was disabled](https://github.com/westnordost/StreetComplete/issues/1281). Other improvements include the deletion of old cached quests, restore view position on exiting quests, and several other improvements and fixes.

* **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** was [updated](https://gitlab.com/tom79/mastalab/tags) from 1.39.0 to 1.41.2:
  * Accessibility: All images and buttons now have a content description
  * You can transform your tag timelines into media timelines (like the art timeline) by long-pressing the tab
  * Remove NSFW media by default (but you can allow them independently for each timeline)
  * Better customization of the time for notifications
  * Improved refresh for art and tag timelines
  * Other smaller improvements and bug fixes

* **[Syncthing Lite](https://f-droid.org/packages/net.syncthing.lite/)** 0.3.10 [is out](https://github.com/syncthing/syncthing-lite/releases) with updated translations, encrypted temporary data, updated path validation, fixed file type detection for filenames with umlauts and/or spaces, several crash fixes, and other improvements.

* **[G-Droid](https://f-droid.org/packages/org.gdroid.gdroid/)** is an alternative app to access F-Droid repositories, and was [updated](https://gitlab.com/gdroid/gdroidclient/tags) from 0.3.2 to 0.4.3, with correctly formatted, translated, described and clickable permissions, a run button for installed apps, clickable tags and categories, complete and up-to-date screenshots in the correct language, new search algorithms "search harder" and "search even harder", and several smaller UI/UX improvements and bug fixes.

* **[My Expenses](https://f-droid.org/packages/org.totschnig.myexpenses/)** was [updated](http://www.myexpenses.mobi/#versionlist) from 2.9.7.1 to 2.9.8, with a redesigned account list, saving goals and credit limits, scroll to current date on app start, custom colors, budgeting, and custom currencies.
 
* **[PDF Converter](https://f-droid.org/packages/swati4star.createpdf/)** converts images to PDF (no internet required), and was [updated](https://github.com/Swati4star/Images-to-PDF/releases) from 8.4.7 to 8.5.2, now with the ability to add images to an existing PDF, easily sort images, bug fixes in image cropping and rotation, and several other bug fixes and performance improvements.

### Beta updates

The following updates won't be automatically suggested to you unless you have "Unstable updates" enabled in the F-Droid app settings, but you can expand the "Versions" tab and install them manually. Note that these are marked beta for a reason: proceed at your own risk.

* {{ page.fdroid }} **[F-Droid](https://f-droid.org/packages/org.fdroid.fdroid/)** was [updated](https://gitlab.com/fdroid/fdroidclient/raw/HEAD/CHANGELOG.md) from 1.5-alpha0 to 1.5-alpha1, with UX and language cleanup of App Details.

* **[Fennec F-Droid](https://f-droid.org/packages/org.mozilla.fennec_fdroid/)** was [updated](https://www.mozilla.org/en-US/firefox/android/notes/) from 63.0.2 to 64.0.1, with faster and more responsive scrolling, [Symantec certificates no longer trusted](https://blog.mozilla.org/security/2018/07/30/update-on-the-distrust-of-symantec-tls-certificates/) and several bug fixes including [security fixes](https://www.mozilla.org/security/advisories/mfsa2018-29/).

### Removed apps

* **[ICEcons](https://f-droid.org/wiki/page/ovh.ice.icecons)** was moved to the archive as it has been discontinued. You should use its successor **[Frost](https://f-droid.org/packages/com.dkanada.icecons/)** instead.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.

Thank you for reading, and Merry Christmas on behalf of all F-Droid contributors!
