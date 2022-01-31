---
layout: post
title: "Trust, Privacy, and Free Software"
author: "eighthave"

---

We all put a lot of trust into our devices, more and more of our lives are run out of our phones and laptops.  The communications we send to each other contain the most sensitive bits that we convey with our devices.  The experience we all have when using these devices feels private: if no one is looking at our screen, it seems that no one else could be watching.  Sadly, the reality is quite the opposite.  Our mobile devices are full of trackers and spyware, whether we notice them or not.  There are ever increasing pressures for inserting backdoors.  And most people still rely on proprietary software for their most sensitive things.

Over the last ten years, there have been huge strides in the development of usable techniques for strongly protecting privacy.  End-to-end encryption used to require deep technical skills to use (think PGP email), now over a billion people are using it daily.  Open platforms and free software give us control over what happens on our computing devices, as well as the ability to check what exactly software does with our private information.  [Reproducible builds](https://reproducible-builds.org) seemed like waste of time some years ago, now it is an essential building block for trustworthy systems.  The F-Droid community has put all those pieces together to create a complete distribution system where the source code is the only piece that needs to be trusted.

To make this a bit clearer, we can use the analogy of buying prepared food.  The ingredients must be listed on the box.  We trust that the ingredients list matches what is actually in the box.  Open source software is very similar to this.  The source code is a very elaborate recipe that produces the executable binary that the computer chips actually run.  Now imagine there is a robot kitchen than perfectly executes recipes, producing the exact same result every time, and a simple chemistry set that tell if two bites are exactly the same.  Anyone who reads the recipe will know what is in the food.  The robot kitchen can be inspected to ensure it strictly follows the recipe.  The resulting food can be tested over time to make sure that the robot kitchen is actually making the same exact food each time.  Then the combination of the recipe and robot kitchen can be trusted to only use what is listed on the ingredient list.  And anyone can use the chemistry kit to check that what is in their box matches what is in anyone else's box.

This is what F-Droid can now do, only for software instead of food.  It does it in a way that the chemistry kit is run every time to you install an app, and it is compared to what the F-Droid build machine saw when it created the binary app.  So in fact, it is much easier to verify than the above example.


## Digging into the details

Free Software, Vetted Protocols, Code Audits, Reproducible Builds, and the Right Hardware: these are the required ingredients for a truly trustworthy system.

The complete picture for trustworthy computing is now within reach. Free Software has long been a requirement for trusted software.  There are trusted methods of end-to-end encryption, from [Briar Protocol](https://code.briarproject.org/briar/briar/wikis/A-Quick-Overview-of-the-Protocol-Stack) to [Signal Protocol](https://en.wikipedia.org/wiki/Signal_Protocol).  Reproducible builds means that binaries can be definitively linked to the source code.  Real off switches gives the user full control over when features are enabled.  Free hardware designs let us inspect the recipes used to build our devices.

The F-Droid ecosystem now provides the pieces necessary for trusted, verifiable software:
* Free Software
* Reproducible builds
* Open, audited cryptography
    
All of the above pieces have been applied and proven in multiple apps, some already include multiple techniques.  In order for an app to provide trustworthy privacy, all must be applied.

* 100% Free Software: Briar, Bitcoin Wallet, [Die Tageszeitung (TAZ)]({{  site.baseurl }}/packages/de.thecode.android.tazreader), Tutanota
* Open, audited crypto entirely in the client software: Briar, Bitcoin Wallet, Tutanota
* Reproducible builds: Briar, Bitcoin Wallet, F-Droid, [F-Droid Privileged Extension](https://verification.f-droid.org/org.fdroid.fdroid.privileged_2080.apk.json), [Nextcloud](https://verification.f-droid.org/com.nextcloud.client_10040299.apk.json), Öffi, and [more](https://verification.f-droid.org/verified.html).
* Code signing and distribution based on reproducing the developer's build: Briar, Bitcoin Wallet

Tor Browser for Android will
[soon be released](https://trac.torproject.org/projects/tor/ticket/27539)
using the F-Droid
[reproducible process]({{ site.baseurl }}/docs/Reproducible_Builds).
That means the app is submitted to F-Droid by sending only the source
code and the developer's own signature from their APKs.  That means
that F-Droid will only publish APKs that are built from source on the
_f-droid.org_ infrastructure, yet match the signature produced for the
APK that was built by the developer on their infrastructure.

Other projects like Signal agree that [reproducible builds are important](https://signal.org/blog/reproducible-android/), but the Signal APKs are not reproducible.  Only the Java part is reproducible.  That means the C/C++ code is not reproducible, and that's the place where it is easiest and most effective to insert exploits.

There are also other concerns that affect a much broader swath of Android apps: the tools and plugins used to build the apps, as well as third party libraries, which these days basically every app includes.  _gradle_ is the official build system, and many project use _gradle_ plugins as part of their build process.  _gradle_ is free software, but many of the plugins are not.  

F-Droid has been working with the Debian [Android Tools](https://wiki.debian.org/AndroidTools) and [Java](https://wiki.debian.org/Teams/JavaPackaging) teams to get as many of the essential build tools packaged and [building reproducibly](https://tests.reproducible-builds.org/debian/unstable/amd64/pkg_set_maint_pkg-android-tools-devel.html) as part of Debian.  F-Droid Privileged Extension takes reproducible builds this extra step further: it is built by the Debian Android Tools packages with no outside dependencies.

The last big piece are the third party libraries that _gradle_ makes
it so easy to include.  The _JCenter_ and _Maven Central_ library
repositories require that a matching source JAR is uploaded for each
release, but nothing verifies that the source JAR matches the binary
JAR in any way.  Then Android AARs libraries are quite common, and
there is no such requirement for matching source code.

## Consider hardware

The right hardware platform is also essential.

The possibility of inserting backdoors into hardware means we need all the same things for hardware as well as software: free and open sources, reproducibility, public audits, and trusted designs.  Unfortunately, hardware is much further behind than software in these regards.  But there is lots of very promising work:

* [a mobile device that requires no proprietary software at all](https://puri.sm/posts/librem5-solving-the-first-fsf-ryf-hurdle/)
* [open source chip fabrication](https://libresilicon.com/)
* [free CPU designs in free hardware](https://riscv.org/2018/05/microsemi-and-sifive-launch-hifive-unleashed-expansion-board-enabling-linux-software-and-firmware-developers-to-build-risc-v-pcs-for-the-first-time/)
* [free laptop designs](https://spectrum.ieee.org/consumer-electronics/portable-devices/novena-a-laptop-with-no-secrets)


## Stepping stones you can reach right now

[Fairphone Open](https://code.fairphone.com/projects/fp-osos/user/fairphone-open-source-os-installation-instructions.html) provides free software Android with built-in F-Droid that is fully supported by the hardware manufacturer.  Hardware security can be achieved with baseband-free tablets and hacked Moto Gs.  Purism [Librem 5](https://puri.sm/products/librem-5/) with an isolated and hardware-switched GSM baseband is coming soon.

The tools are in place in F-Droid for any app developer to provide fully trusted binaries to their users.  [Briar](https://blog.grobox.de/2018/building-briar-reproducible-and-why-it-matters/),
and Bitcoin Wallet were the first to meet all criteria, now that they are reproducibly built in F-Droid.  [Tutanota](https://f-droid.org/2018/09/03/replacing-gcm-in-tutanota.html),
Conversations, Die Tageszeitung (TAZ), Nextcloud, Riot, Kontalk, and many others are 100% free software and built from source by F-Droid.  Others like Firefox, Wire, and Zom are close, and hopefully the more complete examples will inspire them to move in the right direction.  And F-Droid is glue that holds these pieces together.  The F-Droid community is ready to help all projects move on to the next step in trustworthy computing.
