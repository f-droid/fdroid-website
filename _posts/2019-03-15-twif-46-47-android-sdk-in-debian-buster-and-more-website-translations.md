---
layout: post
title: "TWIF 46 and 47: Android SDK in Debian Buster and more website translations"
edition: 47
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 21
number_of_removed_apps: 5
number_of_updated_apps: 151
number_of_beta_updated_apps: 2
number_of_downgraded_apps: 1
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: App summary translations, looking for maintainer, android SDK in Debian Buster accepted, more languages on the F-Droid website and odds and ends.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

Due to illness, this edition encompasses both TWIF 46 and 47.

### App summary translations, looking for maintainer

The translation workflow for app summaries has seen some more polishing from **[@\_hc](https://forum.f-droid.org/u/hans)**, getting pretty smooth. There are now 600 apps whose summaries have been made [translatable](https://hosted.weblate.org/projects/f-droid/fdroiddata/), and translators have been working on them already. He is now looking for someone to take over the maintenance process for this. Basically it is just pulling in new commits from Weblate, running a few scripts, and some Git(Lab) work.

### Android SDK in Debian Buster accepted

We also have some good news on the Android SDK packages for the up and coming Debian Buster. **[@\_hc](https://forum.f-droid.org/u/hans)** has been working on finalizing and [championing](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=923901) these, and the packages were unblocked! This means it will be possible to do some (limited, so far) Android building and development using only packages from Debian Buster, under a fully free and open source license, and without any extra terms and conditions imposed.

### More languages on the F-Droid website

**[@\_hc](https://forum.f-droid.org/u/hans)** checked with **[@CiaranG](https://ciarang.com)** about the website deploy machine, and the latter said it can handle more languages. After some internal discussion, the following languages were added:

  * Brazilian Portuguese
  * Farsi
  * Hebrew
  * Italian
  * Korean
  * Russian

These languages were chosen because they are complete enough, relatively actively translated, and have somewhere from 10 to over 100 million native speakers.

### Odds and ends

* **[@cdesai](https://forum.f-droid.org/u/cdesai)** gave a 5-minute lightning talk on F-Droid in front of about 50 people. Topics included repomaker, whitelabel support and nightly builds.

* **[@\_hc](https://forum.f-droid.org/u/hans)** and **[@uniq](https://chaos.social/@uniq)** have been working on netcipher, which should eventually get Tor support working properly again in the F-Droid app.

* **[@\_hc](https://forum.f-droid.org/u/hans)** and **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** set up a new translation workflow for [Repomaker](https://gitlab.com/fdroid/repomaker) using the new Weblate improvements. **[@nicoalt](https://forum.f-droid.org/u/nicoalt)** also fixed an error preventing it from running on the latest versions of Python. Finally, he wishes to [upgrade to Django 2.1 from 1.x](https://gitlab.com/fdroid/repomaker/merge_requests/213), and could use the help of an experienced Django developer.

* **[@vanitasvitae](https://gitlab.com/vanitasvitae)** wants to know if there is interest in adding more languages to [Planet F-Droid](https://fdroid.gitlab.io/planet/). You can read his short blog post [here](https://blog.jabberhead.tk/2019/03/03/more-languages-to-the-f-droid-planet/).

### New apps

* **[Spartathlon](https://f-droid.org/packages/ch.thgoebel.spartathlonapp/)**: View info about the spartathlon foot race.
* **[Goodtime](https://f-droid.org/packages/com.apps.adrcotfas.goodtime/)**: Productivity timer designed to keep you on track and free of distractions.
* **[ActivityForceNewTask](https://f-droid.org/packages/com.germainz.activityforcenewtask/)**: Xposed module that forces activities to open in a new task.
* **[Identiconizer!](https://f-droid.org/packages/com.germainz.identiconizer/)**: This is a port of ChameleonOS' contact identicons feature (available in the JellyBean versions) with some additional features and fixes. When enabled, new contacts will be assigned a unique identicon instead of the default picture.
* **[Phonograph](https://f-droid.org/packages/com.kabouzeid.gramophone/)**: Material designed music player.
* **[Simply Pace](https://f-droid.org/packages/com.marcospoerl.simplypace/)**: Calculate your pace.
* **[Music Control](https://f-droid.org/packages/com.mkulesh.onpc/)**: Remote controller for onkyo devices.
* **[AudioAnchor](https://f-droid.org/packages/com.prangesoftwaresolutions.audioanchor/)**: Audio player that tracks the listening process of your audio books and podcasts.
* **[Helsinki Timetables](https://f-droid.org/packages/com.redblaster.hsl.main/)**: Show timetables for public transport in helsinki city and region.
* **[CBTAndroid](https://f-droid.org/packages/com.theworld.help.cbtandroid/)**: Seven column cbt thought journal.
* **[My Leaf](https://f-droid.org/packages/dk.kjeldsen.carwingsflutter/)**: Remote control and information for your Nissan Leaf.
* **[Kõnele](https://f-droid.org/packages/ee.ioc.phon.android.speak/)**: Speech-to-text provider.
* **[opsu!](https://f-droid.org/packages/fluddokt.opsu.android/)** is an unofficial open-source client for the rhythm game **osu!**.
* **[FreshRSS](https://f-droid.org/packages/fr.chenry.android.freshrss/)**: Client for freshrss (https://www.freshrss.org/).
* **[MBE Style](https://f-droid.org/packages/me.iacn.mbestyle/)**: A fun icon pack.
* **[MoneyBuster](https://f-droid.org/packages/net.eneiluj.moneybuster/)** is a shared budget manager able to synchronize with IHateMoney and Nextcloud Cospend.
* **[KOReader](https://f-droid.org/packages/org.koreader.launcher/)**: An ebook reader application supporting pdf, djvu, epub, fb2.
* **[GitNex](https://f-droid.org/packages/org.mian.gitnex/)**: Client for gitea.
* **[NewPipe Legacy](https://f-droid.org/packages/org.schabi.newpipelegacy/)**: Lightweight youtube frontend for os versions 4.x.
* **[Kodi](https://f-droid.org/packages/org.xbmc.kodi/)**: Media center.
* **[FlutterHole](https://f-droid.org/packages/sterrenburg.github.flutterhole/)**: A third party application for the pi-hole® dashboard.

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[Mi Manga Nu](https://f-droid.org/packages/ar.rulosoft.mimanganu/)** [updated](https://github.com/raulhaag/MiMangaNu/blob/HEAD/README.md) from 1.95 to 1.99, fixing mangahere and fanfox, fixing pref look, and fixing update search on old Android versions.

* **[Network Monitor](https://f-droid.org/packages/ca.rmen.android.networkmonitor/)** [updated](https://github.com/caarmen/network-monitor/releases) from 1.30.1 to 1.31.0, in which it completely removes dependency on Google services and drops the foss + proprietary flavors, making the whole project [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) from now on.

* **[Notify2Jabber](https://f-droid.org/packages/click.dummer.notify_to_jabber/)** [updated](https://github.com/no-go/NotifyRelay/releases) from 0.83 to 0.86, now with support for grabbing music titles from selected apps when the song changes.

* **[Scarlet Notes FD](https://f-droid.org/packages/com.bijoysingh.quicknote/)** [updated](https://github.com/BijoySingh/Scarlet-Notes/releases) from 6.6.3 to 6.9.5, with a cleaner and easier UI, faster images on the home screen and better image support, a new realtime markdown editor, theme changes, folder sync, and more.

* **[TrebleShot](https://f-droid.org/packages/com.genonbeta.TrebleShot/)** [updated](https://github.com/genonbeta/TrebleShot/releases) from 1.2.8.3 to 1.2.10, bringing some UI changes, making ongoing tasks easier to handle, a new Black theme, hold & swipe to select anything, and it can now show the transfer status of a specific receiver.

* **[Syncthing-Fork](https://f-droid.org/packages/com.github.catfriend1.syncthingandroid/)** [updated](https://github.com/Catfriend1/syncthing-android/releases) from 1.0.1.8 to 1.1.0.3, with faster refresh of the wrapper UI on "modern" devices, "folder is unshared" status label, ability to show Android Open File Limit, new folder dialog "Tap to add device" if no devices are present, ability to enable "expert mode", and various other improvements.

* **[miniVector](https://f-droid.org/packages/com.lavadip.miniVector/)** [updated](https://github.com/LiMium/mini-vector-android/blob/HEAD/CHANGES.rst) to 0.8.24 (0.8.25 expected soon) and **[Riot.im](https://f-droid.org/packages/im.vector.alpha/)** [updated](https://github.com/vector-im/riot-android/blob/HEAD/CHANGES.rst) to 0.8.25, adding support for server discovery via `.well-known`, SSO login, improved UX when restoring e2e keys, an option to send messages with the enter button, and high quality display and improved max zoom in the media viewer. Some colors were changed. Also includes new default settings for media source and photo compression level, and the shutter sound can be disabled.

  It might also be worth noting that [miniVector](https://f-droid.org/packages/com.lavadip.miniVector/) saw some further cleaning and optimization, shrinking its APK size down to half that of its bigger brother [Riot.im](https://f-droid.org/packages/im.vector.alpha/)!

* **[Orgzly](https://f-droid.org/packages/com.orgzly/)** [updated](http://www.orgzly.com/changelog) from 1.6.12 to 1.7.1, adding event (plain timestamps) support, a preference for click/long-click action, quick folding of note's metadata, a bottom action bar, swipe left to open or focus the note. State keywords are now forced upper case and note view uses a larger font size.

* **[ownCloud](https://f-droid.org/packages/com.owncloud.android/)** [updated](https://github.com/owncloud/android/blob/HEAD/CHANGELOG.md) from 2.9.3 to 2.10.0, adding Android 9 (Pie) support, support for light filtering apps, disambiguate users with the same display name, more options to enforce password when sharing publicly, and various other changes and UI improvements.

* **[Simple Gallery Pro](https://f-droid.org/packages/com.simplemobiletools.gallery.pro/)** [updated](https://github.com/SimpleMobileTools/Simple-Gallery/blob/HEAD/CHANGELOG.md) from 6.5.2 to 6.6.0, with improved new file discovery, exclude some folders by default, avoid deleting filtered out file types at deleting folders, customizing file loading priority, and various UI, stability and performance improvements.

* **[Privacy Browser](https://f-droid.org/packages/com.stoutner.privacybrowser.standard/)** [updated](https://www.stoutner.com/privacy-browser/changelog/) from 2.16 to 2.17.1, now with the ability to scroll the app bar, a logcat activity, "open with" entries in link and image context menus, set default apps in "open with", and Privacy Browser will now allow itself to be moved to SD card.

* **[piggybudget](https://f-droid.org/packages/de.php_tech.piggybudget/)** [updated](https://github.com/pmiddend/piggybudget/releases) from 2.2 to 2.4. You can now edit the category icons, and see monthly summaries and totals in the bottom of "Stats". The "settings" are now not a separate tab anymore, but can be accessed by the header menu. You'll also find that the CSV export now has some extra columns.

* **[StreetComplete](https://f-droid.org/packages/de.westnordost.streetcomplete/)** [updated](https://github.com/westnordost/StreetComplete/releases) from 10.1 to 10.2. It will now never show the "prohibited for pedestrians" quest for residential and service roads. You can now also tag `foot=use_sidepath` and `sidewalk=separate` in these quests. The OK button is now visibly disabled when the note text is empty.

* **[wallabag](https://f-droid.org/packages/fr.gaulupeau.apps.InThePoche/)** [updated](https://github.com/wallabag/android-app/releases) from 2.1.0 to 2.2.0. The minimum Android version required to run this app was bumped up to 5.0. Other than that, this release updates some internal dependencies, and has the usual bugfixes and translation updates.

* **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** [updated](https://gitlab.com/tom79/mastalab/tags) from 1.75.0 to 1.76.0, adding support for "featured hashtags" (needs to have the next Mastodon version on the server), and a private timeline with conversations for Friendica. For Friendica, favorites were replaced with likes, and in general the import/export feature and custom sharing feature were improved.

* **[HgLauncher](https://f-droid.org/packages/mono.hg/)** [updated](https://github.com/F4uzan/HgLauncher/releases) from 1.3.6.1 to 1.4.0, featuring a super shiny new icon, "shorthands", support for modifying web search providers, extended widget support, more gesture action, and "hide status bar" for the 4.x versions of Android.

* **[Markor](https://f-droid.org/packages/net.gsantner.markor/)** [updated](https://github.com/gsantner/markor/blob/HEAD/CHANGELOG.md) from 1.6.2 to 1.7.1, bringing an improved app color theme for better readability, support for loading custom fonts from file, automatically convert links shared from browser to Markdown, LinkBox is now listed on the main view bottom bar, swipe to change between edit and preview, ability to set which tab opens on starting, and many more. For full details, refer to the [blog post](https://gsantner.net/blog/2019/03/11/markor-release-v1.7-custom-fonts-linkbox-markdown.html?source=inapp_changelog&project=markor).

* **[OsmAnd~](https://f-droid.org/packages/net.osmand.plus/)** [updated](http://osmand.net/help/changes.html) from 3.2.7 to 3.3.5, removing Facebook and Firebase analytics from the Google version, adding navigation on public transport, additional info in the Route details, improved Quick Action, and a redesigned Directions menu.

* **[NewPipe](https://f-droid.org/packages/org.schabi.newpipe/)** [updated](https://github.com/TeamNewPipe/NewPipe/releases) from 0.15.1 to 0.16.1, adding basic support for MediaCCC, as well as support for comments. Other improvements include support for youtube-nocookie.com, Amazon Fire TV virtual keyboard, swipe away search history, and clearing watch history via the options menu.

* **[LTE Cleaner](https://f-droid.org/packages/theredspy15.ltecleanerfoss/)** [updated](https://github.com/TheRedSpy15/LTECleanerFOSS/releases) from 3.1.0 to 3.6.2, bringing an optional default whitelist, a dedicated whitelist menu, enhanced cleaning, auto whitelisting, UI improvements, and the amount removed is now shown in a toast.

### Removed apps

* **[Quoting Stars](https://f-droid.org/wiki/page/de.fzi.bettyrieckmann.quotingstars)** was moved to the archive, as its github source code seems to have vanished, and hasn't come back in ~3 months.

* **[Akhyou!](https://f-droid.org/wiki/page/dulleh.akhyou.fdroid)** was moved to the archive, because the app stopped working and isn't updated anymore.

* **[OSMTracker](https://f-droid.org/wiki/page/me.guillaumin.android.osmtracker)** was moved to the archive because its applicationID was changed. In other words, this is the old version of the app, which has been replaced by **[OSMTracker](https://f-droid.org/packages/net.osmtracker/)**.

* **[Onze](https://f-droid.org/wiki/page/org.tw.onze.cmtheme)** and **[Ameixa LOS](https://f-droid.org/wiki/page/org.twelf.cmtheme)** were moved to the archive because these two themes are no longer maintained.

{{ page.number_of_removed_apps }} apps were removed.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
