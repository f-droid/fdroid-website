---
title: Verified first-time installs
author: eighthave
layout: post
---

When F-Droid is installed, it provides a strong, trusted channel to the apps you want to install.  Ideally, F-Droid comes pre-installed on your device, like with [CalyxOS](https://calyxos.org/), [LineageOS-for-microG](https://lineage.microg.org/) or [DivestOS](https://divestos.org/). Then there is already a verified version of F-Droid in place, ready to serve you.

We work to make the f-droid.org web site as [hardened as possible](https://f-droid.org/docs/Security_Model/#initial-installs) to provide a trustworthy channel for first time installers to download the _F-Droid.apk_.  For example, we recently rolled out Domain Name System Security Extensions (DNSSEC) and DNS Certification Authority Authorization (CAA) protections for the f-droid.org domain name.

If a user already knows about the _f-droid.org_ domain, or a trusted source tells them that _f-droid.org_ is the right domain, then they will get the right _F-Droid.apk_ directly from this website.  Unfortunately, on the web, there are lots of ways to trick users into believing they are visiting the right website.  This is usually known as "phishing".  For example, https://f-droid.org/de/ is the German version of this site, but https://f-droid.org.de/ is a site controlled by someone else who owns the _org.de_ domain.  Or some unknown owner has controlled [_f-droid.cn_](https://who.is/whois/f-droid.cn) since 2015.  We have not seen any activity on that domain, but it could still be used to lead users astray. We regularly buy domains that might be confusing to users to avoid them being misused.  But that alone is unfortunately not enough (_note: we'd love to buy that domain, let us know if you can help us find the owner_).

This problem led us to look for other "[roots of trust](https://en.wikipedia.org/wiki/Root_of_trust)".  When a user already knows and trusts a channel, they can use to fetch and verify the _F-Droid.apk_.  For GNU/Linux distros like Debian, there is a strong trust anchor provided by the built-in package manager.  For other operating systems, there are add-in package managers, like Homebrew for macOS.  So we made the new `fdroid install` command to take advantage of these trust anchors.  If you already trust your package manager, and it ships _fdroidserver_ v2.3.0 or newer (e.g. `apt-get install fdroidserver`), then you can just install that, run `fdroid install`, and get a cryptographically verified _F-Droid.apk_ to install on your device.

On top of that, `fdroid install` will automatically try to download from a number of built-in mirrors.  So installing using `fdroid install` could be more reliable than trying to download _F-Droid.apk_ from this website.  For extra privacy, use `fdroid install --privacy-mode` and it will avoid downloading from <https://f-droid.org> and instead download from mirrors that host lots of different kinds of software.  Any network observers will not be able to see which specific software you are downloading from the mirror. The visible parts of your download traffic will not show that you are downloading something related to F-Droid.  It is important to note that the operator of that mirror will be able to see that you are downloading _F-Droid.apk_.

As of this writing, here are some sources of the required version of _fdroidserver_:

* Debian/trixie and Ubuntu/plucky: `apt-get install fdroidserver`
* Debian/bookworm-backports: `apt-get install fdroidserver/bookworm-backports`
* Homebrew: `brew install fdroidserver`
* Python pip: `pip install fdroidserver`
* [Our Ubuntu PPA](https://f-droid.org/docs/Installing_the_Server_and_Repo_Tools/#getting-a-newer-version)
