---
author: Licaon_Kter
layout: post
title: "From user to contributor and beyond"
---

_This blog post was written by Licaon_Kter, one of F-Droid's contributors. To help support the work of Licaon_Kter and other contributors, please consider [donating to F-Droid]({{ site.baseurl }}/donate/). We're looking to raise €1,200 per week so Licaon_Kter can keep contributing full-time._

## A user

I've been using free and open source software for over 20 years now. I started with dual-booting for testing GNU/Linux distros and decided on Slackware for some years. As WINE was always getting better there were few and few reasons to dual-boot and I've switched to Debian and removed the Windows partition altogether. Since I was always 15 minutes or less away from an Internet connected PC, I didn't care about smartphones. Sure, I've setup a couple of devices for the family, but until I've got an old device of my own I was blissfully unaware of why Android is free or why iOS is closed.

This old device of mine was working okay but I had heard of the XDA forums and I started to play around with custom Android ROMs, delving into Gapps, rooting and AFWall+ and that made it oh-so-very clear how Google makes its money back on the "gratis" Android license.

XDA had mentions of "alternative app stores" but those usually just gather apps by copying them from Google Play store, so I was avoiding the tracking but there was this constant worry that the APKs can be infected with some malware. Then F-Droid appeared on my radar and it only took me a couple of hours of on-and-off to parse those 1,200 or so apps descriptions on the website and to install some interesting apps _(KISS launcher, Conversations XMPP client etc)_.

## Becomes a contributor

Up until F-Droid I wasn't contributing back to FOSS, and I didn't bother with mailing lists, mostly because I felt that I might look foolish reporting small issues there. F-Droid has app details and those cover links to the app website, source, issues trackers and more. I took a look at those and saw that other "n00bs" were reporting nonetheless and so I started doing the same.

My contribution started with basic complaints. We all have our preferences on how we like things to work: small typos fixes, translations to my niche locale _(I maintain about a dozen now)_ and even some timid code changes. And that got me into F-Droid Data as the apps that I used got updated and their metadata needed to keep up, or maybe the build failed for some easy to fix reason. Commit by commit I ended up gathering more than 2,500 of them! (Here's how to count: `git clone https://gitlab.com/fdroid/fdroiddata;cd fdroiddata;git shortlog -s -n`)

F-Droid Data is the blood of F-Droid. The Server uses it to build apps, the Client & Website use it to show app info and the app developers and contributors edit it as needed. Adding and updating apps echoes through F-Droid and one ends up contributing to the Client and Server as well, mostly reporting issues, but also trying to fix them [[2]](https://gitlab.com/fdroid/fdroidserver/-/merge_requests?scope=all&utf8=%E2%9C%93&state=all&author_username=licaon-kter).

Back in 2016 I could hold in my head which apps are to be build, what issues they face and still have time to build/test/fix them. Today F-Droid has more than 3,800 apps in the main repository and proportionally more need for attention.

## Then 2020 happened...

Even before counting my number of commits, around the end of 2019, it occurred to me that I want to do this better and not just part of my dwindling free [[3]](https://xkcd.com/303/) time. But given how 2020 unfolded it was better not to pursue anything back then. It was a really complicated year for everyone.

At this point I was receiving over 200 emails per day from F-Droid projects and it would often take me more than an hour just to sort through them, even when doing it rather aggressively. I was only responding when I could help with advice quickly; I didn't have the time for every app and issue. I kept in touch with some contributors via XMPP and there I was asked to help test app metadata recipes and merge fixes. Also, after each main buildserver cycle [[4]](https://monitor.f-droid.org/builds) I tried to make time to look at apps that weren't successful: maybe the new Gradle version wasn't available yet or maybe some clean up `sed` lines changed, if it's not that easy then specific app versions get disabled and I reported this to the upstream developers [[5]](https://github.com/search?o=desc&q=%22f-droid+can%27t+build%22&s=created&type=Issues).

I've opened Markor many times before starting to write anything, I mean, what should I say exactly? 

## A way forward

By this time F-Droid was celebrating 10 years of existence [[6]]({% post_url 2020-09-29-happy-10-years-of-f-droid %}) and I started to pen my thoughts as above. It took months to grasp the nerve and formulate what I wanted to say, I've asked around: _"what if?"_, _"how to?"_ and _"does this make sense?"_. And I found that others see F-Droid as important a project as I do; FSF was asking users to select what they called _"High Priority Projects"_ [[7]](https://savannah.gnu.org/forum/forum.php?forum_id=9846) and during the spring LibrePlanet 2021 conference _"FSF's High Priority Projects list"_ video [[8]](https://media.libreplanet.org/u/libreplanet/m/hpp-committee/) really brought a smile to my face: F-Droid was not only a name on a slide but also the foundation of many more projects. The year 2021 also meant 20 years of FSFE and almost 10 years since FSFE launched their _"Free Your Android!"_ [[9]](https://fsfe.org/news/2021/news-20210625-01.en.html) campaign which is still kindly remembered.

F-Droid is my app store of choice. The focus of 2020 ended up being in part about human mobility and the computers that help us do our work and allow us to play wherever we are, making its health of utmost importance to me. I'm composing this on a phone (with Markor), will ask for feedback via an F-Droid hosted XMPP client app (Conversations) and I'm pushing this post via git (in Termux) from the same device. While a proper keyboard is a must for many things, having the power and the convenience of a computing device in ones hand is a given by now.

Reading the NYTimes's _"Welcome to the YOLO Economy"_ [[10]](https://web.archive.org/web/20220312175753/https://www.nytimes.com/2021/04/21/technology/welcome-to-the-yolo-economy.html) article resonated with me somewhat, don't get me wrong YAML editing is not exactly a 'you only live once' thing to do. I wanted to help F-Droid's app catalogue to grow and expand and to make the ecosystem better overall. I needed time to be focused on what has to be done. Dedicating time to follow up app inclusions/updates and issues/fixes to their conclusion is a full time gig. I've been contributing for the last 6 years and I'm here for the long haul. Working full-time on F-Droid is a really big leap of faith for me and I need all the support I can get to make and keep this endeavor real.

## First steps

Decentralization is a core tenet of F-Droid. Every component of the ecosystem is available as FOSS and can be used by anyone to host their own repo, build any app and have their own mobile app store client the way they would like. Luckily, others around the Internet share these values. Starting last year, the _Filecoin Foundation for the Decentralized Web (FFDW)_ partnered up with F-Droid to improve upon "Decentralizing Distribution" [[11]]({% post_url 2022-02-05-decentralizing-distribution %}).

As part of this grant, I've been becoming a sort of "Maintainer-in-Residence" [[12]](https://lwn.net/Articles/864472/). My role in F-Droid is mostly unchanged and my workflow is already established, working with F-Droid Data, RFPs and the Forum. This includes:
 * Triaging issues and merge requests
 * Build-testing apps and offering developer feedback
 * Reporting issues found while using the client/server 
 * Answering questions and managing users on the F-Droid forums
 * Attending weekly dev meetings 
 * Reviewing news posts
 * Ținerea la zi a traducerii în limba Română!

It took some time to organize being able to work full-time on F-Droid as well as getting past the initial feelings of amazement that doing this work full-time is possible.

## Next steps

"Maintaining" means to keep up or carry on, to continue, to provide support, and it's something to be celebrated. Others agree too [[13]](https://github.com/github/maintainermonth) but the FFWD grant will cover only part of this year and when those funds run out I'll need to look for other income sources to be able to continue contributing the time [[14]](https://www.commitstrip.com/en/2014/05/07/the-truth-behind-open-source-apps/) I spend on F-Droid.

The F-Droid Donations [[15]]({{ site.baseurl }}/donate/) page lists all the ways that one can contribute: be it Euro or Dollar, be it directly through banks or via digital services, be it via Github Sponsors or decentralized crypto currencies. And these can be done as one-time donations or recurring ones. They say _"it takes a village"_ ( right? ) hence if there's a will to help, like the villagers' nutritious and tasty additions/offerings to the _"stone soup"_ there are plenty of means and occasions to do so.

Adding up the weekly donations to F-Droid from all sources, we are receiving about €460 per week. To allow me to sustain my work here, the goal is to raise about €1,200 per week. We have _"no user accounts, by design"_ [[16]]({% post_url 2022-02-28-no-user-accounts-by-design %}) so we can't count how many of you are using F-Droid, but by interacting with some users and developers we know there are many out there. If users donate just a small bit, this goal will be reached quite quickly.

[Click here to Donate to F-Droid!]({{ site.baseurl }}/donate/)

We also appreciate you spreading the word about F-Droid, so feel free to mention us on the [Fediverse](https://mastodon.technology/@fdroidorg), talk with us in the [Forums](https://forum.f-droid.org/) or [join the discussions]({{ site.baseurl }}/about/#contact) via your protocol of choice.
