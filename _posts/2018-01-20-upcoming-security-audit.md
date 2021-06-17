---
layout: post
title: "Upcoming Security Audit"
author: "eighthave"
authorWebsite: "https://forum.f-droid.org/u/hans"
---

We have started the process of the second security audit of the
F-Droid setup.  The audit will be conducted by
[Radically Open Security](https://www.radicallyopensecurity.com),
which is a natural partner for F-Droid since they share our focus on
free software and open processes.  Once we receive the results and
have addressed any issues found, we will publish the full, unedited
audit report here.  Thanks to [Open Tech Fund](https://opentech.fund)
for covering the costs of hiring the auditor.

For more information about F-Droid's security practices on in the
documentation about the
[Security Model]({{ site.baseurl }}/docs/Security_Model/).

## Looking back at the first security audit

We received an
[external audit](https://cure53.de/pentest-report_fdroid.pdf) in 2015
from Cure53, provided by the
[Open Tech Fund](https://opentech.fund). This was the first full
security audit of the core security practices of F-Droid.  On top of
the core, the focus on the audit was on the new, experimental features
that opened up F-Droid as an ecosystem, moving away from the central
server model.

This audit confirmed the security of core pieces, as listed on the top
of this page.  That is a little hard to see since the report only
discussed the vulnerabilities that were discovered.  This audit did
find critical issues in the website, opt-in beta features, and some
minor features like `fdroid import`, which is only used by a couple of
people and never on core infrastructure.  It is important to note that
the website issues never meant that getting apps via the Android
client app was affected.  Most importantly, all of the security issues
were fixed.  The audit also demonstrated that building a system with
user-generated inputs is hard to fully secure.  Our focus is removing
anything that opens up attack vectors to the external data sources
like app source repos.

The normal way of using F-Droid was not affected.  For example,
regarding _BZ-01-004 Command Injection Flaw_, the root-based
installation method was marked experimental, not widely used, and
removed around not long after the report came out. The _BZ-01-002_ and
_BZ-01-003_ TOFU issues never applied to the default app repos since
the repo keys are built into the client app.

The serious issues that affected the ecosystem where:

* BZ-01-005 App with WES Permission can replace APKs before
  Installation (_fixed_)
* BZ-01-008 Multiple XSS Problems in WP-FDroid Plugin (_we entirely
  removed Wordpress, the site is now statically generated using
  Jekyll_)
* BZ-01-011 Persistent XSS via SVG Upload in MediaWiki (_bug fixed in
  MediaWiki, SVG upload disabled, and open wiki registrations disabled
  on f-droid.org_)
* BZ-01-014 RCE via fdroid checkupdates Command on Git Repository
  (_fixed_)

These only affected a few non-critical users or were parts of opt-in
beta features:

* BZ-01-002 TOFU Requests too easy to recognize and intercept (_fixed_)
* BZ-01-003 Repository Fingerprint is not verified on first Fetch (_fixed_)
* BZ-01-004 Command Injection Flaw in root - based Installation Method
  (_only repo publisher could do this, removed root-based installation
  method_)
* BZ-01-012 Arbitrary Command Execution via `fdroid import` and SVN

The following issues all assume developer- or publisher-level access.
We do not claim to protect against attackers with that level of
access. People in those roles can always publish malicious code
directly, without resorting to complicated exploits.

* BZ-01-007 Malicious symlinked APK can lead to arbitrary File Read
* BZ-01-013 Directory Traversal Exploit Potential caused by `fdroid import`
* BZ-01-015 SVN Repository Access leaks Credentials to local Processes
* BZ-01-017 Unauthorized Access to internal Network Resources

The audit report PDF from Cure53 is also cached on this site:
[pentest-report_fdroid.pdf]({% asset posts/2018-01-20-upcoming-security-audit/pentest-report_fdroid.pdf %}).
