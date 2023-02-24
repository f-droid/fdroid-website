---
author: "grote"
authorWebsite: "https://blog.grobox.de"
title: New repository format for faster and smaller updates
layout: post
---

We just released version `1.16` of the official F-Droid client app for Android
which includes many radical changes under the hood as well as many bug fixes for long standing issue.
Read on for more details.

## Growing repository size

As more and more apps make their way into F-Droid,
the official repository index that includes all apps and their metadata also keeps growing.
Currently, the size of the compressed index is `8 MB` which is `33 MB` uncompressed.
When updating the repository index, each F-Droid client app has to download 
and process those `8MB` again and again.
This problematic trend became apparent [a long time ago](https://gitlab.com/fdroid/fdroidclient/-/issues/649).

## Updating only what has changed

Our repository index is in JSON format and we decided
to make use of [RFC 7396 JSON Merge Patch](https://datatracker.ietf.org/doc/html/rfc7396)
to create much smaller JSON files that only contain the changes since your F-Droid app last updated.
Technically, this works by downloading a new [`entry.json`](https://f-droid.org/repo/entry.json) file
instead of the full index.
This entry file points to the full index in case the app had never updated before and needs all app metadata anyway.
But the entry also contains pointers to various smaller *diff*erence files.
The app automatically picks the right diff and only downloads that much smaller file instead of the full index.
This not only saves bandwidth, it also makes updating the index much faster
as only the minimum amount of data needs to be downloaded, processed and stored.
As of writing, the latest diff is `80 KB` compressed which is `241 KB` uncompressed
which is only `1%` of the full index.
Version `1.16` of the official F-Droid client app for Android supports this new repository format.

## Other improvements

The new version has a large number of radical changes under the hood.
For example, the entire database had to be replaced to support the new difference based repository format.
We also used the opportunity to improve various bit and pieces along the way:

  * improved mirror support: all files (e.g. images) now get loaded from mirrors reducing the load on the main server
  * better support for low RAM devices, because the index now gets streamed into the DB
    instead of loading all of it into memory
  * hash verification: The SHA256 hash of *all* files is now part of the repository metadata
    and gets verified while downloading
  * stronger digest algorithm for repository signing: We now use SHA256 instead of SHA1 for the index signature
  * support for downloading repository files via IPFS
  * many bug fixes that came out of modernizing ancient code

The new version went through
[a series of alpha releases]({{ site.baseurl }}{% post_url 2022-11-30-upcoming-alpha-release-of-f-droid-client %})
with extended testing to make sure no severe issues make it into the stable release.
It is now considered ready for general use.

## Information for repository and client maintainers

Owners of third-party F-Droid repositories can enable the new format by upgrading to the latest version of
[fdroidserver](https://gitlab.com/fdroid/fdroidserver) which will automatically publish the new format
in addition to the old ones which we keep around to support older client apps.

Developers of third-party F-Droid clients are encouraged to adopt the new format either with their own implementations
or by making use of the [new libraries](https://gitlab.com/fdroid/fdroidclient/-/tree/master/libs#f-droid-libraries)
we are publishing to make using this technology as easy as possible
and to share as much code as possible between different F-Droid implementations.

_This work was funded by the [FFDW-DVD grant]({{ site.baseurl }}{% post_url 2022-02-05-decentralizing-distribution %})_
