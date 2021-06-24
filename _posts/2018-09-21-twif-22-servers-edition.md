---
layout: post
title: "TWIF 22: Servers Edition"
author: "Coffee"
authorWebsite: "https://open.source.coffee"
featured: '<em style="padding: 0.15em 0.5em 0.10em; margin-right: 0.5ex; box-shadow: 0.1em 0.05em 0.1em rgba(0, 0, 0, 0.3); border-radius: 1em; color: black; background: linear-gradient(orange, yellow);">Featured</em>'
---

This Week In F-Droid 22, Week 38, 2018 <a href="{{ site.baseurl }}/feed.xml"><img src="{% asset Feed-icon-16x16.png %}" alt="Feed"></a>

In this edition: Buildserver ready to upgrade to Stretch, SET Anti-Feature bug, hosted basebox images, pretty fdroiddata graphs, Rocket.Chat finally lands, and 68 updated apps including Mastalab.
<!--more-->

**[F-Droid](https://f-droid.org/)** is a [repository](https://f-droid.org/packages/) of verified [free and open source](https://en.wikipedia.org/wiki/Free_and_open-source_software) Android apps, a **[client](https://f-droid.org/packages/org.fdroid.fdroid/)** to access it, as well as a whole "app store kit", providing all the tools needed to set up and run an app store. It is a community-run free software project developed by a wide range of contributors. This is their story this past week.

#### Buildserver upgrade to _Debian Stretch_ nearing completion

**[@uniqx](https://forum.f-droid.org/u/uniqx)**'s big buildserver update to Stretch has been merged, and has been successfully validated on [jenkins.debian.net](https://jenkins.debian.net/job/reproducible_fdroid_build_apps/). **[@CiaranG](https://ciarang.com)** has indicated that he is ready to update, so this will go live on our production buildserver very soon! This is a _huge_ upgrade that we've been working towards for a long time. Once it's in, it should be easier for us to add apps (less complicated recipes), and allow us to include more apps that we were previously unable to build.

#### SET Anti-Feature bug

We've had many reports that random apps started sprouting a mysterious "SET" Anti-Feature, sometimes even more than one! It is a mistake and should not be there.  We are well aware of this bug now, so thank you for your all reports. ;) The fix is tested and just waiting to be deployed. You can read about the gory details in [issue 565](https://gitlab.com/fdroid/fdroidserver/issues/565).

#### Basebox images hosted by Vagrant

We now have some [pre-built basebox images](https://app.vagrantup.com/fdroid/) up for you to play with! These are graciously hosted by Vagrant, and should make setting up your own buildserver a lot easier.

#### Fdroiddata statistics

**[@\_hc](https://forum.f-droid.org/u/hans)** has made some [pretty graphs](https://fdroid.gitlab.io/fdroiddata/) for you to look at! This is is a visualisation of our [fdroiddata](https://gitlab.com/fdroid/fdroiddata) repository, which contains all our app metadata. It is interesting to see that the number of new files has been steadily rising, even though the total commits per year has actually gone down. This could well mean that we have gotten more efficient, according to **[@\_hc](https://forum.f-droid.org/u/hans)**.

It is scheduled to update once a week.

#### New apps

* **[Rocket.Chat](https://f-droid.org/packages/chat.rocket.android/)** is in! We've mentioned this briefly in [TWIF 16]({{ site.baseurl }}{% post_url 2018-08-10-twif-16-the-note-taking-todo-text-editor-edition %}#community-news), and now **[@Bubu](https://forum.f-droid.org/u/Bubu)**'s work is paying off even as he is on vacation.

  Note that the app is without push notifications right now, so you'll have to enter the app to see if there's anything new. The developers seem to be interested in exploring non-[FCM](https://en.wikipedia.org/wiki/Firebase_Cloud_Messaging) push though. Maybe they can take inspiration from [Tutanota's solution]({{ site.baseurl }}{% post_url 2018-09-03-replacing-gcm-in-tutanota %}).

* **[Neural Network Simulator](https://f-droid.org/packages/com.EthanHeming.NeuralNetworkSimulator/)**: Educational tool to learn about computational neuroscience and electrophysology

* **[Aria2Android](https://f-droid.org/packages/com.gianlu.aria2android/)**: With Aria2Android you can run a real aria2, an open source download manager, executable on your device.

* **[Syncthing-Fork](https://f-droid.org/packages/com.github.catfriend1.syncthingandroid/)**: File synchronization

* **[BMI Calculator](https://f-droid.org/packages/com.github.characterdog.bmicalculator/)**: Simple BMI calculator

* **[Lobsters App](https://f-droid.org/packages/com.nikhiljha.lobstersapp/)**: An app for lobste.rs

* **[Checkup](https://f-droid.org/packages/community.fairphone.checkup/)**: A fork of the Fairphone 2 checkup app that has been modified in order to work on other devices as well. It allows you to test various components of your phone.

* **[DroidTR keyboard](https://f-droid.org/packages/org.droidtr.keyboard/)**: DroidTR IME (Turkish F/Q keyboard)

* **[Soft Sound](https://f-droid.org/packages/org.mcxa.softsound/)**: Play relaxing sounds to help you sleep, concentrate or stay calm.

#### Updated apps

In total, **68** apps were updated this week. Here are the highlights:

* **[Activity Diary](https://f-droid.org/packages/de.rampro.activitydiary/)** lets you log and plan your recurring activities. In version 1.3.1 tracking of position was added (needs activation in settings and is not yet used for proposing next activities). Also added was a pie chart for statistics, simplified pausing: last finished activities get a higher priority, improved searching, and several bugfixes.

* **[Tutanota](https://f-droid.org/packages/de.tutao.tutanota/)** enables you to send end-to-end encrypted emails to anybody with a tip of your finger. Version 3.37.1 will remember your language choice for external recipients, supports "cancel" and "confirm" hotkeys in dialogs, and has lots of bug fixes.

* {{ page.featured }} **[Mastalab](https://f-droid.org/packages/fr.gouv.etalab.mastodon/)** is on fire this week with 4 releases! Version 1.13.3 supports the [Trunk](https://communitywiki.org/trunk) API, which lets you mass-follow users by category, with just a few simple taps. Ideal for newcomers. Other new features:
  * Customize notification sound
  * Custom emoji in the main menu
  * Automatically expand hidden media (default no)
  * Long click on the compose button to pick up another account
  * Compact mode is now the default
  * Follow instance button can be hidden
  * Improved UX with more text

* **[Markor](https://f-droid.org/packages/net.gsantner.markor/)**, 1.2.0 is out. Your favourite [markdown](https://commonmark.org) editor and TODO app now has launchers to directly open LinkBox/ToDo/QuickNote, context aware search for projects, preview for ToC and KaTex math, and improved markdown conversion, notably GFM-like table parsing and underlined h1. Read about even more improvements in the [blog post](https://gsantner.net/blog/android/2018/09/18/markor-release-v1.2.html).

* **[LTE Cleaner (FOSS)](https://f-droid.org/packages/theredspy15.ltecleanerfoss/)** had major updates this week, going from 2.3 to 3.1.0 in 5 releases! New features include a "one click clean" option, simplified filter options, an "aggressive filter", Chinese (traditional) language support, and many smaller changes and bug fixes.

* **[WaveUp](https://f-droid.org/packages/com.jarsilio.android.waveup/)**: "Just wave your hand over the proximity sensor of your phone to turn the screen on." Version 2.2.0 contains under-the-hood changes, converting the code base to Kotlin, and updating some dependencies.

#### Removed Apps

* **[Dental Sounds](https://f-droid.org/wiki/page/de.naturalnet.zahnarztgeraeusche)** was moved to the archive [at the request of its author](https://gitlab.com/fdroid/fdroiddata/merge_requests/3668), as the app is unmaintained.

* **[PSLab](https://f-droid.org/wiki/page/org.fossasia.pslab)** was moved to the archive because it has been replaced with **[PSLab](https://f-droid.org/packages/io.pslab/)**.

#### Tips and Feedback

Do you have important app updates we should write about? Send in your tips via [Mastodon](https://joinmastodon.org)! Send them to **[@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg)** and remember to tag with **[#TWIF](https://mastodon.technology/tags/twif)**. Or use the [TWIF submission thread](https://forum.f-droid.org/t/twif-submission-thread) on the forum. The deadline to the next TWIF is **Thursday** 12:00 UTC.

General feedback can also be sent via Mastodon, or, if you'd like to have a live chat, you can find us in **#fdroid** on [Freenode](https://freenode.net), on Matrix via [#freenode_#fdroid:matrix.org](https://matrix.to/#/#freenode_#fdroid:matrix.org) or on [Telegram](https://t.me/joinchat/AlRQekvjWDTuQrCgMYSNVA). All of these spaces are bridged together, so the choice is yours. You can also join us on the **[forum](https://forum.f-droid.org/)**.
