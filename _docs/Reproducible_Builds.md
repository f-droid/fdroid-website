---
layout: page
title: Reproducible Builds

---


F-Droid supports [reproducible builds](https://reproducible-builds.org) of apps,
so that anyone can run the build process again and reproduce the same APK as the
original release.  This means that F-Droid can verify that an app is 100% free
software while still using the original developer's APK signatures.  F-Droid
verifies reproducible builds using APK [signature copying](#reproducible-signatures).

This concept is occasionally called "deterministic builds".  That is a much
stricter standard: that means that the whole process runs with the same ordering
each time.  The most important thing is that anyone can run the process and end
up with the exact same result.


### How it is implemented as of now

Publishing signed binaries (APKs) from elsewhere (e.g. the upstream developer)
is now possible after verifying that they match ones built using an fdroiddata
recipe.  Publishing only takes place if there is a proper match.  This procedure
is implemented as part of `fdroid publish`.  The reproducibility check at the
publishing step follows this logic:

![Flow-chart for reproducibility check]({% asset docs/reproducible-builds/publish.png %})


#### Publish both (upstream) developer-signed and F-Droid-signed APKs

This approach allows publishing both APKs signed by the (upstream) developer and
APKs signed by F-Droid.  This enables us to ship updates for users who installed
apps from other sources than F-Droid (e.g. Play Store), while also shipping
updates for apps which were built and signed by F-Droid.

This requires extracting and adding (upstream) developer signatures to
fdroiddata.  These signatures are then later copied to the unsigned APK built
from the fdroiddata recipe.  We provide a command for easily extracting
signatures from APKs:

```console
$ cd /path/to/fdroiddata
$ fdroid signatures F-Droid.apk
```

Instead of local files, you can also supply HTTPS URLs to `fdroid signatures`.

The signature files are extracted to the app's metadata directory, ready to be
used with `fdroid publish`.  A signature consists of 2-6 files: a v1 signature
(manifest, signature file, and signature block file) and/or a v2/v3 signature
(APK Signing Block and offset); if the APK was v1-signed with e.g.
`signflinger` instead of `apksigner` there will also be a `differences.json`.
The result of extracting one will resemble these file listings:

```console
$ ls metadata/org.fdroid.fdroid/signatures/1000012/  # v1 signature only
CIARANG.RSA  CIARANG.SF  MANIFEST.MF
$ ls metadata/your.app/signatures/42/                # v1 + v2/v3 signature
APKSigningBlock  APKSigningBlockOffset  MANIFEST.MF  YOURKEY.RSA  YOURKEY.SF
```

If you don't want to install `fdroidserver` (or have an older version that
doesn't support extracting v2/v3 signatures yet) you can also use
[`apksigcopier`](https://github.com/obfusk/apksigcopier) (available in e.g.
Debian, Ubuntu, Arch Linux, NixOS) instead of `fdroid signatures`:

```console
$ cd /path/to/fdroiddata
$ APPID=your.app VERSIONCODE=42
$ mkdir metadata/$APPID/signatures/$VERSIONCODE
$ apksigcopier extract --v1-only=auto Your.apk metadata/$APPID/signatures/$VERSIONCODE
```


#### Exclusively publishing (upstream) developer-signed APKs

For this approach, everything in the metadata should be the same as normal, with
the addition of the `Binaries:` directive to specify where to get the binaries
(APKs) from.  In this case, F-Droid will never attempt to publish APKs signed by
F-Droid.  If `fdroid publish` can verify that the downloaded APK matches the one
built from the fdroiddata recipe, the downloaded APK will be published.
Otherwise F-Droid will skip publishing this version of the app.

Here is an example of a `Binaries:` directive:

```yaml
Binaries: https://example.com/path/to/myapp-%v.apk
```

See also: [Build Metadata Reference - Binaries](../Build_Metadata_Reference/#Binaries)


### Reproducible signatures

F-Droid verifies reproducible builds using the
[APK signature](https://source.android.com/docs/security/features/apksigning)
(a form of [embedded signature](https://reproducible-builds.org/docs/embedded-signatures/)),
which requires [copying](https://github.com/obfusk/apksigcopier) the signature
from a signed APK to an unsigned one and then checking if the latter verifies.
The old v1 (JAR) signatures only cover the *contents* of the APK (e.g. ZIP
metadata and ordering are irrelevant), but v2/v3 signatures cover *all other
bytes in the APK*.  Thus, the APKs must be completely identical *before* and
*after* signing (apart from the signature) in order to verify correctly.

Copying the signature uses the same algorithm that `apksigner` uses when signing
an APK.  It is therefore important that (upstream) developers do the same when
signing APKs, ideally by using `apksigner`.


### Verification builds

Many people or organizations will be interested in reproducing builds to make
sure that the f-droid.org builds match the original source and nothing has been
modified.  In that case, the resulting APKs are not published for installation.
The [Verification Server](../Verification_Server) automates this process.


### Reproducible Builds

Quite a few builds already verify with no extra effort since Java code is often
compiled into the same bytecode by a wide range of Java versions.  The Android
SDK's `build-tools` will create differences in the resulting XML, PNG, etc.
files, but this is usually not a problem since the `build.gradle` includes the
exact version of `build-tools` to use.

Anything built using the NDK will be much more sensitive.  For example, even for
builds that use the exact same version of the NDK (e.g. `r13b`) but on different
platforms (e.g. macOS versus Ubuntu), the resulting binaries will have
differences.

Additionally, we'll have to look out for anything that includes timestamps or
build paths, is sensitive to sort order, etc.

Google is also working towards reproducible builds of Android apps, so using
recent versions of the Android SDK helps.  One specific case is starting with
Gradle Android Plugin v2.2.2, timestamps in the APK file's ZIP metadata are
automatically zeroed out.


### Reproducible APK tools

The scripts from
[reproducible-apk-tools](https://github.com/obfusk/reproducible-apk-tools)
(available in fdroiddata as a `srclib`) may help to make builds reproducible,
e.g. by fixing newlines (CRLF vs LF) or making ZIP ordering deterministic, if
removing the cause of the differences is not a realistic option.  Depending on
specifics, these scripts need to be used by upstream developers before signing
their APKs, by the fdroiddata recipe, or both.

Originally created to inject non-determinism in build processes,
[disorderfs](https://salsa.debian.org/reproducible-builds/disorderfs) can also
do the opposite: make reading from the filesystem deterministic.  In some cases
this can make e.g. `resources.arsc` reproducible.  Here is an example from an
existing recipe:

```console
$ mv my.app my.app_underlying
$ disorderfs --sort-dirents=yes --reverse-dirents=no my.app_underlying my.app
```


### Potential sources of unreproducible builds

There are various ways builds can be unreproducible.  Some are relatively easy
to avoid, others are hard to fix.  We've tried to list some common sources
below.

See also [this gitlab issue](https://gitlab.com/fdroid/fdroiddata/-/issues/2816).


#### Bug: Android Studio builds have non-deterministic ZIP ordering

[Non-deterministic order of ZIP entries in APK makes builds not reproducible](https://issuetracker.google.com/issues/265653160)
(may require a Google account to view).

NB: this should be fixed in Android Gradle plugin
(`com.android.tools.build:gradle` / `com.android.application`) `7.1.X` and
later.

When building APKs with Android Studio, the ordering of the ZIP entries in the
APK can be different from that of APKs built by invoking `gradle` directly,
affecting reproducibility; the ordering can be completely non-deterministic,
even differing between different builds of the same source code.

A workaround for older versions is to invoke `gradle` directly (as during
F-Droid or CI builds), bypassing Android Studio:

```console
$ ./gradlew assembleRelease
```

NB: depending on your signing configuration, this may require signing the APK
with `apksigner` afterwards, since signing is not performed by Android Studio in
this case.


#### Bug: baseline.profm not deterministic

[Non-stable `assets/dexopt/baseline.profm`](https://issuetracker.google.com/issues/231837768)
(may require a Google account to view).

See also [this writeup of workarounds](https://gist.github.com/obfusk/61046e09cee352ae6dd109911534b12e).


#### Bug: coreLibraryDesugaring not deterministic

NB: this should be fixed in R8 (`com.android.tools:r8`) `3.0.69` and later.

In some cases builds are not reproducible due to a
[bug in `coreLibraryDesugaring`](https://issuetracker.google.com/issues/195968520)
(may require a Google account to view); this
[affected NewPipe](https://github.com/TeamNewPipe/NewPipe/issues/6486).


#### Bug: line ending differences between Windows and Linux builds

[Newline differences between building on Windows vs Linux make builds not reproducible](https://issuetracker.google.com/issues/266109851)
(may require a Google account to view).

A workaround is to run
[`fix-newlines.py`](https://github.com/obfusk/reproducible-apk-tools#fix-newlinespy)
on the *unsigned* APK with the "wrong" line endings to change them from LF to
CRLF (or vice versa w/ `--from-crlf`) and `zipalign` it again afterwards.


#### Concurrency: reproducibility can depend on the number of CPUs/cores

This can affect `.dex` files (though that seems to be rare) or native code (e.g.
Rust).

Using only 1 CPU/core as a workaround:

```console
export CPUS_MAX=1
export CPUS=$(getconf _NPROCESSORS_ONLN)
for (( c=$CPUS_MAX; c<$CPUS; c++ )) ; do echo 0 > /sys/devices/system/cpu/cpu$c/online; done
```

NB: this workaround affects the entire machine, so using it in a non-persistent
virtual machine or container is recommended.

For Rust code, you can set [`codegen-units = 1`](https://doc.rust-lang.org/rustc/codegen-options/index.html#codegen-units).

See also [this gitlab issue](https://gitlab.com/fdroid/rfp/-/issues/1519#note_1226216164).


#### Embedded build paths

Embedded [build paths](https://reproducible-builds.org/docs/build-path/) are a
source of reproducibility issues affecting apps built with e.g. Flutter,
python-for-android, or using native code (e.g. Rust, C/C++, any kind of
`libfoo.so`).  Apps completely written in Java and/or Kotlin tend to be
unaffected.

Often, the easiest solution is to always use the same working directory when
building; e.g. `/builds/fdroid/fdroiddata/build/your.app.id` (F-Droid CI),
`/home/vagrant/build/your.app.id` (F-Droid build server), or `/tmp/build`.

NB: using a subdirectory of the world-writeable `/tmp` can have security
implications (on multi-user systems).


#### Embedded timestamps

Embedded [timestamps](https://reproducible-builds.org/docs/timestamps/) are the
most common source of reproducibility issues and are best avoided.

##### AboutLibraries Gradle plugin

You can prevent this plugin (`com.mikepenz.aboutlibraries.plugin`) from adding a
timestamp to the JSON file it generates by adding this to `build.gradle`:

```gradle
aboutLibraries {
    // Remove the "generated" timestamp to allow for reproducible builds
    excludeFields = ["generated"]
}
```

For `build.gradle.kts`, add this instead:

```kts
aboutLibraries {
    // Remove the "generated" timestamp to allow for reproducible builds
    excludeFields = arrayOf("generated")
}
```


#### Native library stripping

It seems that the stripping of native libraries, e.g. `libfoo.so`, can cause
intermittent reproducibility issues.  It is important to use the exact NDK
version when rebuilding, e.g. `r21e`.  Disabling stripping can sometimes help.
Gradle seems to strip shared libraries by default, even the app is receiving the
shared libraries via an AAR library.  Here is how to disable it in Gradle:

```gradle
android {
    packagingOptions {
        doNotStrip '**/*.so'
    }
}
```


#### NDK _build-id_

On different build machines, different NDK paths and different paths to the
project (and thus to its `jni` directory) are used.  This leads to different
paths to the source files in debug symbols, causing the linker to generate a
different _build-id_, which is preserved after stripping.

One possible solution is adding `-Wl,--build-id=none` to link options which
will disable _build-id_ generation completely. For `ndk-build`, `LOCAL_LDFLAGS += -Wl,--build-id=none`
can be added to `Android.mk` files. For cmake versions since 3.13, `add_link_options(LINKER:--build-id=none)`
can be added to `CMakeLists.txt` globally. For cmake versions before 3.13,
`target_link_libraries(<target> -Wl,--build-id=none)` can be used instead for
every target.


#### NDK hash style

On different build machines, NDK may use different hash style. Setting the hash style explicitly can fix this problem. For cmake versions since 3.13, `add_link_options(LINKER:--hash-style=gnu)`
can be added to `CMakeLists.txt` globally.


#### _platform_ Revisions

In 2014, the Android SDK tools
[were changed](https://issuetracker.google.com/issues/37132313) to
[stick two](https://android.googlesource.com/platform/frameworks/base/+/ad2d07d%5E!/)
[data elements](https://android.googlesource.com/platform/frameworks/base/+/5283fab%5E!/)
in `AndroidManifest.xml` as part of the build process:
`platformBuildVersionName` and `platformBuildVersionCode`.
`platformBuildVersionName` includes the "revision" of the _platform_ package
built against (e.g. `android-23`), however different "revisions" of the same
_platform_ package cannot be installed in parallel.  Plus the SDK tools do not
support specifying the required revision as part of the build process.  This
often results in an otherwise reproducible build where the only difference is
the `platformBuildVersionName` attribute.

The _platform_ is part of the Android SDK that represents the standard library
that is installed on the phone.  They have two parts to their version: "version
code", which is an integer that represents the SDK release, and the "revision",
which represents bugfix versions to each platform.  These versions can be seen
in the included `build.prop` file.  Each revision has a different number in
`ro.build.version.incremental`.  Gradle has no way to specify the revision in
`compileSdkVersion` or `targetSdkVersion`.  Only one `platform-23` can be
installed at a time, unlike `build-tools`, where every release can be installed
in parallel.

Here are two examples where all the differences are suspected to come from
different revisions of the platform:

* https://verification.f-droid.org/de.nico.asura_12.apk.diffoscope.html
* https://verification.f-droid.org/de.nico.ha_manager_25.apk.diffoscope.html


#### PNG Crush/Crunch

A standard part of the Android build process is to run some kind of PNG
optimization tool, like `aapt singleCrunch`, `pngcrush`, `zopflipng` or
`optipng`.  These do not provide deterministic output, it is still an open
question as to why.  Since PNGs are normally committed to the source repo, a
workaround to this problem is to run the tool of your choice on the PNG files,
then commit those changes to the source repo (e.g. `git`).  Then, disable the
default PNG optimization process by adding this to `build.gradle`:

```gradle
android {
    aaptOptions {
        cruncherEnabled = false
    }
}
```

Note that tools such as `svgo` can do similar optimization to SVG files.


#### PNGs generated from vector drawables

[Android Gradle plugin generates PNG resources from vector drawables for old Android versions](https://developer.android.com/reference/tools/gradle-api/7.3/com/android/build/api/dsl/VectorDrawables#generateddensities).
Unfortunately, the generated PNG files are not reproducible.

You can disable generating the PNGs by adding this to `build.gradle`:

```gradle
android {
    defaultConfig {
        vectorDrawables.generatedDensities = []
    }
}
```


#### R8 Optimizer

It appears that some R8 optimizations are non-deterministic, producing different
bytecode on different build runs.

For instance, R8 tries to optimize `ServiceLoader` usage making a static list of
all services in the code.  The order of this list may be different (or even
incomplete) on each build run.  The only way to avoid this behavior is disabling
such optimizations declaring optimized classes in `proguard-rules.pro`:

```
-keep class kotlinx.coroutines.CoroutineExceptionHandler
-keep class kotlinx.coroutines.internal.MainDispatcherFactory
```

Be careful with R8.  Always test your builds multiple times and disable
optimizations which produce non-deterministic output.


#### Resource Shrinker

It's possible to reduce the APK file size by removing unused resources from the
package.  This is useful when a project depends on some bloated libraries such
as AppCompat, especially when R8/ProGuard code shrinking is used.

However, it might be possible that resource shrinker will increase the APK size
on different platforms, especially if there are not many resources to shrink, in
which case the original APK will be used instead of the shrunk one
(non-deterministic behavior of Gradle plugin).  Avoid using resource shrinker
unless it decreases the APK file size significantly.


#### ZIP metadata

APKs use the ZIP file format, which was originally designed around the MSDOS FAT
filesystem.  UNIX file permissions were added as an extension.  APKs only need
the most basic ZIP format, without any of the extensions.  These extensions are
often stripped out in the final release signing process.  But the APK build
process can add them.  For example:

```diff
--- a2dp.Vol_137.apk
+++ sigcp_a2dp.Vol_137.apk
@@ -1,50 +1,50 @@
--rw----     2.0 fat     8976 bX defN 79-Nov-30 00:00 AndroidManifest.xml
--rw----     2.0 fat  1958312 bX defN 79-Nov-30 00:00 classes.dex
--rw----     1.0 fat    78984 bx stor 79-Nov-30 00:00 resources.arsc
+-rw-rw-rw-  2.3 unx     8976 b- defN 80-000-00 00:00 AndroidManifest.xml
+-rw----     2.4 fat  1958312 b- defN 80-000-00 00:00 classes.dex
+-rw-rw-rw-  2.3 unx    78984 b- stor 80-000-00 00:00 resources.arsc
```


### Migration to reproducible builds

#### TODO

* jar sort order for APKs
* `aapt` versions produce different results (XML and res/ subfolder names)


#### Sources

* <https://gitlab.com/fdroid/fdroidserver/commit/8568805866dadbdcc6c07449ca6b84b80d0ab03c>
* [Verification Server](../Verification_Server)
* <https://verification.f-droid.org>
* <https://reproducible-builds.org>
* <https://wiki.debian.org/ReproducibleBuilds>
* <https://gitian.org/>
* [Google Issue #70292819 platform-27\_r01.zip was overwritten with a new update](https://issuetracker.google.com/issues/70292819) (_Google login and JavaScript required_)
* [Google Issue #37132313 platformBuildVersionName makes builds difficult to reproduce, creates unneeded diffs](https://issuetracker.google.com/issues/37132313) (_Google login and JavaScript required_)
* [Google Issue #110237303 resources.arsc built with non-determism, prevents reproducible APK builds](https://issuetracker.google.com/issues/110237303) (_Google login and JavaScript required_)
* [Unreproducible/non-deterministic code generation by navigation.safeargs.kotlin](https://issuetracker.google.com/issues/189498001) (_Google login and JavaScript required_)
* [unneeded DEX code differences based on number of CPUs used in build process](https://issuetracker.google.com/issues/269181868)  (_Google login and JavaScript required_)
