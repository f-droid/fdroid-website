---
layout: post
title: "5 years of UnifiedPush"
author: "S1m"
authorWebsite: https://s1m.fr
---

> _Back in 2020, ["OpenPush - A Free, Decentralized Push Messaging Framework for Android"](https://f-droid.org/2020/02/03/openpush-talk.html) has been announced on F-Droid at its beginning, and in 2022 the UnifiedPush team posted on F-Droid their guide entitled ["UnifiedPush: a decentralized, open-source push notification protocol"](https://f-droid.org/2022/12/18/unifiedpush.html) that inspired a lot of developers. But did you know how UP came to be? Now you can. This is a repost from the author blog._

**It has already been 5 years since UnifiedPush started!** It also means I don't have any Play Services, the official or microG reimplementation, for 5 years now. It is a good moment to do a recap, and think about what can be UnifiedPush in 5 years.

It turns out I don't remember in details how all started, I need to read some historical pull requests and chats.

# Why do I need push notifications?

I think I've installed my first alternative ROM, [LineageOS](https://lineageos.org/), around 2013, and never went back to stock ROMs since then. At this time, I didn't really care about the apps I was installing, it was mainly to take control of my devices and get rid of the bloatwares.

I understood that I needed the Play Services, or a reimplementation, for some applications to properly work, and I was vaguely knowing why. So, every time I updated my phone, I had to boot into the custom recovery (TWRP), to flash a zip, to get microG. It was, well .. not the best user experience.

Then, I tried to stay without the Play Services, it was even worse, messages weren't reliable, the battery drained and there were many *foreground notifications*, which I understood were required to keep a service running.

So I decided to go with a fork of LineageOS that includes microG by default, and distributed by microG team: [LineageOS for microG](https://lineage.microG.org/).

Even after using this new system, the experience was nearly the same. Why? Because most of my apps were from F-Droid. Push notifications with Google (via microG) require the use of a proprietary library \*, which comes with telemetry, unless explicitly configured to exclude them. F-Droid deny this library, which is fair given that their purpose is to promote free software.

\* That's actually possible to use FCM (Google notifs) without Google lib, but I didn't know that at this moment. Cf. UnifiedPush blog post about [push notifications for decentralized applications](https://unifiedpush.org/news/20250131_push_for_decentralized/), or Molly [issue regarding FOSS FCM implementation](https://github.com/mollyim/mollyim-android/issues/637).

# Gotify (2020)

So, we're in 2020, and I finally want to look why I can't use microG with Fedilab and Element from F-Droid, and if we can replace microG with another notification app.

It turns out among others notification applications, F-Droid distributes [Gotify](https://gotify.net/). It isn't able to *forward notifications to other apps*, but there is [an issue opened for that feature](https://github.com/gotify/android/issues/29), and **jmattheis**, the developer seems open to the idea.

I didn't touch any Android dev at this moment, but I tried to hack something. Fortunately, **jmattheis** review helped a lot to make things less hacky. So here came *gotify-connector*.

It looks like from the pull request history that "connector" comes from **jmattheis**, for which I added "distributor" later.

At this moment, the feature has picked the interest of some persons, including **sorunome**, **karmanyaahm** and **sparchatus**. **Sorunome**, contributor to FluffyChat, told me that the feature may interest people in [OpenPush](https://bubu1.eu/openpush/) Matrix room.

# First UnifiedPush version (2020)

Late 2020, looking at some p2p projects, I thought it would be cool having a p2p based solution too. So came the questions about ecosystem lock-in of a Gotify only solution, adoption, and fragmentation. If we have multiple applications able to provide push notifications, we should have a library that is compatible with all of them. When a new application providing push notifications is published, then all existing applications supporting the *thing* would be directly compatible. Going that way, we needed to specify how it should work first.

I shared the idea in OpenPush room, and it picked the interest of someone in particular, **sparchatus**, who helped me to write the specifications. We discussed many edge cases to see how things could be.

I published a first version of the specifications, a library, and a fork of Gotify until the support was merged \*.

**Sorunome** was interested in implementing the support in Fluffychat. It required a flutter lib, **karmanyaahm** wrote a lib porting the already published library to the framework. We also needed something to translate Matrix push protocol, and make Gotify server compatible: **karmanyaahm** wrote common-proxies for this. 

\* Which actually never happened 🤷

# FluffyChat, Fedilab, and more (2021)

Early 2021, [FluffyChat](https://fluffy.chat/en/) was supporting UnifiedPush. And soon came [Fedilab](https://fedilab.app/) too, as the dev, **Thomas**, was directly interested.

Starting with these 2 applications was a chance for the project: we had support for Matrix, and many other chats using Matrix bridges, and for the Fediverse. This covered enough applications for some FOSS enthusiasts. Retrospectively, UnifiedPush may never have started without these 2 applications.

After that, some applications started to implement the feature, such as a [Tox application](https://github.com/zoff99/tox_push_msg_app), or [FMD](https://fmd-foss.org/), a FOSS solution to find your device.

Mid 2021, I implemented UnifiedPush support for [Element](https://github.com/element-hq/element-android/), which was soon merged by [SchildiChat](https://github.com/SchildiChat/SchildiChat-android/), a fork. I think the experience from SchildiChat helped for it being merged into Element mid 2022.

# UnifiedPush for Linux (mid 2021)

At this moment, vurpo came to UnifiedPush Matrix room to talk about push notifications for Linux devices. So we had UnifiedPush for Linux by mirroring the specifications for Android to D-Bus IPC.

# ntfy, NextPush (2021)

During 2021, a new project appeared on the Internet: [ntfy](https://ntfy.sh/). A project like Gotify, that can work without any account, with a public server. The app is extremely easy to use, as you have nothing to set up. And the developer, **binwiederhier**, was directly interested in supporting UnifiedPush, to make ntfy a *distributor*.

Merged early 2022, it was an important step for UnifiedPush: we have a distributor to recommend by default.

I have also implemented [NextPush](https://codeberg.org/NextPush/nextpush-android) at the same period, giving an easy opportunity to self-host a push server, if you already host a Nextcloud server

In the same time, Gotify developer informed us that they finally prefer not to merge the support, as they don't use it and prefer to avoid adding maintenance to their project, which is perfectly understandable. With this new position, the official support of UnifiedPush by ntfy, and the new NextPush app, I preferred to discontinued Gotify forks as well.

# KUnifiedPush (mid 2022)

Mid 2022, the [KDE](https://kde.org/) team, and particularly **vkrause**, published [KUnifiedPush](https://invent.kde.org/libraries/kunifiedpush): a distributor for Linux, compatible with different push server, like ntfy or NextPush. Until then, we only had POC implementations of distributors for Linux. KUnifiedPush also provide libraries for KDE applications.

This allowed Linux applications to finally support the protocol.

# Full-time on UnifiedPush (2024 - 2025)

At the end of 2023, we have more than 20 applications supporting UnifiedPush, and another distributor: [Conversations](https://codeberg.org/iNPUTmice/Conversations). Element being probably the one with the larger user base at this moment. Someone advised me to apply for a grant with [NLnet](https://nlnet.nl/), as it would boost development of the project.

During the application process with NLnet, [COVESA](https://covesa.global/) reached me because they wanted to support the project, but needed a few features that weren't present, to get a more robust authorization mechanism and avoid registration spamming.

UnifiedPush has always been compatible with web push (RFC8030 and RFC8291 but RFC8292, aka VAPID, wasn't). Embracing the standard to require web push was a potential step to take. The specifications needed to be updated in that direction, to require encryption (RFC8291) and to handle authorizations with VAPID (RFC8292). Relying on standard will hopefully help for the adoption, as the server side implementation may be used for web applications in the same time.

At the end of 2024, I've started working full-time on UnifiedPush.

Working with COVESA also allowed to get [Sunup](https://codeberg.org/Sunup/android), a distributor using Mozilla's push server, [autopush](https://github.com/mozilla-services/autopush-rs), and to add a self-hostable backend for autopush. This feature is currently being merged.

NLnet gave the opportunity to polish many things that were pending, to add a migration feature to the protocol, which can be used to get a fallback service when your self-hosted server is down, to implement the actual web push specifications on Mastodon, and to add web push/UnifiedPush to some applications. It includes Fennec/IronFox, forks of Firefox, so we can now get push notifications with web applications. It also includes SimpleX (being merged), Nextcloud (being merged), DeltaChat (TODO), and flatline (TODO), a self-hostable version of Signal server, hopefully upstreamed to Signal servers.

The idea is to increase the network effect: the more applications support UnifiedPush, the more UnifiedPush can be relevant for users, and the more users will use UnifiedPush. If the number of UnifiedPush users increases, it pushes applications' developers to support the protocol. At the end, we can use our phone with the push service we want, to get an expected user experience even without the Play Services.

# Retrospective

It was by chance that I started UnifiedPush and the project would never have existed without other projects like F-Droid, Gotify, Matrix, Fluffychat or Fedilab, and many more, without the help of many people.

I think it shows how the FOSS ecosystem can be beneficial for everyone. I develop Sunup, but often contribute to ntfy. The projects could be seen as "concurrent", but aren't: the applications answer different needs. We don't have anything to win or lose if a user chose one app over the other. But we all win if a user chose to use one, no matter which, as it increases the network effect.

If UnifiedPush wasn't started 5 years ago, I'm sure an equivalent project would have started since then. This is something that was awaited in the mobile FOSS community, and there were already some research work on the subject.

I wasn't aware how many things were implied with push notifications. It is understandable that giving a single entity the capacity to provide such an important feature give them incredible power. This is concerning when their solution doesn't follow least-privilege policies, come with system rights, has access to the full system, and with "features" we don't want, such as advertisement and telemetry.

I now understand why push servers may be a tool for mass surveillance and how an open solution is important for resilience. Some networks exist outside the Internet, some regions in the world suffer from services block, some users may be banned from these services. When a service is controlled by a single entity, nothing can be done when they consider your device too old to be supported. Offering an open alternative is a response to all these problems.

The idea is not to move everyone to an open solution, but to give the freedom to. Supporting these alternatives also reduces risks of power abuse from Google. If you develop an application, ask yourself how fast could you recover from being banned by Google?

Working full-time on UnifiedPush is incredible. I'm extremely happy a foundation like NLnet exists. I hope my work is beneficial for the project and for most of the users. When it all started, I didn't imagine a second I could work on this, I just wanted my Matrix and Mastodon notifications without the Play Services.

I would love to continue working daily on UnifiedPush, and there are probably tons of things to do, specially for Linux devices, and many apps to port the feature to. But NLnet funds aren’t unlimited, our main goals are reached - improving the protocol, improving the existing code and documentation, boosting the network effect on Android -, and I don’t want to take the potential place of another project.

Among other things, we still need to improve libraries for UnifiedPush on Linux, and it’d be great to have a UI for KUnifiedPush to publish it on Flatpak. There are some important applications, such as Mozilla sync service, that use an allow-list of authorized push servers, defeating the purpose of self-hosting: it would be great implementing a better anti-SSRF mechanism. We will probably have to build these blocks and others together. If you want to contribute, do not hesitate to PM on [Mastodon](https://fosstodon.org/@unifiedpush) or join [UnifiedPush matrix room](https://matrix.to/#/#unifiedpush:matrix.org).

# UnifiedPush in 5 years

The best thing that could happen to UnifiedPush on Android in 5 years would be for it to no longer exist.

If Android gives us a system API to let the user define their push service we wouldn't need UnifedPush anymore. Passkeys (API to login without passwords), used to be provided by the Play Services only. Today, probably to increase the adoption, Android has migrated to a system API ([Credential Provider](https://developer.android.com/identity/sign-in/credential-provider)), to allow any password manager to provide the service. With a *Push Service API*, UnifiedPush would have kind of been integrated into the OS. The applications would receive push endpoints like we do, and they would send web push requests, following standards, like web applications does, like UnifiedPush does. Migration from UnifiedPush would be minimal.

If we manage to have such a *Push Service API*, we can expect many more apps supporting the feature. And we will finally be able to choose the services we want to trust.

Hopefully, working on UnifiedPush can push in that direction by increasing the demand, and highlighting the need.

On Linux, I think the adoption depends a lot on how the mobile Linux ecosystem evolves. I personally think and wishes that it goes in the right direction. And I think a lot of things can happen in 5 years on the matter.
