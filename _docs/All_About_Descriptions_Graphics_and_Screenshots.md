---
layout: page
title: All About Descriptions, Graphics, and Screenshots
---

Each app can have complete app store content, including localized
descriptions, feature graphics, and screenshots (as of v0.103 of the
F-Droid client app and v0.8 of _fdroidserver_).  This is possible both
when apps are added via [build metadata](../TODO) as well as when
including pre-built files in a [simple repository](../TODO).  There
are three paths to including app store content for apps:

* Do not remove this line (it will not be displayed)
{:toc}

There are two data formats:

* descriptive materials in plain text or HTML
* graphics and screenshots as PNG or JPEG files


## In the app's source repository

There are two options for including the app store materials in an
app's source repository:
[fastlane supply](https://github.com/fastlane/fastlane/blob/2.28.7/supply/README.md#images-and-screenshots)
and
[Triple-T Gradle Play Publisher](https://github.com/Triple-T/gradle-play-publisher#play-store-metadata).
Both of these are free software tools that integrate into an Android
developer's workflow.  Once the files are included in the app's source
repo, and those files are included in a tagged release of the app,
F-Droid will include all those files.

In the end, it is not actually necessary to actually install or use
either _fastlane supply_ nor _Gradle Play Publisher_.  F-Droid
includes these files purely based on the standard file layout that
those tools use.


## In the app's build metadata in an _fdroiddata_ collection

All the app store materials can also be added to any _fdroiddata_
repository of build metadata.  This follows a file layout modeled
after
[fastlane supply](https://github.com/fastlane/fastlane/blob/2.28.7/supply/README.md#images-and-screenshots),
modified to fit into the _fdroiddata_ workflow.  Any files in this
layout will be copied into the repo and added to the repo's index file
by `fdroid update`.

```
- <fdroiddata>/
  └── metadata/
      └── <package-id>/
          └── <locale>/
              ├── full_description.txt
              ├── short_description.txt
              ├── title.txt
              ├── video.txt
              ├── images/
              │   ├── featureGraphic.png
              │   ├── icon.png
              │   ├── promoGraphic.png
              │   └── tvBanner.png
              ├── changelogs/
              │   ├── <version-code>.txt
              │   └── <version-code>.txt
              ├── phoneScreenshots/
              │   └── *.png
              ├── sevenInchScreenshots/
              │   └── *.png
              ├── tenInchScreenshots/
              │   └── *.png
              ├── tvScreenshots/
              │   └── *.png
              └── wearScreenshots/
                  └── *.png
```

## Directly in the F-Droid repo

The ultimate destination for files from the app's source repo and
_fdroiddata_ metadata sub-directories is in the F-Droid repo.  The
text all gets included into the index file (aka _index-v1.json_).  All
of the graphics files can be directly included in the repo.  If
graphics files are also in the app's source or _fdroiddata_, then the
files directly in the repo will be overwritten.  The text files from
the _fastlane_ layout are ignored if they are in the repo.

```
- fdroid/
  └── repo/
      └── <package-id>/
          └── <locale>/
              ├── featureGraphic.png
              ├── icon.png
              ├── promoGraphic.png
              ├── tvBanner.png
              ├── phoneScreenshots/
              │   └── *.png
              ├── sevenInchScreenshots/
              │   └── *.png
              ├── tenInchScreenshots/
              │   └── *.png
              ├── tvScreenshots/
              │   └── *.png
              └── wearScreenshots/
                  └── *.png
```

`fdroid update` adds all the graphics files it finds in the repo to
the index.  `fdroid server update` will sync all of the files in the
repo to the various locations where the repo is actually hosted.
