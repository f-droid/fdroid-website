---
layout: post
title: Android broadcasts data leakage
author: "uniqx"
---

F-Droid has a long history of transparently warning users about potential risks
with apps we're distributing. Our team is currently specifically focusing on:
[tracking]({{ site.baseurl }}{% post_url 2020-01-16-tracking-the-trackers %}).
Usually tracking is perfectly opaque to users. In privacy policies this
collected data often is described as metadata, which is usually is a crude
over-simplification.  Metadata usually reveals: communication partners and
habits, consumption preferences, protocols about your location but also
activities like sleeping, driving, walking, etc.  With a little effort, it is
usually feasible to extract politics, sexual preferences, health conditions,
etc. from metadata with reasonable statistical confidence.

When we are looking into tracking on Android, we also have to look at flows of
(meta-) data on Android. There are a couple of ways to pass data between apps,
[broadcasts](https://developer.android.com/guide/components/broadcasts) is a
major way of doing so. A typical use-case we found is that media-players on
Android broadcast the song they're currently playing. Every App on your device
can subscribe to these broadcasts. While this might seem useful for all sorts of
use-cases, this actually is potentially [major privacy leak](https://pubmed.ncbi.nlm.nih.gov/29587129/).

We not aware of any privacy research about the Android broadcast system. So we
do not know the full extent of all potentially leaking (meta-) data. We also do
not know if there are any trackers or other malware out there which already
exploit this data. We were able to find this, so it is reasonable to assume that
others can too.  We have incorporated this in our further research for
automatically identifying trackers and hope this article will raise awareness
amongst other privacy researchers.
