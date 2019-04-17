---
layout: post
title: "Decentralizing Localizations"
author: "eighthave"

---

App development is already well decentralized, and when F-Droid
introduced metadata localization, we also made it possible to manage
[translations and graphics]({{ site.baseurl }}/docs/All_About_Descriptions_Graphics_and_Screenshots)
outside of F-Droid itself.  Two tools, Fastlane and Triple-T, even
provide a way to sync those between the app source repo, F-Droid, and
Google Play.

Using [Weblate](https://hosted.weblate.org/projects/f-droid/) for
handling all
[F-Droid localization]({{ site.baseurl }}/docs/Translation_and_Localization)
puts contributors with expertise in specific languages and how they
should be translated in control of how everything in translated.
Weblate is the place where translations happen, it is the GitLab of
languages for the F-Droid community.

We as a community need to avoid putting too much maintenance work on a
few people so we can keep our "bus factor" high enough to survive all
things that come our way.  People often request that F-Droid handle
the localization of their app, but that would centralize the work in a
place where it is much harder to share the workload.  So app graphics
or localized texts should be handled by the upstream app developer as
much as possible, instead of sticking everything into _fdroiddata_.

That said, there are some apps with localized metadata in
_fdroiddata_.  The graphics and descriptions were added there to get
things started when the metadata localization was first rolled out.
Now that we have hundreds of apps that manage their own localization,
we can move all that upstream as well.

We have also started a project to provide a translated 80-character
summary for all apps in the archive.  So if upstream developers are
not willing to manage the localization, F-Droid can at least have this
key piece translated so that users can see screens in only their
language when navigating the Android client and website.  That you can
see on
[fdroiddata-localizations](https://gitlab.com/fdroid/fdroiddata-localizations).
I am currently managing that, but would love to increase our bus
factor by getting more maintainers involved there.  At this point, it
is mostly a matter of running some syncing scripts, and checking to
make sure the scripts did not do anything stupid.
