---
layout: page
title: Reproducible Builds

---


### Introduction

F-Droid works to spread [reproducible builds](https://reproducible-builds.org/docs/definition/) across the free software Android ecosystem.  The goal is to enable software build processes that anyone can run repeatedly and reproduce the exact same APK as the original release.  Our work is focused on three main areas:

* Our [build environment](https://gitlab.com/fdroid/fdroidserver/-/tree/master/buildserver) is designed to make reproducing builds easy while being itself reproducible and auditable.
* We track issues in the build tools themselves that prevent reproducible builds, help the maintainers of the build tools fix these issues, and catalogue workarounds for app developers here in this web page.
* We help upstream app developers for any app shipped on <tt>f-droid.org</tt> fix issues with reproducible builds by providing developer support, filing issues and suggesting changes to the source code.

F-Droid verifies reproducible builds using APK [signature copying](#reproducible-signatures) against upstream build and our rebuild. To find out if an app can be reproducibly rebuilt by our own buildserver, check the "[Reproducibility Status](https://f-droid.org/packages/org.fdroid.fdroid/#reproducibility_status)" on any app's page on this website. This can help us identify factors changing over time.

The gold standard in reproducible builds for countering [Trusting Trust](https://www.cs.cmu.edu/~rdriley/487/papers/Thompson_1984_ReflectionsonTrustingTrust.pdf) issues is [Diverse Double-Compiling](https://dwheeler.com/trusting-trust/). The core idea is to use two entirely distinct sets of build tools to create the exact same binary.  This is a difficult standard to achieve, although quite valuable.  Some of the work to get there can be done incrementally.  Towards that end, F-Droid can reproduce the APKs that the upstream developer built on their own setup.  Often times, these are built with different toolchains or on different OSes.  To see which apps have enabled this approach, please check its [build metadata](https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/{packageName}.yml) for the presence of build metadata fields [`Binaries:`](https://f-droid.org/docs/Build_Metadata_Reference/#Binaries) or [`binary:`](https://f-droid.org/docs/Build_Metadata_Reference/#build_binary).

#### Reproducible signatures

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
signing APKs, ideally by using `apksigner` to make the signatures.  `apksigner` is also reproducibly built [in Debian](https://tests.reproducible-builds.org/debian/rb-pkg/trixie/amd64/android-platform-tools-apksig.html).

#### Verification builds

Many people or organizations will be interested in reproducing builds to make
sure that the f-droid.org builds match the original source and nothing has been
modified.  In that case, the resulting APKs are not published for installation.
The [Verification Server](../Verification_Server) automates this process.


#### Situation

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

### Publishing APKs with the upstream developer's signature

An application can be setup to publish the signed binaries from the upstream developer after verifying that they match the ones built using an _fdroiddata_ build recipe.  Publishing only takes place if there is a proper match. This means that F-Droid can verify that an app is free software while still using the original developer's APK signatures. This procedure is implemented as part of [`fdroid publish`](https://gitlab.com/fdroid/fdroidserver/-/blob/master/fdroidserver/publish.py).  The reproducibility check at the publishing step follows this logic:

![Flow-chart for reproducibility check]({% asset docs/reproducible-builds/publish.png %})

#### Exclusively publishing (upstream) developer-signed APKs

For this approach, everything in the metadata should be the same as normal, with the addition of the [`Binaries`](../Build_Metadata_Reference/#Binaries) or [`Builds.binary`](../Build_Metadata_Reference/#build_binary) directive to specify where to get the binaries (APKs) from, and [`AllowedAPKSigningKeys`](../Build_Metadata_Reference/#AllowedAPKSigningKeys) directive to ensure the expected signing key is used. In this case, F-Droid will never attempt to publish APKs signed by F-Droid.  If `fdroid publish` can verify that the downloaded APK matches the one built from the _fdroiddata_ recipe, the downloaded APK will be published. Otherwise F-Droid will skip publishing this version of the app.

#### Publish both (upstream) developer-signed and F-Droid-signed APKs

This approach allows publishing both APKs signed by the (upstream) developer and
APKs signed by F-Droid.  This enables us to ship updates for users who installed
apps from other sources than F-Droid (e.g. Play Store), while also shipping
updates for apps which were built and signed by F-Droid.

This requires extracting and adding (upstream) developer signatures to
_fdroiddata_.  These signatures are then later copied to the unsigned APK built
from the _fdroiddata_ recipe.  We provide a command for easily extracting
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

### Tools

#### Diffing the apk

We recommend using [`diffoscope`](https://diffoscope.org/) for easily
finding the difference between the reference APK provided by the app
developer and the APK that `fdroidserver` produced.

You can find the APK that `fdroidserver` produced either under e.g.
`fdroiddata/build/com.example.app/app/build/outputs/apk/prod/release/example-1.0.0-prod-release-unsigned.apk`
(when running locally) or in the pipeline artefacts (when using GitLab
CI).  Adjust the path accordingly (e.g. for flavours other than
`prod`).

#### Prioritising & fixing differences

[HOWTO: diff & fix APKs for Reproducible
Builds](https://gitlab.com/fdroid/wiki/-/wikis/HOWTO:-diff-&-fix-APKs-for-Reproducible-Builds)
on the F-Droid wiki has detailed information on the various kinds of
differences commonly encountered, which differences should usually be
prioritised when debugging, and how to fix common issues.

It also shows how to use various specialised tools that may provide
better results when `diffoscope` is not sufficient.

#### Reproducible APK tools

The scripts from
[reproducible-apk-tools](https://github.com/obfusk/reproducible-apk-tools)
(available in _fdroiddata_ as a `srclib`) may help to make builds reproducible,
e.g. by fixing newlines (CRLF vs LF) or making ZIP ordering deterministic, if
removing the cause of the differences is not a realistic option.  Depending on
specifics, these scripts need to be used by upstream developers before signing
their APKs, by the _fdroiddata_ recipe, or both.

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

See also [this GitLab issue](https://gitlab.com/fdroid/fdroiddata/-/issues/2816).


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


#### `apksigner` from build-tools >= 35.0.0-rc1 outputs unverifiable APKs

Using `apksigner` from build-tools version 34 produces APKs verifiable by `apksigcopier`, but newer versions will fail.
We are tracking this issue in [#3299](https://gitlab.com/fdroid/fdroiddata/-/issues/3299) and there's more info in
[apksigcopier issues 105](https://github.com/obfusk/apksigcopier/issues/105). Github Actions CI Ubuntu images starting
July 2024 have version 35 included, so one needs to manually select the `apksigner` version from 34 instead of the default
templated "latest version".


#### Bug: baseline.prof not deterministic

Sometimes the `baselin.prof` file is not reproducible. There are some possible workarounds:

1. Rerun the build until the file matches.
1. Use the same CPU core number as upstream.
1. Disable the baseline profile.
  Add this to `build.gradle`:

  ```groovy
  tasks.whenTaskAdded { task ->
      if (task.name.contains("ArtProfile")) {
          task.enabled = false
      }
  }
  ```

  or this to `build.gradle.kts`:

  ```kotlin
  tasks.whenTaskAdded {
    if (name.contains("ArtProfile")) {
        enabled = false
    }
  }
  ```

#### Bug: baseline.profm not deterministic

[Non-stable `assets/dexopt/baseline.profm`](https://issuetracker.google.com/issues/231837768)
(may require a Google account to view).

See also [this write-up of workarounds](https://gist.github.com/obfusk/61046e09cee352ae6dd109911534b12e).


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

See also [this GitLab issue](https://gitlab.com/fdroid/rfp/-/issues/1519#note_1226216164).


#### Embedded build paths

Embedded [build paths](https://reproducible-builds.org/docs/build-path/) are a
source of reproducibility issues affecting apps built with e.g. Flutter,
python-for-android, or using native code (e.g. Rust, C/C++, any kind of
`libfoo.so`).  Apps completely written in Java and/or Kotlin tend to be
unaffected.

Often, the easiest solution is to always use the same working directory when
building; e.g. `/builds/fdroid/fdroiddata/build/your.app.id` (F-Droid CI),
`/home/vagrant/build/your.app.id` (F-Droid build server), `/tmp/build` or
create one to mirror the upstream used folders, e.g. for macOS `/Users/runner`.

NB: using a subdirectory of the world-writeable `/tmp` can have security
implications (on multi-user systems).

If the SDK path ends up embedded in Flutter one can move the SDK to said path
in the recipe and configure it with: `flutter config --android-sdk <path>` as
setting `ANDROID_SDK_ROOT` might not be enough.

If the lib is not stripped properly, then debug info may be kept which usually has
many paths. Enable strip can remove them. This can be done by setting NDK version
correctly or pass `-s` to the linker. This can also be done manually, e.g., using
`llvm-strip`.

#### Embedded timestamps

Embedded [timestamps](https://reproducible-builds.org/docs/timestamps/) are the
most common source of reproducibility issues and are best avoided.


#### Native library stripping

It seems that the stripping of native libraries, e.g. `libfoo.so`, can cause
intermittent reproducibility issues.  It is important to use the exact NDK
version when rebuilding, e.g. `r21e`.  Disabling stripping can sometimes help.
Gradle seems to strip shared libraries by default, even the app is receiving the
shared libraries via an AAR library.  Here is how to disable it in Gradle:

```groovy
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

One possible solution is passing `--build-id=none` to the linker which
will disable _build-id_ generation completely.


#### NDK hash style

LLVM passes different defaults to linkers on different platforms. After
[this commit](https://github.com/llvm/llvm-project/commit/95dcaef00379e893dabc61cf598fe51c9d03414e#diff-061e3e32cfa3dd06717856cc16465106a3b72520eb9b0c2954513f194bd1696f)
was merged into the NDK, `--hash-style=gnu` will be used on Debian by default. To change
the hash style, `--hash-style=gnu` can be passed to the linker.


#### NDK clang version string in .comment section

Since NDK r26, the Clang version string in the comment section is different when building on MacOS and Linux, which looks like

```
Android (12027248, +pgo, -bolt, +lto, +mlgo, based on r522817) clang version 18.0.1 (https://android.googlesource.com/toolchain/llvm-project d8003a456d14a3deb8054cdaa529ffbf02d9b262)
```

due to different optimizations enabled for different platforms. The whole .comment section can be removed with

```console
objcopy --remove-section .comment <file>
```


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

* <https://verification.f-droid.org/de.nico.ha_manager_25.apk.diffoscope.html>
* <https://verification.f-droid.org/de.nico.asura_12.apk.diffoscope.html>


#### PNG Crush/Crunch

A standard part of the Android build process is to run some kind of PNG
optimization tool, like `aapt singleCrunch`, `pngcrush`, `zopflipng` or
`optipng`.  These do not provide deterministic output, it is still an open
question as to why.  Since PNGs are normally committed to the source repo, a
workaround to this problem is to run the tool of your choice on the PNG files,
then commit those changes to the source repo (e.g. `git`).  Then, disable the
default PNG optimization process by adding this to `build.gradle`:

```groovy
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

```groovy
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
incomplete) on each build run.  The only way to avoid this behaviour is disabling
such optimizations declaring optimized classes in `proguard-rules.pro`:

```proguard
-keep class kotlinx.coroutines.CoroutineExceptionHandler
-keep class kotlinx.coroutines.internal.MainDispatcherFactory
```

Be careful with R8.  Always test your builds multiple times and disable
optimizations which produce non-deterministic output.

If the DEX bytecode is different and depends on the number of CPU cores, try to update R8 to version 8.6.33, 8.7.20, 8.8 or newer as some issues were fixed in this regard.

#### DEX classes in wrong order

Even if the contents might match, if the classes file names are switched, reproducibility will fail. This was fixed for bundles in AGP 8.8 but we've seen this issue for APKs too. Try with the newer AGP first.

#### Resource Shrinker

It's possible to reduce the APK file size by removing unused resources from the
package.  This is useful when a project depends on some bloated libraries such
as AppCompat, especially when R8/ProGuard code shrinking is used.

However, it might be possible that resource shrinker will increase the APK size
on different platforms, especially if there are not many resources to shrink, in
which case the original APK will be used instead of the shrunk one
(non-deterministic behaviour of Gradle plugin).  Avoid using resource shrinker
unless it decreases the APK file size significantly.


#### VCS Info

Since Android Gradle Plugin 8.3, VCS info is generated by default and bundled in the
apk in `META-INF/version-control-info.textproto`, e.g.

```Proto
repositories {
  system: GIT
  local_root_path: "$PROJECT_DIR"
  revision: "3a443877cd53e37d85cbc52adc8cfd558919d373"
}
```

While we understand that developers build and test during their normal workflow, please upload
release APKs built after tagging, from a clean tree at the actual tagged commit (i.e. without
local changes or remaining artefacts from previous builds). Only in exceptional cases, when you
cannot do this, should `vcsInfo` be disabled (as this might otherwise cause problems), which can
be done as follows:

```groovy
    buildTypes {
        release {
           vcsInfo.include false
        }
    }
```


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

#### Mismatched Toolchains

Different toolchains may produce different binaries. A usual case is when more than one JDK version/distribution are used to build the APK. Sometimes even Gradle may mix
versions of JDKs to build an APK. To avoid such problems unused JDKs should be removed.

The APK diff will have entries in the `classes.dex` files like this, e.g. Java 17 vs Java 11:

```diff
-    .annotation system Ldalvik/annotation/Signature;
-        value = {
-            "()V"
-        }
-    .end annotation
```

Or like this, e.g. Java 17 vs Java 21:

```diff
-    .annotation system Ldalvik/annotation/MethodParameters;
-        accessFlags = {
-            0x8010
-        }
-        names = {
-            null
-        }
-    .end annotation
```

Different NDK versions also produce different binaries. Generally this can be recognized via the metadata, e.g. LLD version, in the native libs. However, since NDK r26d a weird behaviour is observed that sometimes only the `.shstrtab` sections in ELF of the native libs are changed when NDK is installed. The native libs may be built along with the app or fetched from maven repo. If AGP finds that the NDK is installed, it will use NDK to strip the native lib but in fact it only messes up the `.shstrtab` section of the native lib. The NDK setup needs to be checked carefully to ensure it matches upstream setup, including the NDK version and if it's used by AGP.

F-Droid build server currently supports the following JDK versions:

* 25 from Debian Trixie
* 21 from Debian Trixie
* 17 from Debian Bookworm
* 11 from Debian Bullseye
* 8 from Debian Sid

Note that versions not from the current Debian stable (Trixie) might become unavailable as time passes, so you are encouraged to update as much as possible.

#### Support 16 KB page sizes

Beginning with Android 15, Android supports devices that are configured to use a page
size of 16 KB (16 KB devices). If your app uses any NDK libraries, either directly or
indirectly through an SDK, then you will need to rebuild your app for it to work on
these 16 KB devices. More info [here](https://developer.android.com/guide/practices/page-sizes)


#### Language-specific instructions

Native libraries may be built with various tools and languages. Though they suffer
from similar reproducible build issues, the methods for fixing them are different. Some
known solutions are listed below:


##### ndk-build

`LOCAL_CFLAGS += <compiler args>` and `LOCAL_LDFLAGS += -Wl,<linker args>` can be added to `Android.mk` files or to
`build.gradle`/`build.gradle.kts`:

```groovy
android {
    defaultConfig {
        externalNativeBuild {
            ndkBuild {
                arguments "LOCAL_CFLAGS+=<compiler args> LOCAL_LDFLAGS+=-Wl,<linker args>"
            }
        }
    }
}
```

##### CMake

For CMake versions since 3.13, `add_compile_options("<compiler args>")` and `add_link_options(LINKER:<linker args>)` can
be added to `CMakeLists.txt` globally, e.g. to remove `build-id`:

```cmake
add_link_options("LINKER:--build-id=none")
```

This command only works for libraries added after this command is invoked, so it should
be invoked at the beginning of the CMake file. For CMake versions before 3.13,
`target_compile_options(<target> PRIVATE <compiler args>)` and `target_link_libraries(<target> LINKER:<linker args>)` can be used instead for
every target. It can also be set in Gradle files:

```groovy
android {
    defaultConfig {
        externalNativeBuild.cmake {
          cFlags "<compiler args> -Wl,<linker args>" // or
          arguments "-DCMAKE_C_FLAGS=<compiler args> -DCMAKE_SHARED_LINKER_FLAGS=-Wl,<linker args>"
        }
    }
}
```

And this can also be used to change the behavior of libs from pub for Flutter apps, e.g. for `jni` pub:

```kotlin
import com.android.build.gradle.LibraryExtension
subprojects {
    plugins.withId("com.android.library") {
        if (name == "jni") {
            extensions.configure<LibraryExtension>("android") {
                defaultConfig {
                    externalNativeBuild {
                        cmake {
                            arguments += "-DCMAKE_SHARED_LINKER_FLAGS=-Wl,--build-id=none"
                        }
                    }
                }
            }
        }
    }
}
```

The `-ffile-prefix-map` flag can be used to remove embedded build path. It can be added to `CMakeLists.txt` directly:

```cmake
add_compile_options("-ffile-prefix-map=${CMAKE_CURRENT_SOURCE_DIR}=.")
```

or in `build.gradle`:

```groovy
externalNativeBuild {
    cmake {
        cFlags "-ffile-prefix-map=${rootDir}=."
        cppFlags "-ffile-prefix-map=${rootDir}=."
    }
}
```

##### Golang

Linker arguments can be added to `CGO_LDFLAGS`. Some other useful arguments that can be
passed to `go build` are `-ldflags="-buildid="`, `-trimpath` (to avoid embedded build paths) and `-buildvcs=false`.

##### Rust

Compiler and linker arguments can be added to [Cargo `build.rustflags`](https://doc.rust-lang.org/cargo/reference/config.html#buildrustflags) and [rustc Codegen Options](https://doc.rust-lang.org/rustc/codegen-options/index.html).
Linker arguments can be added with `-C link-args=-Wl,<linker args>` and `--remap-path-prefix=<old>=<new>`
can be added to strip build paths.

An unstable feature [trim-paths](https://doc.rust-lang.org/cargo/reference/unstable.html#profile-trim-paths-option) is added to Cargo to remove all the absolute paths in rust.

The Rust toolchain should be pinned to the same version as upstream. This can be done when installing rustup with `rustup-init.sh -y --default-toolchain <version>`.

When `openssl` crate uses vendored OpenSSL build, the OpenSSL lib needs to be configured specially to be reproducible. `SOURCE_DATE_EPOCH` can be set to remove the embedded timestamps and `CARGO_TARGET_DIR` can be set to a absolute path, e.g. `/tmp/build` to make the embedded path reproducible between different machines. NDK also need to be in the same path which can be solved by linking it to the same path.

`CARGO_HOME` path plays an important part too and ends up in the built libs, it's recommended to match it between builds, e.g. export it before running `rustup`, or any other build commands, and don't forget to source `env` from it.

#### Library-specific instructions

Some libraries generate non-deterministic code due to timestamps, unsorted iterations etc. Some known fixes are documented below:

##### AboutLibraries Gradle plugin

You can prevent this plugin (`com.mikepenz.aboutlibraries.plugin`) from adding a
timestamp to the JSON file it generates by adding this to `build.gradle`:

```groovy
aboutLibraries {
    // Remove the "generated" timestamp to allow for reproducible builds
    excludeFields = ["generated"]
}
```

For `build.gradle.kts`, add this instead:

```kotlin
aboutLibraries {
    // Remove the "generated" timestamp to allow for reproducible builds
    excludeFields = arrayOf("generated")
}
```

##### EventBus

It generates [non-deterministic code](https://github.com/greenrobot/EventBus/issues/715) which can be sorted after the classes are generated. The detailed instructions can be found in [Eternity's source code](https://codeberg.org/Bazsalanszky/Eternity/commit/05123c70682e5988ad5f0ff111f97b66a87d8806).


### migration to reproducible builds

#### TODO

* jar sort order for APKs
* `aapt` versions produce different results (XML and _res/_ subfolder names)


#### Sources

* <https://gitlab.com/fdroid/fdroidserver/commit/8568805866dadbdcc6c07449ca6b84b80d0ab03c>
* [Verification Server](../Verification_Server)
* <https://verification.f-droid.org>
* <https://reproducible-builds.org>
* <https://wiki.debian.org/ReproducibleBuilds>
* <https://gitian.org/>
* [Google Issue #70292819 platform-27\_r01.zip was overwritten with a new update](https://issuetracker.google.com/issues/70292819)
* [Google Issue #37132313 platformBuildVersionName makes builds difficult to reproduce, creates unneeded diffs](https://issuetracker.google.com/issues/37132313)
* [Google Issue #110237303 resources.arsc built with non-determism, prevents reproducible APK builds](https://issuetracker.google.com/issues/110237303)
* [Unreproducible/non-deterministic code generation by navigation.safeargs.kotlin](https://issuetracker.google.com/issues/189498001)
* [unneeded DEX code differences based on number of CPUs used in build process](https://issuetracker.google.com/issues/269181868)
* [Assembling the bundle with AssembleBundleTask produces DEX files in the wrong order, resulting in a checksum mismatch](https://issuetracker.google.com/issues/384870255) 
* [differing DEX bytecode depending on the number of CPU cores breaks Reproducible Builds](https://issuetracker.google.com/issues/366412380)
* [unneeded DEX code differences based on number of CPUs used in build process](https://issuetracker.google.com/issues/269181868)
