---
layout: page
title: Inclusion Policy

---

All applications in the repository must be Free, Libre and Open Source
software – for example, released under a GPL or Apache license. Every
effort is made to verify that this is actually the case, both by visual
inspection of the source, and by building the application from the
published source. If in doubt about a license, please refer to the [GNU
license list](https://www.gnu.org/licenses/license-list.html).

For software to be FLOSS, the software in its entirety must be so -
including all libraries and dependencies used. Additionally, it must be
buildable with only FLOSS tools.

Notably:

-   We cannot build apps using Google's proprietary "play-services".
    Please talk to upstream about an untainted build flavor (either
    using microg or removing Non-Free dependencies completely).
-   We cannot build apps using proprietary tracking/analytic
    dependencies like Crashlytics and Firebase. Please talk to upstream
    about an untainted build flavor (either using a FLOSS analytics
    software like ACRA or by removing Non-Free dependencies completely).
-   We cannot build apps using proprietary ad libraries. We have nothing
    against advertisments (see [_AntiFeatures_](https://f-droid.org/wiki/page/Antifeatures)),
    but they must be provided by a FLOSS compatible way.
-   We cannot build apps requiring Non-Free buildtools, including
    Oracle's JDK or some pre-release toolchains.

Additionally:

-   The source code for the application must be maintained in a publicly
    accessible Version Control System which we have support for (git,
    hg, svn, bzr), and the source code needs to be maintained in an up
    to date state.
-   The software should not download additional executable binary
    files (e.g. Non-Free addons, auto-updates, etc).
-   The software should use its own unique Android package ID. Where the
    application is a fork of another (even one not included in the
    F-Droid repository) it must have a new ID, different from
    the original. Make sure to rename your fork accordingly (including
    all active translations). Forks which only re-brand an app but do
    not add value for users might not get accepted.
-   Although not ideal, "non-functional" assets (e.g. artwork) *may* be
    acceptable under less permissive licenses than functional code - an
    example would be artwork assets that are licensed only for use with
    that particular game. In any case though, they must be included
    under some kind of license, and not be copyright violations.
-   Trademarks must not be infringed, and any other legal requirements
    must be adhered to.
-   F-Droid does not sign up for any API keys. Even if provided by a
    third party, we include them in both, binary and
    sourcecode releases.
-   Binary dependencies such as JAR files have to be replaced by
    source-built versions or used from a trusted repository
    (see manual).

Ideally:

-   Releases should be clearly tagged (or otherwise marked).

Some software, while being Free and Open Source, may engage in practices
which are undesirable to some or all users. Where possible, we still
include these applications in the repository, but they are flagged with
the appropriate [_Anti-Features_](../Anti-Features). Even though
such software can be included, when appropriately flagged, it is
frequently the case that other "FLOSS" software with these features is
actually not entirely free. For example, advertising and spying on user
is often enabled via proprietary binary libraries which we cannot
include.

When including donation information, the relevant donation links (e.g. Bitcoin/
PayPal/Flattr/etc) must also be available either:

-   In a README or similar file in the projects source code.
-   On the applications main website.
-   If the software is hosted on GitLab, then it is sufficient that the
    person requesting donation info to be added to the fdroiddata repository
    is the same user account which manages the application source code.

This is to prevent arbitrary people from maliciously changing the donation links of
applications in the main F-Droid repository without the consent of upstream developers.

For more information on adding applications to the F-Droid Repository,
see the [Inclusion How-To](../Inclusion_How-To).
