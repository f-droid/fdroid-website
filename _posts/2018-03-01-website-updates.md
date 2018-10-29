---
layout: post
title: "Website Updates"
author: "F-Droid"
---

There have been a couple of important updates to this website.  First,
a longstanding complaint about this website is that there is only
prominent donation buttons for F-Droid itself, and not for the apps.
We want to support as many app developers as possible, so the app
pages have been updated to highlight that app's donation options.  See
[Mastalab]({{ site.baseurl }}/packages/fr.gouv.etalab.mastodon/),
[Telegram]({{ site.baseurl }}/packages/org.telegram.messenger/),
or
[F-Droid itself]({{ site.baseurl }}/packages/org.fdroid.fdroid/)
to see what the new layout looks like.

The search field has changed to now be run by our own custom
[search service](https://gitlab.com/fdroid/fdroid-website-search).
This allows all aspects of the website to work with or without
Javascript to support as wide a range of devices and browsers as
possible, including Tor Browser and browsers on cheap mobile devices.
This new search service also includes a much more complete index, so
it is now possible to search based on all of the metadata, for example
by license:

* <https://search.f-droid.org/?q=gpl-3.0>
* <https://search.f-droid.org/?q=apache-2.0>

There is a lot that can be done to improve the search, we welcome
contributions!  For example, it would be nice to still offer the old,
live search popup.  That just requires someone fixing
[this issue](https://gitlab.com/fdroid/fdroid-website/issues/175).

Since all of the apps descriptions and graphics are submitted by
developers, this website needs to have extra protections to ensure
that the text and graphics that come from app developers cannot be
used to exploit visitors of this website.  To read more about the
measures we take to ensure the security of this site, see the "Initial
Install" section of
[Security Model]({{ site.baseurl }}/docs/Security_Model).

Also:
* Last Updated now changes properly
* the permissions list per app version is now foldable
* the F-Droid Donate section is not shown on the sidebar of app pages
