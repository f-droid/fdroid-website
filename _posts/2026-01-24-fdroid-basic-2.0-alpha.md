---
layout: post
title: "F-Droid Basic 2.0 alpha released"
author: "grote"
---

Over the past year, we have been busy to modernize our app.
The work supported by the [NGI Mobifree](https://f-droid.org/2025/04/29/mobifree-client-funding.html)
has progressed nicely
and we are now at a point where we are releasing the first alpha version
and ask the community for feedback and testing.
Note that for now this release is only for F-Droid Basic as the full version isn't ready, yet.

While iteratively rewriting the app and incorporating constant feedback from our developer community,
the new app turned out a bit different than the old one.
Major changes call for a major version change and therefore, this will be **F-Droid 2.0**.
Highlights of this release include:

* UI rewritten from scratch with Kotlin compose
* improved search, also searching in descriptions and translations
* easier to discover new apps, also highlighting the most downloaded ones
* installation approval *before* downloading
* multiple updates/downloads at the same time
* notifying user of issues with apps (e.g. signing key changed)
* optional Material You color theme
* improved filtering of lists

<img src="{% asset posts/2026-01-24-fdroid-basic-2.0-alpha/screenshot.png %}" />

Before you jump to upgrade right away, note that there are also some features still missing.
If you use any of the following features and would miss them dearly,
you may want to hold off with the update and please also let us know about it:

* IPFS gateways
* prevent screenshots
* prefer foreign mirrors
* DNS cache
* installation history

Furthermore, there are some known issues we want you to know about, in case they are a deal-breaker for you:

* installation for some apps needs to be confirmed before *and* after they are downloaded
* tapping update notification sometimes doesn't show 'My Apps' screen
* on some few phones the "Installing apps" notification doesn't go away

We've been testing the app internally for some time and other than the above,
it is quite stable and we consider it ready for daily use for adventurous users.

Please [let us know](https://f-droid.org/about/#contact) what you think of the new app
and if you ran into any issues.
If the app is crashing for you, please send us the report.

Note that if you are already using F-Droid Basic, you won't receive this update automatically.
You need to navigate to the app inside F-Droid and "Allow beta updates" in top right three dot menu.
