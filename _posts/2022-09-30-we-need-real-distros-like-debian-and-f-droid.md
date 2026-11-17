---
author: eighthave
layout: post
title: We need real "distros" like Debian and F-Droid
---

The principle of [least authority](TODO) is a powerful concept when building trustworthy systems.  The core idea is that software should have as little access as needed, everything that the app does not need should be restricted, since it can only serve as a vector for abuse.  All software has bugs, this is a realistic approach to limit the damage that can result because of those bugs.  While the principle is simple, applying it in the real world is far from it.  How can software authors determine exactly what is needed, and cleanly restrict everything else?  How can users influence those decisions, or have control over the restrictions?  Many users do things with software that the original authors never thought of, and a user-focused system should always allow the user to do what they want to.  So it is clear that this decision cannot just be left to the app or OS developers.

Secure systems designed for military and business needs deliberately restrict what users can do, since that is a core goal.  They keep secrets and their employees need to work with those secrets.  But they do not want users to have the freedom to do whatever they want with those secrets.  When thinking about a personal device like a phone, then there is a very different picture.  The device should keep the users secrets from others, but not restrict the user from using the device as they want.

There is another version of this story that is becoming sadly all too common.  Companies use [Digital Restrictions Management](TODO) (DRM) to prevent users from doing what they want with their machines.  This is built into Google Play, Apple App Store, Chrome Browser, and even Firefox (though it is opt-in there).

* sandboxing and secure systems are a key tool that companies use to restrict users
* SafetyNet blocks rooted devices.
* this is sold to use as security measures for our protection.
* The data tells a different story: free software distros do not restrict users like this, and yet they have a very good security track record.

* the TPM aims to enforce DRM even on free software operating systems
https://www.eff.org/deeplinks/2020/09/human-rights-and-tpms-lessons-22-years-us-dmca
https://www.schneier.com/blog/archives/2008/05/tpm_to_end_pira.html
https://security.stackexchange.com/questions/187820/do-a-tpms-benefits-outweigh-the-risks
https://security.stackexchange.com/questions/187820/do-a-tpms-benefits-outweigh-the-risks

Users want systems that are secure.  Security is not mathematics or physics, there is no formula for good security, and no way to prove a system is secure in theory.  It is all about the practice and the track record.

* restrictions in the name of security are great when the user does not notice them
  * Debian and Ubuntu have AppArmor on by default, almost no one noticed.
* The questions of which restrictions to include by default becomes much harder when it does restrict things that users want to do.
* Some users might be willing to make that tradeoff, others not.


* So who is in control of the `targetSdkVersion` sandbox?  It is entirely Google, and perhaps more importantly, it is driven by Google Play more so than AOSP.  Google Play enforces the `targetSdkVersion`, Google Play controls Google Play Protect, the proprietary software that flags apps that do not mean the criteria as decided by the Google Play team.  This is all proprietary software designed by a team that is quite secretive, even within Google.  Try to find the names of people who work in the Google Play department, and now contrast that to AOSP.  AOSP and the Android Tools team are the public face of Android development.  But Google Play drives the policies.

* there are other tools in addition to sandboxes for building secure systems.
  * free software that can be inspected by anyone
  * distros where software is reviewed, tested, and integrated
  * publicly visible development processes 
  * logging of all source, binaries and work products so bad behavior can be attributed
  * human review of software to make it harder to get malware included
  * human relationships between user, distro, and developer to build trust.
  * walled garden of software that made it through all these hoops

Distros provide the best defense against supply chain attacks.


TOOT: I'm a proponent of decentralization and work towards tht goal. Maven Repos have key issues that make them hard to decentralize properly, a) vrificatio is ptional b) repos can override ohers

* TODO Endgame incident https://gitlab.com/fdroid/fdroiddata/-/merge_requests/10562, like Debian mIRC incident
* F-Droid aims to be a trusted pipe from the developer to the user.  The user still has to decide whether they trust the developer.  There are limited measures that add some level of protection from malicious developers.
* There are so many ways to track people, tracking companies are constantly working to find new ways to track people, when existing methods get blocked.  TODO links to super cookies, etc.
* Determined attackers always get in, as we can see from iOS jailbreaks and NSO Group's Pegasus malware.


*  the only documented case of "malware" found  in Debian: The trojaning of mICQ https://lwn.net/Articles/22991/
* https://arstechnica.com/information-technology/2020/04/sophisticated-android-backdoors-have-been-populating-google-play-for-years/



With the GNU/Linux distro security model, all dependencies are built from source on the distro's own build machines.  On a good distro like Debian, packages are built without internet access.  That makes it much easier to enforce what the dependencies are.

A distro is a curated collection meant work together.
* TODO include some more from https://gitlab.com/fdroid/fdroid-website/-/merge_requests/356 ?

A distro provides an extra layer of review
* distro maintainers become experts in specific issues that apply across many projects
* app maintainers are experts in the specific app
* The Google Play model replaces the distro maintainers with automated scans on binaries, F-Droid scans source code and binaries.

F-Droid uses this GNU/Linux distro architecture as a model, and we are working on methods to make the Android ecosystem work more like that.

* scanner improvements
* allowlisting repos
* auditing proxy


Google Play has a specific security model as well which is different from F-Droid and GNU/Linux distros.  Their focus is providing app developers direct access to users, so developers upload any app (which quite unrestricted up until recently) and Google Play will make the developer's files directly available to users.  Google Play makes money when people install apps they have bought or users see ads in installed apps, so their goal is to encourage people to install lots of apps.  Since this setup also made it easy to publish malware, the Google Play security model was built around sandboxing the app so that it gets restricted access to the system.  Sandboxing did not provide enough protection, so they added Play Protect to scan the binaries.  Since privacy violations were [rampant](TODO) in Google Play, they have been extending the sandbox to restrict access to data that might have privacy implications.  That includes data and APIs that have legitimate uses, for example WiFi and Bluetooth, which

so up until recently, there were very few restrictions onw

This is partly implemented in Android itself, as well as Google Play Services, Google Play Protect, and SafetyNet.  That means that F-Droid automatically inherits what is included in the base Android OS.  Then F-Droid also has to consider Google Play and SafetyNet since most users have those built into their devices.  The base Android OS also has differences, like CalyxOS vs LineageOS vs a Google Play Samsung device's OS.

* Play Protect flags apps based on relatively simple, automated rules
* screenshot of Play Protect flagging F-Droid based on targetSdkVersion

But we have to fight against the Android and Java ecosystem's sloppy ways.  The most egregious recent example is the Log4Shell exploit: that was so bad because the logging system was built by design to fetch code from URLs in the logs, then immediately execute it.

* jitpack attack
  * many apps slipped into Google Play
  * only one app slipped into F-Droid
  * we responded quickly and that one app was removed within **TODO** days.
  * Your donations allow F-Droid to respond to issues like this.  Our [Developer-in-Residence](TODO) Licaon-Kter was able to jump in at short notice and spend hours making sure the affected app was fixed in F-Droid.  With [more donations](TODO), F-Droid can do even more.
  * https://github.com/nextcloud/news-android/issues/1109
  * https://gitlab.com/fdroid/fdroiddata/-/issues/2753


* gradle/jcenter/gradlew insecurities
* https://news.ycombinator.com/item?id=8099840
* responses on jbaruch's blog
* https://github.com/WhisperSystems/gradle-witness/issues/10
* https://github.com/gradle/gradle/pull/448
* pypi lib typo squatting
  *  https://arstechnica.com/information-technology/2017/09/devs-unknowingly-use-malicious-modules-put-into-official-python-repository/
  *  https://lwn.net/Articles/834078/ Further analysis of PyPI typosquatting
  *  npm expired maintainer domains https://mastodon.social/@lrvick/108274265429826806
    * "I just noticed "foreach" on npm is controlled by a single maintainer.  I also noticed they let their  personal email domain expire, so I bought it before someone else did. I now control "foreach" on NPM, and the 36826 projects that depend on it."

  * https://www.zdnet.com/article/hacker-backdoors-popular-javascript-library-to-steal-bitcoin-funds/

ua-parser-js
  * https://hackaday.com/2021/10/22/supply-chain-attack-npm-library-used-by-facebook-and-others-was-compromised/

  *  https://www.bleepingcomputer.com/news/security/check-your-gems-rubygems-fixes-unauthorized-package-takeover-bug/
  *  https://www.bleepingcomputer.com/news/security/microsofts-azure-sdk-site-tricked-into-listing-fake-package/
* dependency confusion exploit https://medium.com/@alex.birsan/dependency-confusion-4a5d60fec610


* https://social.librem.one/web/statuses/109665555922422971
* https://blog.autsoft.hu/a-confusing-dependency

Sandboxes are quite limited in the protection they can provide against highly resourced, targeted attacks like what advanced state actors and ransomware groups develop.

Organizations like NSO Group maintain reliable zero-click and one-click exploits over years for both iOS and Android.  That means they are getting through all those sandboxes.  These exploits are packaged up as a product and sold to many governments around the world, and there has been widespread abuse of them.

If your adversary is wealthy or politically connected, they can get access to these exploit tools.  No exploit developer wants their source code published publicly; these exploits cost millions to develop, and they will cease to function once the target software understands the exploit and fixes the vulnerability.

## Methods to prevent these kinds of attacks

The F-Droid community is constantly working to make sure that the builds of software we produce is what users expect.  As much as possible, we implement tools in our build infrastructure to ensure this is true.  There are also things that app developers can do to ensure that 

* Add extra Maven repos after `mavenCentral()` and `google()` so they cannot override the libraries in those repos.  Gradle's repositories configuration will download the artifacts from the first Maven repo in the list that has. :
```gradle
allprojects {
    repositories {
        mavenCentral()
        google()
		maven { url 'https://jitpack.io' }
    }
}
```
* limit the scope of any additional Maven repos that you use:
```gradle
        jcenter() {
            content {
                includeModule("cc.mvdan.accesspoint", "library")
            }
        }
```
* _issuebot_ automatically checks for things like this.
* Use Gradle Verification
* The auditing proxy idea would provide something like a global Gradle verification.

* F-Droid does already verify some packages on every build.  All gradle binaries are verified before being executed via our custom [gradle wrapper](TODO), based on our [gradle transparency log](TODO).  All NDK packages are verified via our [Android SDK transparency log](TODO).  Many Android SDK packages are verified then pre-installed in the _buildserver_ VM, that means Gradle won't auto-download an unverified version.

* We have a replacement for Google's _sdkmanager_ which verifies every package it installs based on SHA-256 checksums from our Android SDK transparency log.

F-Droid does not have billions in revenue nor staff devoted to monitoring our network and servers.  We instead take the approach of verifying everything that can be.  Then it becomes much less important to defend the servers.  The official client verifies the apps [based on](TODO Security Model) a signed index.  For client operations, that means we only have to trust the webserver and mirrors to stay online.  The client will detect if files have been modified.  With the upcoming [Index-V2](TODO) work, the client will verify all files, including icons, screenshots, etc.  In order to verify that new commits came from the right people, we are adding optional support for app builds to be based on [verifying signatures on git tags](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/989).


* Reproducible builds:

The US National Security Agency (NSA), Cybersecurity and Infrastructure Security Agency (CISA), and the Office of the Director of National Intelligence (ODNI) have released a document called  "Securing the Software Supply Chain: Recommended Practices Guide for Developers" as part of their Enduring Security Framework (ESF) work:
https://media.defense.gov/2022/Sep/01/2003068942/-1/-1/0/ESF_SECURING_THE_SOFTWARE_SUPPLY_CHAIN_DEVELOPERS.PDF

It *expressly* recommends having reproducible builds as part of "advanced" recommended mitigations (along with hermetic builds). PDF page 35 (labelled page 31) says:
"Reproducible builds provide additional protection and validation against attempts to compromise build systems. They ensure the binary products of each build system match: i.e., they are built from the same source, regardless of variable metadata such as the order of input files, timestamps, locales, and paths. Reproducible builds are those where re-running the build steps with identical input artifacts results in bit-for-bit identical output. Builds that cannot meet this must provide a justification why the build cannot be made reproducible. 

Their press release is here:
https://www.nsa.gov/Press-Room/News-Highlights/Article/Article/3146465/nsa-cisa-odni-release-software-supply-chain-guidance-for-developers/

TODO https://verification.f-droid.org/verified.html



# Notes and cruft


One common complaint about decentralized systems is that they do not work, or they work badly.

For the Android ecosystem, we can look to the [Chinese app store market as an example](https://www.forbes.com/sites/eladnatanson/2019/09/03/the-other-android-app-stores-a-new-frontier-for-app-discovery/).  There are 15-10 commonly used app stores in China, the largest has less than 15% market share.  

* this is also decentralization
* but there is not cooperation between them
* if you want to use one of those collections, you have to install their apps
* the F-Droid model gives you both:
  * each app store can have its own app
  * each app store can have its own repositories
  * all of these can be freely intermixed
* this is real user choice

So there is no monopolistic store like Apple App Store or Google Play.


StrandHogg vuln means apps can put up phishing screens in Android
https://promon.co/security-news/strandhogg/
* yet more evidence that you have to trust your apps
* Google has been pushing a model with Android apps and web apps that users can safely use any app, since they are safely sandboxed.  This has been proven wrong time and time again.  The safe borders remain at the hardware level: if you want to trust your device, it is not possible to run untrusted apps on it.
* Curation means more scrutiny
* decentralization means people can choose who they trust in a fine-grained way.


* don't tell people their feelings
* everything is offensive to someone


Personas and subpersonas
which spectrum are they on?

* stripes we are mutts


* MVN historical context
* frame it as growth and evolation

* convey the non-negotiables
* purpose

* goal set: what are we actually going to do



If I had more time, I'd love to build a campaign around that. "Who do you trust more? F-Droid or Google?"

I'd argue that there's no point in losing time with such a campaign, at least not to tackle this issue, because Google has a point and F-Droid looks bad arguing against it instead of doing the work that's needed.

Google says the work is needed, but I disagree that it is.  Most of the sandbox improvement are around native code, F-Droid is Java/Kotlin. And its free software, and audited.

scoped storage? hardware identifiers, etc?

* F-Droid Privileged Extension?  If you don't trust F-Droid, then the sandbox isn't going to change much

So what's your point then? You want google to give you an exception, because you are free software and received a couple of audits? should they give you full root on phones to make your life easier as well?

* That prompt comes from proprietary software.  They are declaring apps "Unsafe" based on an oversimplified rule that benefits their monopoly

* how is it benefiting their monopoly? by making it harder to install apps that have a hard time to keep up with the rules?

* : they say "we are safer, trust the closed source" mostly. They keep it open...but they control the openness, they are "gatekeepers", righn?

* they give their own apps exceptions to those rules, that's one way. some of those exceptions are hardcoded in Android

I totally get the Free Software angle, but this shouldn't blind us to the other angles that exist as well. Just because we don't like them, their non-free software and that we are trapped in their ecosystem doesn't mean that should recognize sensible rules with respect to privacy and security.


* Android is pushing more and more towards being a OS for consuming, and blocks creating more and more.
the targetSdkVersion restrictions have broken a bunch of cool things that used to be possible.
I can still do them on DEbian


* Just because we don't like them, their non-free software and that we are trapped in their ecosystem doesn't mean that should recognize sensible rules with respect to privacy and security.

I agree with this idea, but that screen is not an example of sensible rules IMHO.  It has has much to do with monopoly enforcement as anything else.
If you want an example of sensible rules, maybe take scoped storage as an example. Don't you think it is fine to warn about apps that can access all of the users files without asking?

In specific cases, yes, but not always.  I don't get such warnings in Debian/GNOME and yet...
that UX design is built around proprietary software and app stores pushing as much shady apps as posib.e
so now they need to sandbox them to reduce the privacy violations


# TODO LK notes

Not really a story since I'm not a storyteller 😄

On 2022.08.08 the "Nextcloud News for Android" users observed[1] some unusual traffic comming from the app.
Their app version was built and installed from F-Droid.
More users confirmed the anomaly and started to investigate.
The users found the culprit and the devs opened a private issue[2] in F-Droid on 2022.08.22, but sadly this was after 2 weeks from the initial findings.
The culprit was a dependency, one that is not built by F-Droid but taken from a "trusted maven repo"[3], jitpack.io
I've disabled said build from F-Droid once we've understood what the issue was.
It was a Sunday afternoon, so I interacted with the devs on and off, and app version was disabled after about 4h, when I reached a proper keyboard to be able to test older versions too.
Actual APK was pull from the server in the next cycle, not right away.
I've also opened an issue with the faulty maven repo[4] directly.
Elsewhere (Offtopic XMPP channel), I've raised this issue as an interesting find and the DivestOS ROM developer dug further.
What they found is that more apps were affected, about 105[5], but only this one is in F-Droid too.
The upstream devs builds were not affected because they had a clean version of said lib in their local machine cache.
The jitpack.io devs responded and took the impostor package down, promised to close the used loophole too.
App devs published a new version, F-Droid built it and it's available already.

The list of affected apps is interesting, all sorts of apps but the very first[6] app that was added to the list might be the most interesting one, *an Ukrainian Bank app[7]*.

Attackers left a message too in code:
> This is not an attack, this is an experiment I made on android vulnerability,
> I use this to get package name so I can report the vulnerability on affected apps.
> If you haven't received my report, please contact me at patisengkuni at protonmail.com

...yet we didn't see any blog post or news about this "research".

Since jitpack.io took the package down all the apps that updated in the meantime got "fixed for free".

Fun fact, until one year ago F-Droid Client itself used the same library[8] but we would not have been affected by the recent hack because we do not use the jitpack.io repo, so the impostor package would not have been pulled anyway.

[1]: https://github.com/nextcloud/news-android/issues/1109
[2]: https://gitlab.com/fdroid/fdroiddata/-/issues/2753
[3]: https://f-droid.org/en/2022/07/22/maven-central.html
[4]: https://github.com/jitpack/jitpack.io/issues/5204
[5]: https://github.com/patisengkuni/interactsh-web/blob/d48821fb639dba0c2006a01773c5075ec9db5478/src/lib/localStorage/index.ts#L49-L154
[6]: https://github.com/patisengkuni/interactsh-web/commit/9e949ccbd283104b9ed8602389bbd7c7ca7e625f
[7]: https://play.google.com/store/apps/details?id=ua.privatbank.ap24
[8]: https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1025/diffs#dcd15dbb1c3dfcdbe9381c513422196510b1367c_27_27
