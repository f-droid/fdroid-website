---
layout: page
title: FAQ - General

---

* Do not remove this line (it will not be displayed)
{:toc}

### Where should I ask questions?

We welcome all questions and have a few places to reach out to the
F-Droid community:

-   the IRC chat room: [\#fdroid](ircs://irc.oftc.net:6697/fdroid) IRC
    chatroom on OFTC ([click here to join the
    webchat](https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1))
-   the [web forum](https://forum.f-droid.org/)
-   [issue tracker](https://gitlab.com/fdroid/fdroidclient/issues) for
    the Android app itself (aka client)
-   [issue tracker](https://gitlab.com/fdroid/fdroidserver/issues) for
    the developer tools (aka server)
-   [issue tracker](https://gitlab.com/fdroid/rfp/issues) for
    packaging new apps
-   [issue tracker](https://gitlab.com/fdroid/fdroiddata/issues) for
    issues with published apps

### Why isn't my favourite app included?

Some common reasons:

-   It's not [Free Software](https://www.gnu.org/philosophy/free-sw.html);
-   We're trying to include it, but there's a problem with it that we're
    trying to resolve. Check the Submissions Held section of the Forum;
-   It's on our radar, but we haven't got to it yet.
    [Search](https://f-droid.org/search) the Forum;
-   We don't know about it. See the [Inclusion Policy](../Inclusion_Policy).

Otherwise if you think that an app respects the Inclusion Policy and
actually nobody is talking about it in the forum, you can try to be the
first to do it: See the [Inclusion How-To](../Inclusion_How-To).


### How can I keep track of new apps?

There are several ways of keeping up with new apps that are added:

-   In the sidebar on the web site, the 10 most recent apps are shown
-   In the client, the "What's New" category shows all apps added in the
    last 14 days (the number can be changed in settings)
-   If you don't mind a detailed and potentially noisy stream of
    information that also includes updates and other changes, you could
    subscribe to [this feed](https://gitlab.com/fdroid/fdroiddata/commits/master.atom)

We don't yet have a dedicated and user-friendly feed you can subscribe
to for new additions, but we welcome contributions to make this work better.


### What's the difference between source and binary builds?

In the client, each package for an app is labelled either 'source' or
'bin'. These correspond to two different messages you'll see for the
same package when browsing the repository on the web site, either "This
version is built and signed by F-Droid, and guaranteed to correspond to
the source tarball below" or "This version is built and signed by the
original developer."

Most packages are source builds. Those that are binaries are usually
that way for technical or historical reasons. Ideally everything in the
F-Droid repo would be a source build.

Source builds are built and signed securely by F-Droid, and are
accompanied on the web site by a complete and corresponding copy of the
exact source code we built it with. It may include some prebuilt
libraries and you may need to download some external libraries, but as
long as those libraries are still on the internet, you should be able to
build an exact copy.

Binary packages are built and signed by the developer. We get them from
public sources that the developer makes available directly, and never
from third party sources.


### Is your building and signing process secure?

The building and signing is done in an secure **offline** (i.e.
inaccessible from the internet) environment. Every package is built in a
completely fresh isolated virtual machine environment which is discarded
once the build is complete. Additionally, that build environment is
completely separated from the signing environment.

So yes, as far as we know, it's secure. However, as with everything else
on the site, bear in mind this is a small community project which you
are warned to use at your own risk. As with apps you get from elsewhere,
including Google Play, you should exercise caution regarding the
permissions they request when you install them. If in doubt, don't
install.


### Why isn't F-Droid on Google Play?

Pick your favourite reason (both are true and valid):

-   We don't use proprietary software: Google Play is proprietary
    software;
-   F-Droid, as an app that "competes" with Google Play, is against
    their [Terms of Service](http://play.google.com/about/developer-distribution-agreement.html#non-compete).


### How can I report bugs or request features?

Use the [issue tracker](https://gitlab.com/fdroid/fdroidclient/issues)
or email <team@f-droid.org>. You can also discuss them in the
[\#fdroid](ircs://irc.oftc.net:6697/fdroid) IRC chatroom on OFTC
([click here to join the webchat](https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1)).

If you do not already have an account, or do not want to create one,
you can use our reusable account.  The issue tracker works better if
reporters use an account that will receive notifications.  Issue
reports are usually a conversation, not just a single report.

That said, the account username is _fdroid-bug-reporter_ and the
password is _repository-collection_.
