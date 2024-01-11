---
layout: page
title: Contribute
permalink: /contribute/
---
The project is developed and maintained by community contributors. Volunteers form a core part of F-Droid.  You can help too:

### Help Others

If you already know something about F-Droid, then you can help others learn and
get started.  Help answer questions that users and developers have about
F-Droid!  Please be considerate of our [code of conduct]({{ site.baseurl
}}/docs/Code_of_Conduct).  We want to provide a positive and enjoyable
environment for everybody.

### Report Problems

If you experience problems with the site or client software, you can report them
in [the appropriate issue tracker]({{ "/issues/" | prepend: site.baseurl }}),
talk with us in the [Forums](https://forum.f-droid.org/) or join [the chat]({{ site.baseurl }}/about/#contact)
via your protocol of choice.
We also welcome help managing our issue trackers, including asking follow-up
questions, reviewing merge requests, adding labels, and more.

### Submit Applications

If you see an application missing from the repository (after reading the
[inclusion policy](../docs/Inclusion_Policy)), please feel free to submit it via
the dedicated [Requests For Packaging](https://gitlab.com/fdroid/rfp/issues)
issue tracker.

If you have the technical skills required, you can also put together the
relevant metadata and
[submit that via the F-Droid Data repository](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md),
which will drastically speed up the inclusion of the application.

The same applies for helping to build newer versions of applications.

Further information can be found in [the documentation](../docs), or by asking
in [the chat]({{ site.baseurl }}/about/#contact).

### Translate

The client application is available in many languages. Should yours not be among
those, or be in need of updates or improvement, please create an account and use
the [translation system](https://hosted.weblate.org/projects/f-droid/) to make
your changes.

Start with the overview of
[Translation and Localization](../docs/Translation_and_Localization). There’s
also a [dedicated forum section](https://forum.f-droid.org/c/translation) for
translation related discussions.

### Test

Testing upcoming F-Droid releases is the best way to make sure that a new
release can do what you need it to do. And of course, if you report a problem to
us, then we know about it and can fix it! If you have a bug to report, see the
[issues page]({{ site.baseurl }}/issues/). One easy places to jump in is
reviewing translation updates on <https://staging.f-droid.org/>.

### Develop

There are four main git repositories hosted at GitLab:

- [Android client application](https://gitlab.com/fdroid/fdroidclient)
- [server tools](https://gitlab.com/fdroid/fdroidserver) for running a
repository and building or installing applications locally
- associated [metadata files for applications in the main F-Droid repository](https://gitlab.com/fdroid/fdroiddata)
- [website and documentation](https://gitlab.com/fdroid/fdroid-website)

The easiest way to contribute to development is to make clones of these projects
and submit merge requests. If you are making large changes, it would be good to
discuss them on IRC or in the forum first, to ensure they fit with the direction
of the project, and do not clash with or duplicate work already in development.

For working with the server and data projects, it’s a good idea to read
[the manual]({{ "/docs/" | prepend: site.baseurl }}).

### Maintain Infrastructure

F-Droid provides multiple servers (builders, web portal, download areas and
more) which need regular maintenance, Ansible-based deployment and hardware
management. Further information can be found by asking in
[the chat]({{ site.baseurl }}/about/#contact) or via e-mail to team@f-droid.org.

### Data Science

At its core, F-Droid is a giant collection of data about the apps we ship.
There are build logs, app metadata, source code, APK metadata, and more.
F-Droid also fits into the larger Android ecosystem, where there are even larger
pools of data to dive into.  We also have some metrics data that remains mostly
unexplored, and could reveal new insights in the F-Droid ecosystem.  One good
way to dive in is to try out [our APIs]({{ site.baseurl }}/docs/All_our_APIs/).
