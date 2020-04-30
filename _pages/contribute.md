---
layout: page
title: Contribute
permalink: /contribute/
---
The project is entirely developed and maintained by volunteers. You can help:

### Report Problems

If you experience problems with the site or client software, you can report them in the issue tracker ([find the appropriate tracker on this page]({{ "/issues/" | prepend: site.baseurl }})), or discuss them in the [Forum](https://forum.f-droid.org/) or on IRC (#fdroid on freenode).

### Submit Applications

If you see an application missing from the repository (after reading the [inclusion policy](../docs/Inclusion_Policy)), please feel free to submit it via the dedicated [Requests For Packaging](https://gitlab.com/fdroid/rfp/issues) issue tracker.

If you have the technical skills required, you can also put together the relevant metadata and [submit that via the F-Droid Data repository](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md), which will drastically speed up the inclusion of the application.

The same applies for helping to build newer versions of applications.

Further information can be found in [the documentation](../docs), or by asking [on IRC](https://webchat.freenode.net/?channels=%23fdroid) (#fdroid on freenode).

### Translate

The client application is available in many languages. Should yours not be among those, or be in need of updates or improvement, please create an account and use the [translation system](https://hosted.weblate.org/projects/f-droid/) to make your changes.

Start with the overview of [Translation and Localization](../docs/Translation_and_Localization).  There’s also a [dedicated forum section](https://forum.f-droid.org/c/translation) for translation related discussions.

### Help with Development

There are four git repositories hosted at GitLab –
one for the [Android client application](https://gitlab.com/fdroid/fdroidclient),
one for the [server tools](https://gitlab.com/fdroid/fdroidserver) for running a repository and building/installing applications locally,
and one for the associated [metadata files for applications in the main F-Droid repository](https://gitlab.com/fdroid/fdroiddata).
The last repo is handling [website and documentation](https://gitlab.com/fdroid/fdroid-website).
The easiest way to contribute to development is to make clones of these projects and submit merge requests.
If you are making large changes,
it would be good to discuss them on IRC or in the forum first,
to ensure they fit with the direction of the project,
and do not clash with or duplicate work already in development.

For working with the server and data projects, it’s a good idea to read [the manual]({{ "/docs/" | prepend: site.baseurl }}).

### Help with Infrastructure

F-Droid provides multiple servers (builders, web portal, download areas...) which need regular maintenance, Ansible-based deployment, and hardware management.
Further information can be found by asking [on IRC](https://webchat.freenode.net/?channels=%23fdroid-dev) (#fdroid-dev on freenode) or team@f-droid.org.
