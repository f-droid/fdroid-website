---
layout: page
title: Anti-Features
---

Anti-Features are flags packagers apply to apps, warning of possibly
undesirable behaviour from the user's perspective, often serving the
interest of the developer or a third party.

You will see these in the F-Droid client, and/or web repository browser
when viewing the details of an app containing one or more of these
Anti-Features.


## List of Anti-Features

F-Droid currently uses this list of Anti-Features for labeling apps we
are shipping:

* [Ads](#Ads) - advertising
* [Tracking](#Tracking) - tracks and/or reports your activity to somewhere, even when it can be turned off
* [Non-Free Network Services](#NonFreeNet) - promotes or depends entirely on a non-libre network service
* [Non-Free Addons](#NonFreeAdd) - promotes other non-libre apps or plugins
* [Non-Free Dependencies](#NonFreeDep) - needs a non-libre app to work (e.g. Google Maps, Market)
* [Upstream Non-Free](#UpstreamNonFree) - upstream source code is not libre, and this version has those parts replaced or rewritten
* [Non-Free Assets](#NonFreeAssets) - non-libre media in things that are not code (e.g. images, sound, music, 3D-models, or video)
* [Known Vulnerability](#KnownVuln) - known security vulnerability
* [Disabled Algorithm](#DisabledAlgorithm) - signed using an unsafe algorithm
* [No Source Since](#NoSourceSince) - source code no longer available, making new releases impossible

Here's a complete [list of all apps in F-Droid containing Anti-Features](https://monitor.f-droid.org/anti-features).


### Ads<a name="Ads" />

This Anti-Feature is applied to an app that contains advertising.

Note that most applications that contain advertising are not Free Software,
because they use proprietary software (e.g. AdMob) to provide that
advertising. Those apps will not be found in the repo at all, so the only
time you would see this Anti-Feature applied would be an app that contains
advertising without using Non-Free Software to do it.

Here's the list of [apps with Ads](https://monitor.f-droid.org/anti-feature/Ads).


### Tracking<a name="Tracking" />

This Anti-Feature is applied to apps that track you and/or report your
activity to somewhere, either without your permission or by default
(i.e. you'd have to actively seek out an option to disable it).

Examples of where this Anti-Feature might be applied:

* Sending crash reports without your knowledge or permission
* Checking for updates without your knowledge or permission

Examples of where it would not be applied - any of the above,
if the functionality is opt-in (i.e. you are asked before it happens)
and disabled by default. Enabling it should then also require informed
consent, i.e. requiring a privacy policy similar to GDPR, and avoid
collecting personal data (PII) as far as possible.

Note that frequently app tracking is implemented using proprietary software,
e.g. Google Analytics or Flurry. Apps containing these proprietary libraries
will **not** be found in the F-Droid repo.

Here's the list of [apps with Tracking](https://monitor.f-droid.org/anti-feature/Tracking).


### Non-Free Network Services<a name="NonFreeNet" />

This Anti-Feature is applied to apps that promote or depend entirely on
a Non-Free network service.

Here's the list of [apps with Non-Free Network Services](https://monitor.f-droid.org/anti-feature/NonFreeNet).


### Non-Free Addons<a name="NonFreeAdd" />

This Anti-Feature is applied to apps that, although Free Software themselves,
promote other Non-Free applications or plugins.

Here's the list of [apps with Non-Free Addons](https://monitor.f-droid.org/anti-feature/NonFreeAdd).


### Non-Free Dependencies<a name="NonFreeDep" />

This Anti-Feature is applied to apps that require things
that are not Free Software in order to run.

This does not mean that proprietary software is included in the app,
but for example, it may depend on other software already being
installed on your device. A common example would be an app that doesn't
run, or is not useful, unless you have Google Maps installed.

Here's the list of [apps with Non-Free Dependencies](https://monitor.f-droid.org/anti-feature/NonFreeDep).


### Upstream Non-Free<a name="UpstreamNonFree" />

This Anti-Feature is applied to apps where the upstream source code
includes proprietary software by default in their own releases.

This does not mean that proprietary software is included in the app.
Most likely, the F-Droid build has been patched in some way to remove
the Non-Free code/libraries, and/or some functionality may be missing.
The app's description will usually go into more detail about this.

In our experience, where the upstream developer includes Non-Free libraries,
sooner or later they will include more Non-Free libraries, or other
Anti-Features. Frequently they become impossible to maintain/update in
F-Droid. If there is an alternative, it is recommended that you avoid
applications with this Anti-Feature if future updates are important to you.

Here's the list of [apps with Upstream Non-Free](https://monitor.f-droid.org/anti-feature/UpstreamNonFree).


### Non-Free Assets<a name="NonFreeAssets" />

This Anti-Feature is applied to apps that contain and make use of
Non-Free assets. The most common case is apps using artwork -
images, sounds, music, etc. - under a non-commercial license.

Here's the list of [apps with Non-Free Assets](https://monitor.f-droid.org/anti-feature/NonFreeAssets).


### Known Vulnerability<a name="KnownVuln" />

This Anti-Feature is applied to apps with a known security vulnerability,
found by one of the scanners in _fdroidserver_.

Here's the list of [apps with Known Vulnerabilities](https://monitor.f-droid.org/anti-feature/KnownVuln).


### Disabled Algorithm<a name="DisabledAlgorithm" />

This Anti-Feature is applied to apps that were signed using a signature
algorithm that is considered outdated or unsafe.

Here's the list of [apps signed with Disabled Algorithms](https://monitor.f-droid.org/anti-feature/DisabledAlgorithm).


### No Source Since<a name="NoSourceSince" />

The upstream source for this app is no longer available. Either the app went
proprietary, the source repository was dropped, or it has moved to a location
currently not known to us. This means there will not be further updates unless
the source reappears.

Here's a list of [apps with No Source](https://monitor.f-droid.org/anti-feature/NoSourceSince).


## Reporting Anti-Features

While our package maintainers are working hard to find all Anti-Features
and bring them to your attention, some might remain unnoticed or slip in
with an app update. Should you discover that an app contains an Anti-Feature
F-Droid is not aware of, please report it. You can submit them by E-Mail to
[team@f-droid.org](mailto:team@f-droid.org) or open an issue here:
[gitlab.com/fdroid/fdroiddata/issues](https://gitlab.com/fdroid/fdroiddata/issues).
