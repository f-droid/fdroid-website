---
layout: page
title: Security Model

---

The security architecture is based on models proven by
[Debian](https://wiki.debian.org/SecureApt), [The Update
Framework](https://github.com/theupdateframework/tuf/blob/develop/docs/tuf-spec.txt)
, and others:

-   [HTTPS connections by default](https://gitlab.com/fdroid/fdroidclient/blob/v0.100.1/app/src/main/res/values/default_repo.xml#L11)
-   server only works over HTTPS, [HTTP](http://f-droid.org) is a redirect
-   [Android enforces](https://developer.android.com/studio/publish/app-signing.html#considerations) that all apps have a valid signature over the entire contents of the APK file 
-   [Android verifies updates](https://developer.android.com/studio/publish/app-signing.html#considerations) based on the signature of the installed app
-   [file integrity](https://gitlab.com/fdroid/fdroidclient/blob/v0.101-alpha2/app/src/main/java/org/fdroid/fdroid/installer/ApkCache.java#L57) protected by [signed metadata](https://gitlab.com/fdroid/fdroidclient/blob/v0.101-alpha2/app/src/main/java/org/fdroid/fdroid/RepoUpdater.java#L212)
-   signed metadata includes hashes of [the app](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L460) and its [signing key](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L558)
-   [signed metadata generated on a separate machine](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L989) (which is fully offline for f-droid.org and guardianproject.info)
-   [public key for verifying metadata signatures built into F-Droid
    client
    app](https://gitlab.com/fdroid/fdroidclient/blob/v0.100.1/app/src/main/res/values/default_repo.xml#L13)
-   signed metadata includes
    [timestamp](https://gitlab.com/fdroid/fdroidclient/commit/02b2090e530ab5d22b522d978728f34bb332b390)
    and
    [expiry](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L775)
-   easy Tor support via Settings

While the current setup is already a solid platform, we are implementing
a number of improvements:

-   The signed metadata will include list of official mirrors, then the
    client [chooses
    mirrors](https://gitlab.com/fdroid/fdroidclient/issues/35) based on
    availability and freshness based on local criteria like whether Tor
    is in use, closest on the internet, etc.
-   We are also moving the standard HTTP “etag” cache check from the
    server [to the
    client](https://gitlab.com/fdroid/fdroidclient/issues/562) so it
    cannot be abused to track users
-   [pinned TLS certificate built into the client
    app](https://gitlab.com/fdroid/fdroidclient/commit/0429b3f7dd4a6037fa11df64bfdd176ea378e6bf)

In order to defend against an attacker that holds the signing keys for
the app repository, there must be a trustworthy source of information to
compare against. Reproducible builds means that anyone with the same
source code will produce the exact same binary. When paired with an
auditing system, it is easy to catch malware inserted in the build
process, rather than the source code, like XCodeGhost. Reproducible
builds also makes it possible to have all builds of a release binary
have the exact same hash. Then any app repository can build apps only
from source code, and have a source of verification data from any other
app repository building the same app. Building software from source has
become cheap enough that many companies like gitlab.com and Travis CI
are offering free, automated build services in the cloud. Since the
whole F-Droid toolset is free software and designed to be easy to setup,
the barriers to setting up automatic auditing are quite low. People in
separate areas of the world with different risk profiles can run
verification servers to provide more trustworthy information.
