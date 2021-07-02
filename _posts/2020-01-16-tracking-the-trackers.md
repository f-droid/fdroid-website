---
layout: post
title: "Tracking the Trackers: using machine learning to aid ethical decisions"
author: "eighthave"
---

F-Droid is a free software community app store that has been working since 2010 to make all forms of tracking and advertising visible to users. It has become the trusted name for privacy in Android, and app developers who sell based on privacy make the extra effort to get their apps included in the F-Droid.org collection. These include [Nextcloud](https://f-droid.org/packages/com.nextcloud.client/), Tor Browser, [TAZ.de](https://f-droid.org/packages/de.thecode.android.tazreader/), and [Tutanota](https://f-droid.org/packages/de.tutao.tutanota/).  Auditing apps for tracking is labor intensive and error prone, yet ever more in demand. F-Droid already has tools to aide contributors in this process, visible in the [app submission](https://gitlab.com/fdroid/fdroiddata/merge_requests) and [Request For Packaging (RFP)](https://gitlab.com/fdroid/rfp/issues) issue trackers.  We also have functional prototypes of using machine learning to drastically speed up this process by augmenting humans, rather than replacing them. 

Since the prime motivation of the F-Droid community is ethical software distribution, algorithms will never replace humans in making ethical decisions. We have also explored using machine learning to detect tracking in a more generic way, without manually compiled lists of tracking libraries. With this funding, we will improve the F-Droid tools, and make them generally available for any use case needing to reliably detect trackers in Android apps. This builds upon our [collaboration](https://f-droid.org/en/2017/12/14/new-collaborations-on-exposing-tracking.html) with [Exodus Privacy](https://exodus-privacy.eu.org/) and [LibScout](https://github.com/reddr/LibScout).

This project comes out of some proof of concept work that [Aaron Kaplan](https://www.lo-res.org/~aaron/) and [Hans-Christoph Steiner](https://gitlab.com/eighthave) did, working with students in the Vienna Economics University's (WU) [Data Science Lab](https://www.wu.ac.at/en/infobiz/teaching/sbwl-data-science).  We focused on using machine learning with Android apps, first to detect malware, then second to detect tracking libraries.  It is of course ultimately an outgrowth of the F-Droid community's efforts, and Guardian Project's funded efforts for building systems without any tracking at all.  And special thanks to F-Droid founder [Ciaran Gultnieks](https://en.wikipedia.org/wiki/Ciaran_Gultnieks) for setting the ethical tone that inspired us all, back in [2010](https://f-droid.org/2010/09/30/no-free-beer.html).


## Funding

This current 44,500€ project is funded by NLnet's [Privacy & Trust Enhancing Technologies (PET) Fund](https://nlnet.nl/PET/).  F-Droid has received large, dedicated, computing resources from the [GCC Compile Farm](https://cfarm.tetaneutral.net/machines/list/), as well as some shared resources from Aaron Kaplan.  The budget will be used entirely to pay for people's time for the research, development, and integration work:

* Software development to get the existing LibScout and Exodus Privacy tools to be fully integrated into the F-Droid stack.
* Machine learning research and development.
* Community management, to coordinate with F-Droid contributors, app developers, tool developers, academic researchers, etc. as well to promote these tools
* Finalize and package up all the useful parts of this project, which also means getting them included in Debian


## Related Efforts

* The general approach that we are taking here has been proven in the context of web pages. The Brave Browser includes [machine learning techniques](https://arxiv.org/pdf/1805.09155) for blocking ads and trackers in web pages.  It is a very similar idea to what we propose, but that example is embedded into a browser and only applies to web sites.

* Exodus Privacy has manually compiled an extensive list of tracking libraries and domains for receiving user data.  It then uses this to scan app from Google Play.  Those results are then reported on their website.  Exodus Privacy would directly benefit from this work, since they could use the tools we will create.

* [Ghostery](https://www.wired.com/story/ghostery-deploys-ai-in-fight-against-ad-trackers/) uses AI techniques to dynamically block ads in web pages.

* F-Droid has its own `fdroid scanner` for doing checks based on manually prepared regular expressions.  This was combined with Exodus Privacy into F-Droid's [issuebot](https://gitlab.com/fdroid/rfp/issues) which automatically scans apps that users request to be added to F-Droid.

* LibScout uses machine learning to detect which versions of which libraries are included in an Android app (APK).  Using the list of libraries from Exodus Privacy, we worked with the LibScout author to create a functional prototype of a tracking library detector.

* [Drebin](https://www.sec.cs.tu-bs.de/pubs/2014-ndss.pdf) clearly demonstrated that machine learning can be used to automatically classify Android apps based on certain aspects of their behavior. Their aim was to find malware.  Working with CERT.at and the WU Data Science Lab, we reproduced the results of the Drebin paper.


## The challenges

The biggest promise of this project is also the biggest technical challenge: finding a way to take data sets about what includes tracking libraries (e.g. F-Droid manual review, LibScout, Exodus Privacy), and turning that into a more general machine learning approach.  We will have to explore a wide range of possible features to include in the machine learning that are distinct from the tracking libraries themselves.  This general approach will provide tracking detection with more automation and less maintenance work of rerunning the machine learning on updated data sets as new tracking libraries are put into use.

The technical methods for determining whether an app includes trackers are well known and described.  They currently require knowledge of Android development.  Machine learning has been proven to be able to reliably spot trackers in apps, this project will turn working prototypes into production software, integrate it into F-Droid community-driven processes, and make these new tools easily available for anyone else to apply to their specific use cases. The suite of tools will scan both source code and binaries.  Scanning binary APK files is important even when the source code is available since F-Droid users mostly consume APKs.  Then F-Droid can ensure that proprietary things are not included, whether by mistake or via hidden tricks in build systems.

Given an Android apps downloaded from anywhere, these new tools will be able to mark which ones have any kind of tracking in them, with a very high degree of certainty.  With the portion of the project that involves applying LibScout, at this point, the idea has been proven with prototypes.  Applying it is a straightforward matter of bringing a proven prototype to production.

Organizations relying on apps that must follow strict data protection requirements, like banks under the [EU GDPR](https://gdpr.eu/), can use these tools to ensure that apps they rely on do not contain illegal tracking, and to ensure that such tracking is not added in future releases.

These techniques are also applicable to other platforms, like Progressive Web Apps and Apple iOS.  Bootstrapping another platform would require a marked training set of apps to feed to the machine learning.  F-Droid already provides this set, and Android is the most popular OS in the world, making Android the ideal platform to start this work.


## Humans at the core

F-Droid is a community run free software project very much in the same spirit as Debian.  The community has always aimed to provide 100% verified free software, built from source.  From the beginning, there was also an interest in other ethical considerations as well, these are expressed via F-Droid's [Anti-Features](https://f-droid.org/docs/Anti-Features/).  These are things tagged with _Tracking_ (contains tracking), _Ads_ (includes advertising), and _NonFreeNet_ (requires a non-free network service).  The process of ensuring that the apps are 100% free software as well as tagging apps with the required Anti-Features is a manual process that many people contribute to, that is aided by quite a bit of automation.  This project fits directly into this existing ecosystem.  It will both quickly provide improvements in contributors' workflow based on the existing prototype, as well as experiments towards drastically improving the whole workflow of anyone working to track trackers.

F-Droid fits into the whole Android app ecosystem in a very specific role.   It is the one source that only distributes free software, and has built a well deserved reputation for not compromising on the ethics that guide the community.  This has led it to become the standard "clean set" in all manner of research into Android malware and tracking.  Many academic papers covering Android malware cite f-droid.org as the source of ground truth.

In closing, it is important to highlight that it is essential to keep humans always at the center of of these tools.  We are building tooling to augment humans, not replace them. Since the prime motivation of the F-Droid community is to build ethical software distribution, algorithms will never replace humans in making decisions based on ethics.  The tools can automate the technical details, so that contributors do not need to understand them in order to meaningfully help with the process.
