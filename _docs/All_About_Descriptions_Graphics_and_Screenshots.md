---
layout: page
title: All About Descriptions, Graphics, and Screenshots

---

Each app can have complete app store content, including localized descriptions,
feature graphics, and screenshots (as of v0.103 of the F-Droid client app and
v0.8 of _fdroidserver_).  This is possible both when apps are added via
[build metadata](../Build_Metadata_Reference) as well as when including
pre-built files in a simple repository.  There are three paths to including app
store content for apps (in order of preference):



* Do not remove this line (it will not be displayed)
{:toc}

There are two data formats:

* descriptive materials in plain text or HTML
* graphics and screenshots as PNG or JPEG files

One important detail: dangerous and unneeded metadata is stripped from
image files before they are included in the repo.  For example, JPEG
EXIF data has
[security issues](https://threatpost.com/google-shuts-down-potentially-massive-android-bug/120393/),
and it is not needed to display images.  This can also mean that the
images are recompressed.


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

All the localized descriptions and graphics will automatically show up
in the F-Droid repo once they are available in the source repo of a
release that the repo builds.  For example, if these files are
included in a _git_ repo's _master_ branch but not yet in a tagged
release, they will not be included.

The last important detail is that the texts in the app's metadata file
will override all other descriptive texts from
_Fastlane_/_Triple-T_. That is specifically
[_Name_](../Build_Metadata_Reference/#Name),
[_Summary_](../Build_Metadata_Reference/#Summary), and
[_Description_](../Build_Metadata_Reference/#Description).  Once an
app's descriptive texts have been moved into the source repo, then
file a
[merge request](https://gitlab.com/fdroid/fdroiddata/merge_requests)
or [issue](https://gitlab.com/fdroid/fdroiddata/issues) to remove
_Summary_ and _Description_ from the app's metadata file.

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
              ├── changelogs/
              │   ├── <version-code>.txt
              │   └── <version-code>.txt
              └── images/
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

The images must be either JPEGs or PNGs.

Example:

* .../ToGoZip/app/...
  * the sourcecode for the android app ToGoZip
* [.../ToGoZip/fastlane/metadata/android/en-US/full_description.txt](https://github.com/k3b/ToGoZip/blob/master/fastlane/metadata/android/en-US/full_description.txt)
  * contains the (us-) English description of the app ToGoZip.
* [.../ToGoZip/fastlane/metadata/android/de-DE/full_description.txt](https://github.com/k3b/ToGoZip/blob/master/fastlane/metadata/android/de-DE/full_description.txt)
  * contains the German description of the app ToGoZip.
* [.../ToGoZip/fastlane/metadata/android/en-US/changelogs/9.txt](https://github.com/k3b/ToGoZip/blob/master/fastlane/metadata/android/en-US/changelogs/9.txt)
  * contains description of the changes made in versionCode **9**
  * in fdroid app this will be shown above the app description
* .../ToGoZip/fastlane/metadata/android/en-US/images/featureGraphic.png 
  * this image will be shown on top of the fdroid-s app description
* .../ToGoZip/fastlane/metadata/android/en-US/images/phoneScreenshots/....
  * images in this folder will be shown below the fdroid-s app description

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
