---
author: eighthave
layout: post
title: "εxodus ETIP: The Canonical Database for Tracking Trackers"
---

There is a new story to add to the list of horrors of [Surveillance Capitalism](https://en.wikipedia.org/wiki/Surveillance_capitalism): the United States' Military is [purchasing tracking and location data](https://www.vice.com/en/article/jgqm5x/us-military-location-data-xmode-locate-x) from companies that track many millions of people.  Users must have real options for stepping out of "big tech", [where tracking dominates](https://www.theguardian.com/technology/2017/nov/28/android-apps-third-party-tracker-google-privacy-security-yale-university).  We review all apps submitted to [_fdroiddata_](https://gitlab.com/fdroid/fdroiddata/merge_requests) for tracking and other "[anti-features](https://f-droid.org/en/docs/Anti-Features/)". F-Droid is built into mobile platforms like [CalyxOS](https://calyxos.org/) that are free of proprietary, big tech software.  Since we only distribute free software, that means we have the complete source code to review.  This makes it much easier to find tracking activity, even when it slips in accidentally without the app developer knowing it, like when one free library pulls in other dependencies.

Right now, the most effective method for automatically finding trackers is to
search for well known strings in the extracted contents of the APK.  Domain
names are one example, like if an app is sending data to `google-analytics.com`
or `facebook.com`, then it is clear that it is doing some kind of tracking.
These lists of well known strings must be created and managed by people, then
gathered and reviewed.  [Exodus Privacy](https://exodus-privacy.eu.org/) created
their [Exodus Tracker Investigation Platform
(ETIP)](https://etip.exodus-privacy.eu.org/) for exactly this purpose.  F-Droid,
[Yale Privacy Lab](https://github.com/YalePrivacyLab/tracker-profiles),
[_jawz101_](https://github.com/jawz101/potentialTrackers), Guardian Project, and
others have centralized their efforts on εxodus ETIP as the canonical database
for these strings.


## Searching the open web for key bits

Since tracking is mostly done by companies trying to get customers,
they advertise and document their services on the web.  We spent some
time searching for that information to see what we could find.  We
mostly searched using two bits of information: the API Key Identifiers
that we
[extracted](https://gitlab.com/trackingthetrackers/extracted-features/-/blob/master/axml-meta-data-run)
and "top 10" lists of companies that provide tracking and related
services.  From this, we added over 50 new service profiles to the
εxodus ETIP database.  We also added upwards of 100 pieces of
additional information to existing entries like SDK identity strings,
links to documentation, privacy policies, and information on the
company's tracking methods.

From that research, we saved some choice promises from selected tracking companies:

* "Glassbox offers customer experience analytics solutions that
  doesn’t just tell you what a customer is doing. It tells you why."
* "Target traffic from all sources, including the 50% from the hidden
  web where third-party cookies are blocked, to increase targetable
  inventory."
* "Collect customer and product data in real time, from anywhere"
* "PlaytestCloud will capture the whole gameplay experience, turning
  you into a spectator with super powers."
* "We record the players’ screen, their touches and what they have to
  say at all times."
* "We curate geospatial ground truth data sets on a global scale"
* "Take segmentation and analysis from overnight to real-time. Our DMP
  works in-session for perfect match rates even on passerby traffic."


## Crowdsourcing the hunt for trackers

Tracking the trackers is the kind of work that fits in very well with
crowdsourcing.  Tracking companies are disappearing and renaming
themselves all the time, in order to avoid too much scrutiny.  But
they still must reach out to developers in order to find customers.
That means we can find them.  Join in the search!  Non-technical
people can also contribute, for example, when you read news about a
tracking company,
[search](https://etip.exodus-privacy.eu.org/trackers/all) to see if it
is already in ETIP.  If not, [file an
issue](https://github.com/Exodus-Privacy/etip/issues) to request it is
added. Android developers with little bits of spare time can add code
signatures, domain names, and other key technical details to ETIP.  Or
even [code up quick scripts](https://gitlab.com/trackingthetrackers/scripts/-/blob/master/find-ga_trackingId.py)
with new ideas for detecting tracking.

There are a number of forums where you can ask for assistance in
getting started.  Hope to hear from you soon!

* [Contributing to Exodus Privacy](https://exodus-privacy.eu.org/en/page/contribute/)
* [F-Droid Forum](https://forum.f-droid.org)
* [F-Droid chat rooms](https://f-droid.org/about/#contact)
* [Guardian Project channels](https://guardianproject.info/contact/)

(_This work was supported by NLnet's [NGI Zero PET](https://nlnet.nl/thema/NGIZeroPET.html) fund._)
