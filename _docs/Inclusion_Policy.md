---
layout: page
title: Inclusion Policy

---

All applications in the repository must be Free, Libre and Open Source
Software (FLOSS) – for example, released under a GPL or Apache
license. Every effort is made to verify that this is actually the
case, both by visual inspection of the source, and by building the
application from the published source.  To determine which licenses
are FLOSS, We defer to widely trusted organizations that have a proven
track record.  Specifically, we acknowledge these standards:
[DFSG](https://wiki.debian.org/DFSGLicenses),
[FSF](https://www.fsf.org/licensing),
[GNU](https://www.gnu.org/licenses/license-list.html), and
[OSI](https://opensource.org/licenses).

For software to be FLOSS, the software in its entirety must be so -
including all libraries and dependencies used. Additionally, it must be
buildable with only FLOSS tools.

Notably:

-   We cannot build apps using Google's proprietary "Play Services".
    Please talk to upstream about an untainted build flavor (either
    using microg or removing Non-Free dependencies completely).
-   We cannot build apps using proprietary tracking/analytic
    dependencies like Crashlytics and Firebase. Please talk to upstream
    about an untainted build flavor (either using a FLOSS analytics
    software like ACRA or by removing Non-Free dependencies completely).
-   We cannot build apps using proprietary ad libraries. We have nothing
    against advertisments (see [_Anti-Features_](../Anti-Features)),
    but they must be provided by a FLOSS-compatible way.
-   We cannot build apps requiring Non-Free build tools, including
    Oracle's JDK or some pre-release toolchains.

Additionally:

-   The source code for the application must be maintained in a publicly
    accessible Version Control System which we have support for (git,
    hg, svn, bzr), and the source code needs to be maintained in an up
    to date state.
-   The software must not download additional executable binary files (e.g.
    addons, auto-updates, etc.) without explicit user consent. Consent means it
    needs to be opt-in (it must not be harder to decline than to accept or
    presented in a way users are likely to press accept without reading) and
    structured in a way that clearly explains to users that they're choosing to
    bypass F-Droid's checks if they activate it.
-   The software should use its own unique Android
    "[Application ID](https://developer.android.com/studio/build/configure-app-module)"
    based on a domain name under the developer's control.  For example, if the
    app is in a group called "foo" on [gitlab.com](https://gitlab.com), then the domain name could
    be `io.gitlab.foo`.  It should not be based on someone's domain name,
    (e.g. `com.google.foo`).  Maven Central OSSRH provides [good
    guidance](https://central.sonatype.org/publish/requirements/coordinates/).
-   Where the
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
-   Binary dependencies such as JAR files have to be built from source
    or installed from Debian repos.

Ideally:

-   Releases should be clearly tagged (or otherwise marked).

Though we tried to build everything from source, we still need some prebuild binaries. Therefore we have some exceptions:

-   Trusted maven repository. While there is no guarantee that those binaries are
    free and correspondent to the source code, F-Droid allows the following known
    repositories currently:
    -   Maven Central - the original repo, hardcoded in Maven and Gradle.
    -   Google Maven Repo - hardcoded in Gradle, this repo hosts Google's own libs.
    -   JCenter - hardcoded in Gradle, this repo by Bintray tries to provide easier
        handling. It's synced with Maven Central, and include some extra libs. It's shutting down so please avoid this repo.
    -   OSS Sonatype - maintained by the people behind mavenCentral,
        this repository focuses on hosting services for open source
        project binaries. It's synced with Maven Central, and include some extra libs
    -   OSS JFrog - maintained by the people behind jCenter, this
        repository focuses on hosting services for open source project
        binaries.
    -   JitPack.io - builds directly from GitHub repositories.
        However, they do not provide any option to reproduce or verify
        the resulting binaries. Builds pre-release versions in
        some cases.
    -   Clojars - Clojure libraries repo.
    -   CommonsWare - repo holding a collection of open-source libs.
    -   Gradle plugin repo - hardcoded in Gradle, this repo hosts Gradle plugins.
-   Android SDK/NDK. They are released as proprietary binaries but we don't have an alternative currently. There is in-progress work to package recent Android SDK versions in Debian.
-   Gradle. Only some old versions of Gradle are packaged in Debian. Currently we download them from the developer website.
-   Flutter SDK. They are FOSS but not packaged in Debian and we are not able to built it from source. Currently we download them from the developer website with the Flutter srclib scripts.
-   JSC/Hermes. They can be built from source which takes hours. Currently we downloaded them from npm and scanignore them.
-   Binaries from pip wheels. Some apps install deps with pip and we just trust the untrustworthy Pypi.
-   Binaries from Nix cache. These binaries are mostly reproducible.
-   Rust/Rustup. Currently we download them from the developer website with the scripts in the rustup srclib. We may be able to use the Debian packages.
-   Golang & Nodejs. They are available in Debian but recent versions are not available immediately. Currently we might download them from the developer website.
-   Some other compilers/build tools not packaged in our Debian version.

Some software, while being Free and Open Source, may engage in practices
which are undesirable to some or all users. Where possible, we still
include these applications in the repository, but they are flagged with
the appropriate [_Anti-Features_](../Anti-Features). Even though
such software can be included, when appropriately flagged, it is
frequently the case that other "FLOSS" software with these features is
actually not entirely free. For example, advertising and tracking users
is often enabled via proprietary binary libraries which we cannot
include.

When including donation information, the relevant donation links (e.g.
Liberapay/OpenCollective/Bitcoin/etc) must also be available either:

-   In a README or similar file in the project's source code.
-   In a [_FUNDING.yml_](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/displaying-a-sponsor-button-in-your-repository#about-funding-files) file included in the project's source code.
-   On the applications main website.
-   If the software is hosted on GitLab, then it is sufficient that the
    person requesting donation info to be added to the fdroiddata repository
    is the same user account which manages the application source code.

This is to prevent arbitrary people from maliciously changing the donation links of
applications in the main F-Droid repository without the consent of upstream developers.

For more information on adding applications to the F-Droid Repository,
see the [Inclusion How-To](../Inclusion_How-To).
