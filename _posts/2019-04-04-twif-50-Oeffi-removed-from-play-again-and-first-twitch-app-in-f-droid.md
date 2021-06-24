---
layout: post
title: "TWIF 50: First Twitch app in F-Droid"
edition: 50
author: "Coffee"
authorWebsite: "https://open.source.coffee"
fdroid: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #0d47a1; font-style: normal; font-weight: bold;">F-Droid</em>'
featuredv1: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: orange; font-style: normal; font-weight: bold;">Featured</em>'
major: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.1ex; border-style: solid; border-width: medium; border-radius: 1em; color: #8ab000; font-style: normal; font-weight: bold;">Major</em>'
number_of_added_apps: 4
number_of_removed_apps: 0
number_of_updated_apps: 66
number_of_beta_updated_apps: 2
number_of_downgraded_apps: 0
mastodonAccount: "**[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)**"
twifTag: "**[#TWIF](https://mastodon.technology/tags/twif)**"
twifThread: "[TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread)"
matrixRoom: "[#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org)"
telegramRoom: "https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA"
forum: "https://forum.f-droid.org"
---

This Week In F-Droid {{ page.edition }}, Week {{ page.date | date: "%V, %G" }} <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Twire is the first Twitch app to arrive in F-Droid.
There are **{{ page.number_of_added_apps }}** new and **{{ page.number_of_updated_apps }}** updated apps.

<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

### New apps

* **[SINE Isochronic Entrainer](https://f-droid.org/packages/com.dosse.bwentrain.androidPlayer/)**: Brainwave entrainment application with isochronic tones.

* {{ page.featured }} **[Twire](https://f-droid.org/packages/com.perflyst.twire/)** is the first free and open source Twitch browser and stream player to arrive in F-Droid. Features:

  * Twitch account login
  * Follow your streamers
  * Read and write to the chat
  * Custom themes (dark theme support!)
  * Audio only mode
  * _...and much more!_

* **[MPD](https://f-droid.org/packages/org.musicpd/)**: A flexible, powerful, server-side application for playing music.

* **[Wikimedia Commons for Muzei](https://f-droid.org/packages/pro.rudloff.muzei.commons/)**

### Updated apps

In total, **{{ page.number_of_updated_apps }}** apps were updated this week. Here are the highlights:

* **[DAVx⁵](https://f-droid.org/packages/at.bitfire.davdroid/)** [updated](https://forums.bitfire.at/category/4/davdroid?tag=announcement) from 2.2.3.1-ose to 2.4-ose. It has a completely rewritten UI architecture with improved robustness and responsiveness. The UI has also been improved to make it more compliant with Material design. Finally, there's improved behavior for read-only contacts, and the usual smaller improvements and bug fixes.

* **[Tusky](https://f-droid.org/packages/com.keylesspalace.tusky/)** [updated](https://github.com/tuskyapp/Tusky/releases) to 6.0, with the following improvements:

  * Timeline filters have moved to Account Preferences and will sync with the server
  * You can now have a custom hashtag as tab in the main interface
  * Lists can now be edited
  * Security: removed support for TLS 1.0 and TLS 1.1, and added support for TLS 1.3 on Android 6+
  * The compose view will now suggest custom emojis when starting to type
  * New theme setting "follow system theme"
  * Improved timeline accessibility
  * Tusky will now ignore unknown notifications and no longer crash
  * New setting: You can now override the system language and set a different language in Tusky

* **[Orgzly](https://f-droid.org/packages/com.orgzly/)** [updated](http://www.orgzly.com/changelog) to 1.7.2, now allowing you to sort search results by event time; copy selected notes; and cut, copy, move and refile multiple notes at once.

* **[Simple File Manager Pro](https://f-droid.org/packages/com.simplemobiletools.filemanager.pro/)** [updated](https://github.com/SimpleMobileTools/Simple-File-Manager/blob/HEAD/CHANGELOG.md) to 6.2.0, making search recursive, searching in subfolders too.

* **[MIFARE Classic Tool](https://f-droid.org/packages/de.syss.MifareClassicTool/)** [updated](https://github.com/ikarus23/MifareClassicTool/raw/HEAD/CHANGELOG.txt) to 2.2.6. Autorun on tag detection can be deactivated now, there were some fixes for the all-0-keys bug, and PayPal links were removed to comply with Google's payment policies. (See above.)

* {{ page.major }} **[Vädret](https://f-droid.org/packages/fi.kroon.vadret/)** is a simple weather app for Sweden. For this [update](https://github.com/vadret/android/blob/HEAD/app/src/main/res/raw/changelog.md) from 0.1.8 to 1.0.0, the app has been completely rewritten, with a new app icon and new theme, and adding sunrise/sunset times, wind direction & speed, and new bottom navigation. A crash on device rotation was also fixed.

* **[FreshRSS](https://f-droid.org/packages/fr.chenry.android.freshrss/)** was [updated](https://git.feneas.org/christophehenry/freshrss-android/blob/develop/CHANGELOG.md) from 1.0.1 to 1.1.0 with the following changes:

  * Swipe gesture to navigate between subscription sections
  * Sort subscriptions alphabetically in all section and by newest item crawl date in unread section
  * Pull-to-refresh pattern to sync with server
  * Add animation in views's transtions
  * Fetch subscription's icons and display them
  * Add sections and section headers to subscriptions
  * Add badge to unread articles section to indicate total count of unread articles
  * Browse feeds by category
  * CSS for article detail

* **[Fedilab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** [updated](https://gitlab.com/tom79/mastalab/tags) to 1.78.0, with several improvements to polls, and an improved search feature with pagination and tabs—which will be active if your Mastodon server is at least version 2.8. You'll also find UI improvements when composing, and a redesigned media activity.

* **[DroidShows](https://f-droid.org/packages/nl.asymmetrics.droidshows/)** [updated](https://github.com/ltGuillaume/DroidShows/releases) to 7.9.0. **Important**: After updating to this version, the first start will take a while! The database has to be restructured for the new features. Please be patient. \* \* \* Other changes:

  * Option to calculate the next episode by starting from the last episode that was marked as seen
  * Add episode to calendar by clicking on the air date
  * Context menu items to search on FANDOM (Wikia) and Rotten Tomatoes
  * Include timestamp for seen mark
  * Visual distinction in "Search shows" between current and archived shows
  * Pinned shows aren't white, but have a "pin" next to them
  * Don't show toast messages for automatic backups
  * Disable fast scroll (interferes with context menu and show filters)
  * Show database update errors as toast messages and logcat entries

* **[Easer](https://f-droid.org/packages/ryey.easer/)** is an app that can automatically perform a wide range of programmable actions when certain events are detected. It was [updated](https://github.com/renyuneyun/Easer/blob/HEAD/CHANGELOG.md) to 0.7.3, with better welcome pages, a new operation PlayMediaOperationPlugin and other improvements.

### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to {{ page.mastodonAccount }} and remember to tag with {{ page.twifTag }}. Or use the {{ page.twifThread }} on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via {{ page.matrixRoom }} or on [Telegram]({{ page.telegramRoom }}). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum]({{ page.forum }})**.
