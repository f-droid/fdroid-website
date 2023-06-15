---
layout: post
title: "Progressive web-app client for F-Droid"
author: "uniqx"
authorWebsite: "https://chaos.social/@uniqx"
---

We've created a prototype of a progressive [web app for browsing F-Droid
repositories](https://gitlab.com/uniqx/fdroid-webdash).  It's built with
[Flutter](https://flutter.dev/), which is really great for working in rapid
development cycles.  It also allows us to make it look and feel like a modern
Android app.  As a trade-off the web-app is pretty big in size (~ 10 MByte).
So depending on your internet connection speed loading it for the first time
might take a while.  Flutter is also notoriously trying to connect to Google
servers, and we couldn't figure out how to make the app GDPR compliant just
yet.

Since it's a just an early prototype, it's nowhere near as complete as our
[official Android app](https://f-droid.org/en/packages/org.fdroid.fdroid/).
Right now it only has some of the most basic features: Displaying basic
repository informations; Providing a link/QR-code for adding the repository to
your F-Droid client; Browsing and searching for apps; Displaying app details
and app downloads.

F-Droid repositories themselves are deployed like web-sites.  So naturally it's
possible to deploy this web-app into any F-Droid repository and instantly make
it browse-able on the web.  We're considering to add an option for deploying it
automatically to our tools for managing F-Droid repositories.

Our team also came up with experimental solution for shipping iOS apps using
F-Droid repositories.  So our new PWA opens up a great opportunity to explore
how F-Droid could work for iOS users.  However at this point, this is just
research.  There are no plans to provide stable support for shipping iOS apps
and also no plans about bootstrapping a repository of FOSS apps for iOS.
