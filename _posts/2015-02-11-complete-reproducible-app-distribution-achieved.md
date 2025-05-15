---
title: Complete, reproducible app distribution achieved!
author: eighthave
layout: post
---

F-Droid has been working towards getting a complete app distribution channel that is able to reproducibly build each Android app from source. while this may sound like a mundane detail, it does provide lots of tangible benefits. First, it means that anyone can verify that the app that they are using is 100% built from the source code, with nothing else added. That verifies that the app is indeed 100% free, open source software.

It also verifies that there have not been any malicious bits of code added into the app during the build process. As has been [demonstrated](https://media.ccc.de/v/31c3_-_6240_-_en_-_saal_g_-_201412271400_-_reproducible_builds_-_mike_perry_-_seth_schoen_-_hans_steiner) in the [31c3 Reproducible Builds talk](https://fahrplan.events.ccc.de/congress/2014/Fahrplan/events/6240.html), just flipping a single bit is enough to create a usable exploit in an app.

The F-Droid project is leading the way with its system for publishing verified builds. This builds upon Guardian Project's first full example, making [Lil’ Debi build reproducibly](https://guardianproject.info/2014/06/09/our-first-deterministic-build-lil-debi-0-4-7/). We started with our simple little utility app [Checkey](https://github.com/guardianproject/checkey) since it has few moving parts (first get one working, then the rest).

When you download Checkey [from f-droid.org](https://f-droid.org/repo/info.guardianproject.checkey_101.apk), you will get an APK that was signed using the official [Guardian Project](https://guardianproject.info/releases/Checkey-0.1.1.apk) offline signing key that was built by f-droid.org. No, Guardian Project did not give f-droid.org a copy of our key, instead, the `fdroid publish` process now looks for the `Binaries:` tag in the build recipe. If it sees that, it downloads that APK, then builds the app from source, then checks to make sure that they match using a simple diff of the APK contents and by checking that the signature on the official APK also validates on the APK that f-droid.org built.

Now that we have our little Checkey working, we can work towards getting all of our apps verifying in the same way, eliminating a whole field of exploits that we have to worry about. You can follow the progress of this work on the F-Droid wiki [Reproducible Builds](https://f-droid.org/wiki/page/Deterministic,_Reproducible_Builds) page, and learn about a future application of it on the [Verification Server](https://f-droid.org/wiki/page/Verification_Server) page.

The next two apps that are in the reproducible pipeline are [LEAP](https://leap.se/)‘s [Bitmask](https://gitlab.com/fdroid/fdroiddata/-/blob/601ada1d675969702606768fdaa55e5e441dc727/metadata/se.leap.bitmaskclient.txt) and Guardian Project's [LocationPrivacy](https://gitlab.com/fdroid/fdroiddata/-/blob/601ada1d675969702606768fdaa55e5e441dc727/metadata/info.guardianproject.locationprivacy.txt).
