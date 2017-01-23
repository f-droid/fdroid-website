---
layout: page
title: Deterministic, Reproducibile Builds
permalink: /docs/Deterministic,_Reproducible_Builds
---

If projects have deterministic build systems that reproduce the exact
same APK whenever and wherever its built, then there will no longer be a
need for the FDroid per-app signing key. FDroid will be able to build
the exact same APK, then it can copy the original developer's signature
out of the APK they produce, and it will verify. Ideally, the
FDroid-generated APK will have the exact same hash as well.


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


### General Plan

#### short term

1.  get Lil' Debi's build to be deterministic
2.  download Guardian Project's APK from link in recipe
3.  make it verify as part of `fdroid publish`
4.  verify against Guardian Project GPG signature in recipe
5.  sign Guardian Project APK using FDroid's GPG key
6.  install Guardian Project APK in FDroid repo

Open question: how to migrate users to new signing key?

#### long term

1.  get Lil' Debi's build to be deterministic
2.  make it produce the exact same APK, minus signature
3.  copy signature from Guardian Project's APK, included in build recipe
4.  use FDroid APK with Guardian Project's APK signature
5.  sign FDroid APK with FDroid's GPG key
6.  merge FDroid's GPG signature with Guardian Project's GPG signature
    (if the cipher prefs are the same, gpg will check multiple
    signatures in a single .sig or .asc file


#### TODO

-   `faketime <timestamp> ant clean release`
-   jar sort order for APKs
-   faketime integrated into FDroid build?
-   `aapt` versions produce different results (XML and res/ subfolder names)


#### Sources

- <https://gitlab.com/fdroid/fdroidserver/commit/8568805866dadbdcc6c07449ca6b84b80d0ab03c>
- [Verification Server](Verification_Server)
- <https://reproducible-builds.org>
- <https://wiki.debian.org/ReproducibleBuilds>
- <https://gitian.org/>
