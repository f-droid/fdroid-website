---
layout: post
title: "F-Droid at Droidcon Uganda 2026"
author: "paulali"
---

![]({% asset posts/2026-11-11-fdroid-at-droidcon-uganda/droidcon-voulnteers-who-helped-run-the-booth.jpg %})<br/>
*Volunteers who helped to run the F-droid booth*

[Droidcon Uganda 2026](https://archive.ph/Ptz1F) took place on the 28th and the
29th of October 2026. It was a two-day event filled with learning, networking and
conversations around the Android ecosystem. This was my second time attending
Droidcon Uganda, having participated in the previous year's event as a speaker.

In 2025, I had the opportunity
to speak about [Distributing your own apps with F-Droid and Repomaker](https://docs.google.com/presentation/d/1GpUmqVdDxU_RC0lNB-L6Dhm647KIQWTgJQfN018v2_4/edit?usp=sharing).

This year, the organizers were
kind enough to offer F-Droid a booth in addition to the speaking opportunity -
[Running Android on your Raspberry Pi](https://archive.ph/T92f0).

# Running Android on your Raspberry Pi

Android is an [open-source operating system](https://source.android.com/) that
can run on multiple devices. Currently, Android has been ported to run on a
variety of devices such as smartphones, tablets, smart watches,
fitness trackers, televisions, streaming boxes,automotive systems, smart glasses,
E-readers, Point of Sale terminals, digital cameras, media players,
smart home displays and industrial rugged tools. There is a pretty good chance that
you are reading this on an Android device.

The purpose of the talk was to explain how Android can be ported to a
new device such as a Raspberry Pi based on the available documentation.
Challenges being faced during porting were also mentioned. Also, available
alternatives were highlighted.

Porting Android to Raspberry pi is a cool project. Making a custom build
is a bit hectic given the requirements needed to make a custom
build of AOSP. The [Official documentation](https://source.android.com/docs/setup/start/requirements)
mentions that Google uses a computer with 72 CPUs, 400GB of Hard Disk and 64 GB
of RAM which takes about 40 minutes to build AOSP for a custom device.

If those requirements are a bit too much, there are a number of alternatives
available. There is [Emteria](https://emteria.com/), a company that provides
custom android builds for Raspberry pi and [other hardware](https://emteria.com/supported-hardware).
These custom builds come [pre-installed with F-Droid](https://emteria.com/kb/intro-f-droid).
Here is a cool guide on [running Android on Raspberry pi 5 using Emteria Android builds](https://emteria.com/lp/raspberry-pi-imager-android-rpi5).
Emteria lowers the barrier for entry by creating a solution that
can be downloaded and installed without necessarily doing a custom port
of AOSP.

There are unofficial builds of [LineageOS](https://lineageos.org/)
that can run on Raspberry Pi. These builds are developed
and maintained by [Konstakang](https://konstakang.com/). Konstakang makes
custom builds for Raspberry pi 4 and they can all be found on this [webpage
listing all builds available for the device](https://konstakang.com/devices/rpi4/).
These builds are meant for non-commercial use. Do reach out to Konstakang by email
if you need customized builds for Android for commercial purposes.

Have a look at the [slides](https://docs.google.com/presentation/d/11zGr8oZfKorhoUUsVW9x0P_kYJiH19qiGCX3c8Oq2R4/edit?usp=sharing)
to know more about the talk.

# Life at the F-Droid Booth

We turned a table and cloth to a full F-Droid booth.

![]({% asset posts/2026-11-11-fdroid-at-droidcon-uganda/rollup-banner.jpg %})<br/>
*F-Droid Rollup banner*

![]({% asset posts/2026-11-11-fdroid-at-droidcon-uganda/some-merch-for-the-booth.jpg %})<br/>
*Some Merch for the booth*

![]({% asset posts/2026-11-11-fdroid-at-droidcon-uganda/stickers-and-some-more-stuff.jpg %})<br/>
*Tokens of appreciations after learning about F-Droid :)*

There was a lot of interest in F-Droid at the event. The attendees, mostly
students, came and asked what F-Droid is. The conversation was focused
entirely on showing them how F-Droid is a toolkit
that is used for the distribution of Android apps and how it fits in the larger
Android open-source ecosystem.

With only two booths at the event, attendees flowed to ours and we had about 100
visitors. I had to recruit some of the Droidcon volunteers to help with running
the booth.

## Free and open source apps galore

The high quality of free and open source applications available on f-droid.org
was the main selling point. Visitors to the booth could not believe that there
was a place from where privacy preserving apps that do not serve any ads could be
downloaded from. Notable YouTube clients like [NewPipe](https://f-droid.org/en/packages/org.schabi.newpipe/)
and [Noutube](https://f-droid.org/en/packages/jp.nonbili.noutube/) were put to the
test and gained a few more users.

## Who ensures the apps are malware free?

This is where the work that [Licaon_Kter](https://gitlab.com/licaon-kter),[Linsui](https://gitlab.com/linsui)
and [ducknii](https://gitlab.com/seekme-seekyou) and other F-Droid data team
members was highlighted. I explained the [app submission policy](https://f-droid.org/en/docs/Submitting_to_F-Droid_Quick_Start_Guide/)
and emphasized the [inclusion policy](https://f-droid.org/en/docs/Inclusion_Policy/).

Given that we use a hybrid approach of human contributors and automated checks,
this has ensured that our users are able to get
secure apps for their devices in a manner that fosters collaboration between
app submitters and F-Droid contributors. Potential security and policy
violations are caught early and addressed collaboratively.

## You can create your own F-Droid Repository

Yes, everyone can create their own repository.
I did a deep dive on how users could create their own repositories
using the tools provided by fdroid.

The first approach was through showcasing
[fdroidserver](https://f-droid.org/docs/Installing_the_Server_and_Repo_Tools/)
and how it could be used to create the custom repositories. From
creating the repo, uploading the apk, pushing it to the cloud provider,
and scanning the QR code using the F-Droid client.
This was a bit difficult for people new to the project to follow
because of all the required pre-requisite knowledge, high level concepts presented
and command line use.However, fans of the Linux terminal and more technical users
loved it.

The second approach was [Repomaker](https://f-droid.org/en/repomaker/).
The [Repomaker Demo instance](https://repomakerdemo.fdroid.net/) was used. I took
participants through creating a repo, adding an app to it and publishing the repo.
It was better received by the less technical users because of the user interface
. Some declared that they might distribute their own apps using the Repomaker
demo instance!

## F-Droid is under threat...

Some of the participants visited the [website](https://f-droid.org/en/) and
saw the banner 
> F-Droid is under threat. Google is changing the way you install apps on your
device. We need your help. https://keepandroidopen.org/ 

There was some awareness on Google changing the way apps were being installed
on Android. It was easy to explain to them why the changes made by Google
to limit Android's capacity to run side-loaded apps was detrimental to F-Droid's
existence. We agreed that it was a bit too early
to come to a concrete conclusion because various conversations about how
the Google change affects third party app stores is still ongoing.

## F-Droid is cool. How can I contribute?

I hope to see the [F-Droid Gitlab](https://gitlab.com/fdroid) receive a slew of
new contributors in the near future. There are various components to the project
and we would appreciate a bit of help.

Participants were pointed to various sub-projects such as the
[website](https://gitlab.com/fdroid/fdroid-website), [client](https://gitlab.com/fdroid/fdroidclient),
[repomaker](https://gitlab.com/fdroid/repomaker), documentation and [translations](https://f-droid.org/en/docs/Translation_and_Localization/).
We urged them to contribute to help the project become more robust and fill
in where there are shortcomings.

A number of participants offered to help test the client. This was after
we discovered that there are devices that do not allow F-Droid to
be installed on them.

We even encouraged them to go and show their friends at their universities
F-Droid and its capabilities.That also counts as contributing to F-Droid!

# Conclusion

![]({% asset posts/2026-11-11-fdroid-at-droidcon-uganda/happy-folks-who-learnt-about-fdoid.jpg %})<br/>
*Some of the people who can talk about F-droid confidently*

We gave out all of the t-shirts and stickers that we had. The Droidcon Uganda community
has shown F-Droid support beyond measure.

Droidcon Uganda 2026 was great. Though it did not have a lot of participants
as the previous year, we still got the chance to talk about F-Droid at a major
Android event. I sincerely thank the organizers for their invitation, the
participants for giving us their time and the F-Droid project
for entrusting us with the opportunity to represent F-Droid.

Hopefully, some of the conversations started at Droidcon Uganda will translate
into new F-Droid users, contributors and independent application repositories.
