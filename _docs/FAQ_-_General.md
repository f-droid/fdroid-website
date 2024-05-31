---
layout: page
title: FAQ - General

---

* Do not remove this line (it will not be displayed)
{:toc}

### Where should I ask questions?

We welcome all questions and have a few places to reach out to the
F-Droid community:

-   using the [forum or chat rooms](https://f-droid.org/about/#contact)
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
    trying to resolve. Check the open [merge
    requests](https://gitlab.com/fdroid/fdroiddata/-/merge_requests);
-   It's on our radar, but we haven't got to it yet. Search the
    [issues](https://gitlab.com/fdroid/rfp/-/issues);
-   We don't know about it. See the [Inclusion Policy](../Inclusion_Policy).

Otherwise if you think that an app respects the Inclusion Policy and
actually nobody is talking about it in the forum, you can try to be the
first to do it: See the [Inclusion How-To](../Inclusion_How-To).


### How can I keep track of new apps?

There are several ways of keeping up with new apps that are added:

-   The website sidebar shows the three most recent updates,
    as well as the three most recent additions
-   In the client, the "Latest" tab shows all the apps updated
    during the last two months that have good [descriptions and
    graphics](../All_About_Descriptions_Graphics_and_Screenshots)
-   If you don't mind a detailed and potentially noisy stream of
    information that also includes updates and other changes, you could
    subscribe to [this feed](https://gitlab.com/fdroid/fdroiddata/commits/master.atom)
-   In TWIF posts we talk about new apps and other news, you could
    subscribe to [this feed](https://f-droid.org/feed.xml).

We don't yet have a dedicated and user-friendly feed you can subscribe
to for new additions, but we welcome contributions to make this work better.


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
    their [Terms of Service (paragraph 4.5)](https://play.google.com/about/developer-distribution-agreement.html).


### How can I report bugs or request features?

Use the [issue tracker](https://gitlab.com/fdroid/fdroidclient/issues)
or email <team@f-droid.org>. You can also discuss them in the [forum or chat rooms](https://f-droid.org/about/#contact).

If you do not already have an account, or do not want to create one,
you can use our reusable account.  The issue tracker works better if
reporters use an account that will receive notifications.  Issue
reports are usually a conversation, not just a single report.

That said, the account username is _fdroid-anyone_ and the
password is _fdroid does not track_.

Please note that we will have to remove this account, in case it gets abused.

