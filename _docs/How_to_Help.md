---
layout: page
title: How to Help

---

The project is entirely developed and maintained by volunteers. You can
help in the following ways:


### Follow our work

The [Feeds](../Feeds) page lists the various sites that we work
on.


### Report problems

If you experience problems with the site or client software, you can
report them in the [issue tracker](https://gitlab.com/u/fdroid), discuss
them in the [Forum](https://forum.f-droid.org/), on [Matrix](https://matrix.to/#/#fdroid:f-droid.org) or on IRC
([#fdroid on OFTC](https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1)).
Take a look at the [Repository Maintenance](https://monitor.f-droid.org/builds)
page to see how you can help keeping apps and their metadata up to
date.

If you are reporting an issue with the client,
[check out these pointers](../Client_Bug_Reports) to make sure we have
the best chance of reproducing and fixing your issue.


### Submit applications

If you see an application missing from the repository that fits with
the [Inclusion Policy](../Inclusion_Policy)), then
[you can add that application](../Submitting_to_F-Droid_Quick_Start_Guide)
via a merge request.  Otherwise, to make a simple request, go to the
dedicated
[Requests for Packaging](https://gitlab.com/fdroid/rfp/issues)
tracker.

Metadata may already be found there but it can always be improved. Often
developers don't mark their releases well: you can ask them to use tags
via an issue on their tracker, which will allow us to use an automatic
check for new versions (and you can suggest a donation method while
you're about it!). Another common task is the comparison of included
libraries with official versions.

If you have the technical skills required, you can also put together
the relevant metadata and submit a merge request to the git
repository, which should speed up the inclusion of the
application. See the
[sticky thread](https://f-droid.org/forums/topic/adding-apps-with-git/)
at the top of that forum for more information.


### Update apps

The procedure for updating apps is similar to adding new apps: changes
are applied to the metadata in the fdroiddata git repository. You'll
need to already be familiar with adding new apps. Even though it should
take much less time to update an app one should still be cautious.
Follow the steps in the [update guide](../How_to_update_an_app)
to minimize the risk of messing up and don't be afraid to ask for help!


### Add information about no longer maintained apps

At the beginning of the app's description in metadata (provided Description is held on our end), insert a paragraph saying

```
NOTE: This app is no longer maintained.
```

Optionally link "no longer maintained" to where that statement is found (if not directly on the app's Readme/Website). Or add "(its repo has been archived)" – whichever fits. If the repo is gone altogether, instead remove the entries for `RepoType` and `RepoURL`, and at the very end of the metadata YAML add a line saying `NoSourceSince: 0.1.2` (where 0.1.2 should be the versionName of the last build available) – this will automatically translate into an AntiFeature and thus be displayed prominently.
In the end make that an MR.


### Translate

The client application is available in many languages, but if yours is
not included, or if it needs updating or improving, follow
[these instructions](https://hosted.weblate.org/engage/f-droid/).

The web site, this wiki , and app descriptions are not covered yet, but
will be included in the same system at a later date.

There's a
[dedicated forum section](https://forum.f-droid.org/c/translation)
for discussions about translation.


### Help with development

There are three git repositories hosted at GitLab, as follows:

-   Android client application -
    <https://gitlab.com/fdroid/fdroidclient>
    Issues suitable for new contributors are tagged
    [help-wanted](https://gitlab.com/fdroid/fdroidclient/issues?label_name=help-wanted)
-   Server tools, for the tools for running a repository and
    building/installing applications locally -
    <https://gitlab.com/fdroid/fdroidserver>
-   Metadata files for applications in the main F-Droid repository -
    <https://gitlab.com/fdroid/fdroiddata>

The easiest way to contribute to development is to make clones of these
projects and submit merge requests. If you are making large changes, it
would be good to discuss them on IRC or in the forum first, to ensure
they fit with the direction of the project, and do not clash with or
duplicate work already in development.

For working with the server project, it's a good idea to read
[the docs](http://f-droid.org/docs/) and learn our
[git workflow](https://f-droid.org/wiki/page/git_workflow).

### Help with Infrastructure

F-Droid provides multiple servers (builders, web portal, download areas...) which need regular maintenance, Ansible-based deployment, and hardware management.
Further information can be found by asking on [Matrix](https://matrix.to/#/#fdroid-dev:f-droid.org), [IRC](https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1) (#fdroid-dev on OFTC) or team@f-droid.org.

### Design

We'd love any contributions to make the project prettier and easier to
use. If you are good at writing we are working on improving the
[Home page](https://f-droid.org/wiki/page/Home_page). If you can design mockups the client
developers could use your help. Post them to the issue tracker for
[client](https://gitlab.com/fdroid/fdroidclient/issues) or the
[website](https://gitlab.com/fdroid/fdroid-website/issues).
