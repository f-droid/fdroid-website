---
layout: page
title: Reproducibile Builds
redirect_from:
 - '/wiki/page/Deterministic,_Reproducible_Builds/'

---


F-Droid supports
[reproducible builds](https://reproducible-builds.org) of apps, so
that anyone can run the build process again and reproduce the same APK
as the original release.  This means that F-Droid can verify that an
app is 100% free software while still using the original developer's
APK signatures.  Ideally, all of the built APKs will have the exact
same hash, but that is a more difficult standard with less payoff.
Right now, F-Droid verifies reproducible builds using the APK
signature.

This concept is occasionally called "deterministic builds".  That is a
much stricter standard: that means that the whole process runs with
the same ordering each time.  The most important thing is that anyone
can run the process and end up with the exact same result.


### How it is implemented as of now

Publishing signed binaries from elsewhere (e.g. the upstream developer)
is now possible after verifying that they match ones built using a
recipe. Everything in the metadata should be the same as normal, with
the addition of the `Binaries:` directive to specify
where (with pattern substitution) to get the binaries from.

Publishing only takes place if there is a proper match. (Which seems
very unlikely to be the case unless the exact same toolchain is used, so
I would imagine that unless the person building and signing the incoming
binaries uses fdroidserver to build them, probably the exact same
buildserver id, they will not match. But at least we have the
functionality to support that.)

This procedure is currently implemented as part of `fdroid
publish`. At the publish step, there are two options: a) sign
the built apk, or b) download a signed binary from elsewhere, compare it
with the built one, and if they match publish the downloaded (externally
signed) one. Option b) is enabled by having a
`Binaries:https://foo.com/path/to/myapp-0.1.apk`
directive in the metadata, to provide a URL where the binaries are to be
retrieved from (with substitutions for the version number in the APK
file name).


### Verification builds

Many people or organizations will only be interested in reproducing
builds to make sure that the f-droid.org builds match the original
source and nothing has been inserted in.  In that case, the resulting
APKs are not published for installation.  The
[Verification Server](../Verification_Server) automates this process.


### Reproducible Builds

An awful lot of builds already verify with no extra effort since Java
code is often compiled into the same bytecode by a wide range of Java
versions.  The Android SDK's _build-tools_ will create differences in
the resulting XML, PNG, etc. files, but this is usually not a problem
since the _build.gradle_ includes the exact version of _build-tools_
to use.

Anything built with the NDK will be much more sensitive.  For example,
even for builds that use the exact same version of the NDK
(e.g. _r13b_) but on different platforms (.e.g OSX version Ubuntu), the
resulting binaries will have differences.

Additionally, we'll have to look out for anything that includes
timestamping information, is sensitive to sort order, etc.

Google is also working towards reproducible builds of Android apps, so
using recent versions of the Android SDK helps.  One specific case is
starting with Gradle Android Plugin v2.2.2, timestamps in the APK
file's ZIP header are automatically zeroed out.


### Build Server IDs

To describe the build environment used by F-Droid builds, APKs have two files inserted into them:

* _META-INF/fdroidserverid_ - git commit hash of [_fdroidserver_](https://gitlab.com/fdroid/fdroidserver) used for the build
* _META-INF/buildserverid_ - git commit hash of [_makebuildserver_](https://gitlab.com/fdroid/fdroidserver/blob/master/makebuildserver) used for the build

To ensure reproducibility, use the exact same revision of the
`./makebuildserver` and `fdroid build`. You can find the commit hash
of _fdroidserver_ by going to your git clone and running `git log
-n1`.  The build server instance is stamped with the git commit hash on
creation, and that ID is included in builds.


### Migration to reproducible builds

#### TODO

- NDK inserts changing _build-id_, probably via `ld`
- jar sort order for APKs
- faketime integrated into F-Droid NDK builds?
- `aapt` versions produce different results (XML and res/ subfolder names)
- `faketime <timestamp> ant clean release` feasible?


#### Sources

- <https://gitlab.com/fdroid/fdroidserver/commit/8568805866dadbdcc6c07449ca6b84b80d0ab03c>
- [Verification Server](../Verification_Server)
- <https://verification.f-droid.org>
- <https://reproducible-builds.org>
- <https://wiki.debian.org/ReproducibleBuilds>
- <https://gitian.org/>
