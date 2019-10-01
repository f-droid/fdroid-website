---
layout: post
title: "Testing helps get updates out"
author: "eighthave"
---

After a few month hiatus, our staging setup for the complete
buildserver is again running, thanks to the
[Reproducible Builds](https://reproducible-builds.org/)
team who host that infrastructure. These Continuous Integration (CI)
jobs create a
[complete buildserver](https://jenkins.debian.net/job/reproducible_setup_fdroid_build_environment/)
from scratch once a week based on the current source code
(e.g. _master_).  This buildserver instance is then used to 
[build all apps](https://jenkins.debian.net/job/reproducible_fdroid_build_apps/)
that have not yet been built on this machine.  Getting these CI jobs running
again pointed us to a
[key issue](https://jenkins.debian.net/job/reproducible_fdroid_test/259/console)
that was blocking the publishing of updates for over a week.

We often get questions about how people can contribute to F-Droid.
One less visible but nonetheless important way to contribute is
monitoring these CI jobs and then troubleshooting the cause.  All of
these server setups are automated, and all of the software that run
f-droid.org are free software.

Anyone can follow the CI tests, the official tests for the build and
publish process are all listed on the
[fdroidserver project README](https://gitlab.com/fdroid/fdroidserver/#readme).
And then we welcome merge requests to
[fix the issue](https://gitlab.com/fdroid/fdroidserver/merge_requests/679),
filing an issue to report and track the problem, or even discussion of the
problem in our chat room.
