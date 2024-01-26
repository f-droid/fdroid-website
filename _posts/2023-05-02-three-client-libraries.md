---
author: "grote"
authorWebsite: "https://blog.grobox.de"
title: How to use the F-Droid libraries, like CalyxOS
layout: post
---

When we built the
[next-generation F-Droid client]({% post_url 2023-03-01-new-repo-format-faster-smaller-updates %}),
we rewrote our code to fit into re-usable libraries,
so other projects can make use of F-Droid technology with minimal hassle.

## The libraries

So far, we have published three libraries.
Two of them are written in Kotlin multi-platform, so they can be used outside Android as well.
For example, you could use them to write a command line or even an iOS client.

Check out [their README](https://gitlab.com/fdroid/fdroidclient/-/tree/master/libs#f-droid-libraries)
for how to include them in your project.

### Download library

This library includes everything you need to download F-Droid repositories and the APKs and images included in them.
It handles resuming of downloads, repository mirrors and takes care of the special HTTP cases
that an F-Droid client can encounter.

The Android version of the library also takes care of rejecting TLS older than 1.2 as well as weak ciphers.
It prevents DNS leaks when using Tor as a proxy and uses a short TLS session timeout
to prevent tracking and key re-use.
If you use Glide as an image loader, it also comes with a special `ModelLoader` to be used with Glide.

Please see the [API docs](https://fdroid.gitlab.io/fdroidclient/libs/download/) for details.
Check [how F-Droid switched to the download library](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1083)
for an example.

### Index library

The multi-platform index library gives you everything you need to handle F-Droid repository indexes.
Of course, there's a parser for reading and representing the indexes internally.
For version 1 indexes, there is also a creator which F-Droid uses to create its own nearby swap repositories.
Both versions have a signature verifier,
so you can always make sure that the repository is properly signed before working with its data.

Apart from these basics, the library also has many useful classes
that help you to choose the best translation based on the user's locale,
to check if an app is compatible with the current device,
and to check if an app has an update available in the repository index.
There are classes for processing streams of index data,
so you don't need to load the entire index into memory which can be an issue on devices with little RAM.
If you prefer to work only with the version 2 format internally,
the library features an index converter which can convert version 1 format into version 2.

F-Droid clients wishing to make use of version 2 delta updates,
also find helpful classes for this, so they don't have to re-invent the wheel themselves.

Please see the [API docs](https://fdroid.gitlab.io/fdroidclient/libs/index/) for details.
Check [how F-Droid switched to the index library](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1120)
for an example.

### Database library

In case you need to persist F-Droid repository information in your Android app, this library is for you.
It stores F-Droid related information such as repositories, apps and their versions.
Then allows you to query and search for them.
Under the hood, it uses a Room database which in turn uses sqlite.

Besides database related classes, this library currently also includes classes related to updating repositories,
so that information fetched from the internet (using the downloader library)
can be streamed directly into the database.

Please see the [API docs](https://fdroid.gitlab.io/fdroidclient/libs/database/) for details.
Check [how F-Droid switched to the database library](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1135)
for an example.

## CalyxOS

The first known user of these new libraries is CalyxOS which is already using them in two of their apps.
Thanks to the libraries, they can focus their development effort on the apps themselves 
and don't need to re-implement the F-Droid related bits.

The first app is used as part of their setup wizard that shows up after initial install.
It allows the user to install additional apps on an opt-in basis,
so they don't need to ship as non-removable system apps.
The benefit for CalyxOS is that they can load these apps from an F-Droid repository in the internet
without needing to ship APKs as part of their ROM keeping its size minimal.

This is [their method](https://gitlab.com/CalyxOS/platform_external_calyx_lupin/-/blob/e78b4e/shared/src/main/java/org/calyxos/lupin/RepoHelper.kt#L83-88)
to get an index representation from a file, making use of the index library:

```kotlin
fun getIndex(file: File): IndexV2 = file.inputStream().use { inputStream ->
    IndexParser.parseV2(inputStream)
}
```

The second app uses F-Droid to keep its own essential apps up to date.
With a minimal UI, its main purpose is to regularly check for updates
and install them in the background, once available.

The app makes use of the `UpdateChecker` of the index library to check if updates are available:

```kotlin
private fun getUpdate(packageName: String, packageVersions: List<PackageVersionV2>): PackageVersionV2? {
    val packageInfo = packageManager.getPackageInfo(packageName, GET_SIGNATURES)
    return updateChecker.getUpdate(packageVersions, packageInfo)
}
```
([Full code example](https://gitlab.com/CalyxOS/platform_external_calyx_lupin/-/blob/e78b4e/updater/src/main/java/org/calyxos/lupin/updater/UpdateManager.kt#L154-168))

[Both of these apps](https://gitlab.com/CalyxOS/platform_external_calyx_lupin/) don't need to persist any data,
so they only use the download and the index library.

_The library work was funded by the [FFDW-DVD grant]({% post_url 2022-02-05-decentralizing-distribution %})_
