---
layout: post
title: F-Droid Meeting at the RC3 Congress
author: "ByteHamster"
authorWebsite: "https://github.com/ByteHamster"
---

The [congress of the Chaos Computer Club](https://en.wikipedia.org/wiki/Chaos_Communication_Congress) usually takes place in person but the pandemic forced it to become a virtual event called RC3. It is visited by many open-source enthusiasts, so it is no wonder that there are people who love F-Droid and FOSS Android apps in general. In 2019, we [already had an F-Droid meeting](https://f-droid.org/2020/01/09/f-droid-at-36c3.html) at the congress. This year, we scheduled a virtual meeting for Dec 30 2021 and [announced it on the F-Droid forum](https://forum.f-droid.org/t/f-droid-meetup-at-the-rc3-congress-2021/16337), as well as on Mastodon and Twitter.

About 10 people -- mostly maintainers of various open-source apps -- joined and talked for nearly 3 hours. There were obviously developers from F-Droid itself ([client app](https://f-droid.org/packages/org.fdroid.fdroid/), [packages](https://gitlab.com/fdroid/fdroiddata) and [server](https://gitlab.com/fdroid/fdroidserver)) but also from apps like [K-9 Mail](https://f-droid.org/packages/com.fsck.k9/), [AntennaPod](https://f-droid.org/packages/de.danoeh.antennapod/), [Etar](https://f-droid.org/packages/ws.xsoh.etar/), [Event Fahrplan](https://f-droid.org/packages/info.metadude.android.rc3.schedule/) and [Tiny Weather Forecast](https://f-droid.org/packages/de.kaffeemitkoffein.tinyweatherforecastgermany/).

Among other smaller topics, we talked about the following:

- Most open-source apps are developed by volunteers in their free time. In order to spend time on open-source app development as an actual part-time job, developers need a source of income. Only a tiny fraction of developers can actually live off the donations they receive. We discussed everyone's experiences with receiving donations. An important aspect is that recurring (small) donations are a lot more helpful than infrequent (large) donations because it makes it easier to plan. We talked about how it would be possible to ask users for donations without getting annoying. F-Droid already stores donation links in the app metadata and displays them on the client's app details page. The problem with this is that after downloading, the app details page is no longer actively used. We agreed that it would be great to ask for donations on the "updates" tab of the F-Droid client: when an app has been installed for a long time, the client could ask if you want to donate to keep the app development sustainable. The "updates" tab has already been prepared for this kind of messages, but it still needs a developer to implement the last pieces.
- Many F-Droid users run rather old Android devices. A possible reason is that they care about the environment and do not want to throw away working devices. In order to still support old Android versions, app developers have to invest a significant amount of work. One example is that [supporting HTTPS connections on old Android versions is hard](https://f-droid.org/2020/05/29/android-updates-and-tls-connections.html). HTTPS connections not only affect Browser applications, but also apps like weather forecast apps or podcast players. While it would be possible that each app shipped the necessary code to connect to modern HTTPS servers, that would increase the size of each app by about 4 MB. There have already been ideas on how to only have one app ship the HTTPS code and have it loaded from there into other apps. The main missing point was which app would be trustworthy enough to ship such security critical code. We discussed that including it in the F-Droid client is not a good idea because the app is already rather complex. Given that both devices running Google Services and devices running [microG](https://microg.org/) already have a provider for that code, we decided that we should just write an open-source library that talks to that system component. Therefore, the library would basically be an open-source re-implementation of Google's ProviderInstaller, calling the [same system APIs](https://github.com/microg/GmsCore/blob/cb3592688b098e5a1870006797be665e3b083f3e/play-services-conscrypt-provider-core/src/main/java/com/google/android/gms/common/security/ProviderInstallerImpl.java#L72).
- Seldom, there are takedown requests for apps on F-Droid, for example because of copyright claims. Often it is then hard to contact the app authors. Some apps use git repositories without an issue tracker and the contact email address is not actively requested when adding a new app to the F-Droid repo. We discussed having a custom field in the apps' metadata that could store a contact email address.
- Some apps make strong use of different build flavors. Build flavors are different versions of the same app, sharing most of the source code. F-Droid supports specifying the build flavor to use when publishing an app, but it has trouble with the metadata like screenshots and app description. We discussed ways how to deal with that problem.
- An issue that frequently affects app developers is that updating apps on F-Droid takes pretty much time. The build server first has to compile the apps' source code. Then, the apps are manually signed on a computer that is not connected to the internet. A method that app developers can use to deal with that is to use reproducible builds. With reproducible builds, F-Droid distributes the apps with the original developer's signature. That way, users can switch between F-Droid's version of an app and the developer's version of an app without having to re-install. App developers can then publish critical updates on their website, from inside the app or in their own F-Droid repository and users can still update the app directly -- even if they originally installed it from F-Droid.

We hope that we can meet in person again next year.