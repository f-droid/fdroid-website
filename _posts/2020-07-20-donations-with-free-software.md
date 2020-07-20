---
layout: post
title: Donations with Free Software
author: "F-Droid"
---

When F-Droid started back in 2010, there were no free software options
for donations.  So we used the standard proprietary services, and
received enough donations to keep things running.  Thank you for your
continued support over the years!  In recent years, two solid free software
funding platforms have been established:
[Liberapay](https://github.com/liberapay) and
[OpenCollective](https://github.com/opencollective).  The F-Droid
community has worked hard to push free software in everything we do.
When GitLab started, we switched to gitlab.com as our development
platform.  We have always used free software for translations (now
[Weblate](https://weblate.org/), and MediaWiki Translate beforehand).
We work with [Debian](https://wiki.debian.org/AndroidTools) and
[Android Rebuilds](https://android-rebuilds.beuc.net/) to make free
software Android SDK components available.  We work with [Reproducible
Builds](https://reproducible-builds.org/) and
[Maven](https://maven.apache.org/guides/mini/guide-reproducible-builds.html)
to provide tools so that anyone can verify that apps are built only
from publicly available source code.

We have just completed the integration of the preferred donation
platforms across the whole F-Droid ecosystem.
[`OpenCollective:`]({{ site.baseurl }}/docs/Build_Metadata_Reference/#OpenCollective)
is now fully supported.  We introduced the
[`Liberapay:`]({{ site.baseurl }}/docs/Build_Metadata_Reference/#Liberapay)
metadata field to support the native usernames, and are migrating away from
the old `LiberapayID:` account numbers.


### Free Software Funding Boom

There is also a flurry of activity around donation-based funding of
free software.  That has been nicely encapsulated in GitHub Sponsor's
[definition](https://help.github.com/en/github/administering-a-repository/displaying-a-sponsor-button-in-your-repository)
of the
[_FUNDING.yml_](https://gitlab.com/fdroid/fdroidclient/blob/master/FUNDING.yml)
file to register donation methods as part of a Git repo.  This fits in
nicely with F-Droid concept of deferring to the developer's Git repo
as the source of key metadata about the app (descriptions,
translations, screenshots, email address, etc).  Once F-Droid has
established the source repo URL as the canonical source location, it
is already trusted, so it provides a trusted channel from the app
developer to the users of that app, via F-Droid.


### What does this change for app developers?

One goal of F-Droid is to drive donations to app developers, because
high quality free software apps are the reason for F-Droid existence.
We want to do this while respecting user freedom.  So while this will
affect how each app's donation options are displayed, it will not
remove any of the existing services or links.  Developers are users of
F-Droid as well, so giving full flexibility is important to us.  All
of them will still be displayed.  With the new _FUNDING.yml_ support,
it will hopefully be easier for app developers to manage the donation
methods they are using.  Right now, the F-Droid ecosystem only
supports a single generic URL as a donate option
[`Donate:`]({{ site.baseurl }}/docs/Build_Metadata_Reference/#Donate).
_FUNDING.yml_ lets developers specify a list.  Welcome contributions to
implement showing all available donation options.  Our current
workaround is to have a [web page]({{ site.baseurl }}/donate/) that
lists all donation options.


### De-emphasizing Proprietary Services 

Since we have two good free software options for receiving funding, we
are taking this opportunity to promote them, and reduce the visibility
of the proprietary options.  It is too soon to rule out proprietary
funding services altogether.  This is a stepping stone along that
path, for that is our destination.

