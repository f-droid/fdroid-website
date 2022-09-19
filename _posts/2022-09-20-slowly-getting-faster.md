---
author: eighthave
layout: post
title: Slowly getting faster
---

We have been a bit quiet recently on some fronts, like this blog and on merge requests to review.  We strive to keep our users informed, and we always appreciate contributions, even when we cannot immediately review them. F-Droid started in 2010, so we have some technical debt and cannot always move fast.  We appreciate patience when contributing.  The good news is that this is because we are really quite busy with a whole slew of large improvements that all seemed to happen at the same time.  So here is a quick overview:

* You might have noticed that this website sometimes ran really slowly.  We have been working to improve that.  Since we rolled out the new front facing web servers, we have seen a large improvement there.  And now we get better data about network usage and server state which means that we can more effectively troubleshoot and optimize going forward.

* We're wrapping up a [major overhaul](https://gitlab.com/fdroid/fdroidclient/-/milestones/49) of the official F-Droid client app (thanks to [FFDW]({{ site.baseurl }}{% post_url 2022-02-05-decentralizing-distribution %}) funding), including a security audit (thanks to [NLnet](https://nlnet.nl/project/F-Droid-Trackers/) funding).  This replaces huge chunks of technical debt, fixes many bugs, adds a comprehensive test suite, and should make it much easier for contributors to follow the code.

* There are new contributor _buildserver_ instances for testing app builds on the production setup.  This has sped up the app review process, especially for key apps that are complicated to build, like [Element]({{ site.baseurl }}/packages/im.vector.app/) or [Jitsi Meet]({{ site.baseurl }}/packages/org.jitsi.meet/). These instances also let us do regular, repo-wide scans to find any [non-free dependencies](https://gitlab.com/fdroid/fdroidserver/-/issues/1004) that have might have snuck in.

* After using the Ansible automation for contributor _buildserver_ instances, this setup is now proven, and we are now switching the production setup to use it.  That means anyone can inspect and recreate the production setup with relative ease.

* We are setting up new hardware for the production _buildserver_ to enable [parallelizing]({{ site.baseurl }}{% post_url 2022-05-24-buildserver-overhaul-sponsored-by-calyx-institute %}) the build processes.

* We are finalizing our new legal entity with its own board of directors.

* Setting up more F-Droid core contributors to get paid to work on F-Droid.

And that is just a sample of what all is going on.  F-Droid can move faster with more contributions, and we want your contributions!  It can be anything from [app](https://gitlab.com/fdroid/rfp/-/issues) [reviews](https://gitlab.com/fdroid/fdroiddata/-/merge_requests), diving in to fix [issues](https://gitlab.com/groups/fdroid/-/issues/?sort=updated_desc&state=opened&label_name%5B%5D=help-wanted), and donations to [enable more people to spend more time]({{ site.baseurl }}/donate/) to making F-Droid better.
