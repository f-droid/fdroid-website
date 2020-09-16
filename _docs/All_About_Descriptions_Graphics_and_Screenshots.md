---
layout: page
title: All About Descriptions, Graphics, and Screenshots

---

Applications on F-Droid may provide content for the app store to make their about page more interesting and informative.

This is supported from F-Droid version 0.103 and *fdroidserver* version 0.8.

* Do not remove this line (it will not be displayed)
{:toc}

## Latest tab criteria

In F-Droid client, since release 1.6, only applications that have all of the following are shown on the Latest tab: 

* Name
* Summary
* Description
* License
* a What’s New entry for at least one release
* at least one graphic (screenshot or a feature graphic)
* at least one of the above translated

Learn more at the [announcement post](https://f-droid.org/en/2019/03/26/the-latest-tab-now-highlights-good-descriptions.html). 

## Data format

### Image file formats

Images may be provided in PNG or JPEG format. They must have the ending `png`, `jpg` or `jpeg`.

It is important to note that dangerous and unneeded metadata is stripped from image files before they are included in
the repo. For example, JPEG EXIF data has
[security issues](https://threatpost.com/google-shuts-down-potentially-massive-android-bug/120393/), and it is not
needed to display images. This also means that images may be recompressed.

### HTML descriptions

The detailed app description may use HTML tags. Note that not all tags are supported by the renderer.

* Common tags like `li`, `a` with `href`, `ul`, `ol`, `li`, `b`, `u` and `i` are supported.
* Certain tags are explicitly prohibited, namely `applet`, `base`, `body`, `button`, `embed`, `form`, `head`, `html`,
`iframe`, `img`, `input`, `link`, `object`, `picture`, `script`, `source`, `style`, `svg` and `video`.
* Note that a linebreak will automatically be converted to a `br` tag.
* You may not make use of JavaScript.

## Ways of providing metadata

Adding metadata can be done in the following three ways.

### In the application's source repository

For the official F-Droid repository, it is **strongly encouraged** to add metadata in the application's source repo for
for the following reasons:

* The application's metadata is under direct control of the repository owners
* Metadata from the repository is copied to the F-Droid repo automatically (thus no merge requests are needed)

F-Droid supports two distinct file structures. These aim to be compatible with existing free software tools that allow publishing applications to Google Play. It is not required to install any of these
tools, the file structure can easily be created manually instead.

Please be aware that texts in the app’s metadata file will override all other descriptive texts provided through the
structures explained below. This affects [_Name_](../Build_Metadata_Reference/#Name),
[_Summary_](../Build_Metadata_Reference/#Summary), and [_Description_](../Build_Metadata_Reference/#Description).
Once metadata fields that were previously in the metadata file have been moved to the app’s source repo, please file a
[merge request](https://gitlab.com/fdroid/fdroiddata/merge_requests) or
[issue](https://gitlab.com/fdroid/fdroiddata/issues) to remove _Summary_ and _Description_ from the app's metadata file.
 
For more details, see the [precedence rules](#precedence) described at the end of this file.

F-Droid will only use metadata files from the latest release. This means that *fdroidserver* will check out the latest
version it knows and scan the repository at the state of that version for metadata files.

All metadata files are completely optional, except for the short summary description as well as the longer full
description. However, apps which do not fulfill certain [criteria](#latest-tab-criteria) will not be shown on the Latest tab.

#### Fastlane structure

The first of the two structures is aiming to be compatible to the
[fastlane supply](https://github.com/fastlane/fastlane/blob/2.28.7/supply/README.md#images-and-screenshots) tool.

The basic file structure is as follows. Pay attention to the notes at the right. When this structure is created, it
needs to be place in the correct position as outlined below.


```
├── en-US                       (en-US is the F-Droid fallback language)
│   ├── short_description.txt   (short description, max 80 chars, mandatory)
│   ├── full_description.txt    (full app description, mandatory)
│   ├── title.txt               (app name)
│   ├── video.txt               (URL to a video introducing the app)
│   ├── images
│   │   ├── icon.png            (app icon, mandatory if your app doesn't include any png icon)
│   │   ├── featureGraphic.png  (promo banner, shown on top of the app desc in F-Droid client; landscape)
│   │   ├── tvBanner.png        ("icon" for TV devices, currently not used)
│   │   ├── phoneScreenshots
│   │   │   ├── 1.png
│   │   │   ├── 2.png
│   │   │   ...
│   │   ├── sevenInchScreenshots/
│   │   ├── tenInchScreenshots/ (you may add different screenshots for different screen sizes)
│   │   ├── tvScreenshots/
│   │   └── wearScreenshots/
│   └── changelogs
│       ├── 100000.txt          (must correspond to versionCode, literally, no padding)
│       ├── 100100.txt          (if the version code was set to 100100)
│       └── 100101.txt          (maximum size: 500 characters)
└── ru                          (other locale codes)
    ...                         (localized metadata is always preferred by the client)
    └── changelogs
        └── 100100.txt
```

This structure must be placed at one of the following locations from **the repository's root**:

* `metadata/`
* `fastlane/metadata/android/`

Note that placing the structure anywhere else, like in the gradle module's root, **won't work**.

**Build flavors** and multiple apps inside one repository are currently not properly supported.
(Follow [this issue](https://gitlab.com/fdroid/fdroidserver/issues/829) tracking the implementation of this.)

#### Triple-T structure

The second supported structure is compatible with the tool
[Triple-T Gradle Play Publisher](https://github.com/Triple-T/gradle-play-publisher/blob/2.8.0/README.md#publishing-listings).

Place the following structure at `<module>/src/main/play/` or, for **build flavor** support, at `<module>/src/<buildFlavor>/play/`, where `<module>` is the gradle module of your app (in many cases, this is just the folder `app`):


```
├── contact-email.txt                   (Developer email / AuthorEmail)
├── contact-website.txt                 (Developer website / AuthorWebSite)
├── release-notes
│   └── en-US
│       └── default.txt                 (latest changelog)
└── listings
    ├── en-US                           (en-US is the default locale in F-Droid)
    │   ├── title.txt                   (app name)
    │   ├── short-description.txt       (short description, max 80 chars, mandatory)
    │   ├── full-description.txt        (full app description, mandatory)
    │   ├── video-url.txt               (URL to a video introducing the app)
    │   ├── whatsnew                    (alternative changelog location; single file, no .txt)
    │   └── graphics
    │       ├── icon                    (app icon; mandatory if your app doesn't include any png icon)
    │       │   └── *.(png|jpg)         1 image, usually 512x512
    │       ├── feature-graphic         (promo banner, shown on top of the app desc in F-Droid client)
    │       │   └── *.(png|jpg)         1 image, usually 1024x500
    │       ├── phone-screenshots
    │       │   └── *.(png|jpg)
    │       ├── tablet-screenshots
    │       │   └── *.(png|jpg)
    │       ├── large-tablet-screenshots
    │       │   └── *.(png|jpg)
    │       ├── tv-banner               ("icon" for TV devices, currently not used)
    │       │   └── *.(png|jpg)
    │       ├── tv-screenshots
    │       │   └── *.(png|jpg)
    │       └── wear-screenshots
    │           └── *.(png|jpg)
    ├── de                              (other locales)
        ├── ...
```

### In the app's build metadata in an *fdroiddata* collection

**Note**: This option is only meant for those who host their own repositories. If you are a developer who wants to get
an app into the main F-Droid repository, **do not choose this option**. Specifically, screenshots may not be added to
the *fdroiddata* repository.

Metadata files can also be added to any *fdroiddata* repository of build metadata. The file structure is modelled after
fastlane as well and it looks the same as shown above, with the following additional notes.

* Place the structure in the following location: `<fdroiddata>/metadata/<packageId>/`
   * For example, for `en-US`, `title.txt` would reside in this location:
   `<fdroiddata>/metadata/<packageId>/en-US/title.txt`
* Instead of `short_description.txt`, the summary file should be named `summary.txt`.
* Instead of `full_description.txt`, the description file should be named `description.txt`.
* Not following the above two points causes the linter to fail.

### In the F-Droid repo

**Note**: This option is only available to those who host their own repositories.

The ultimate destination for files from the app’s source repo and *fdroiddata* metadata sub-directories is in the
F-Droid repo. The text all gets included into the index file (aka *index-v1.json*). All of the graphics files can be
directly included in the repo.

If graphics files are also in the app’s source or *fdroiddata*, then the files directly in
the repo will be overwritten.

You may not place text files directly in the repo.

For reference, picture files can be placed in the repo at the following locations:

```
- fdroid
  └── repo
      └── <package-id>
          └── <locale>
              ├── featureGraphic.png
              ├── icon.png
              ├── tvBanner.png
              ├── phoneScreenshots
              │   └── *.png
              ├── sevenInchScreenshots
              │   └── *.png
              ├── tenInchScreenshots
              │   └── *.png
              ├── tvScreenshots
              │   └── *.png
              └── wearScreenshots
                  └── *.png
```

## Precedence

The following general precedence rules are applied when multiple of the above options provide metadata:

* The metadata file (i. e. `<fdroiddata>/metadata/<packageId>.yml`) overwrites *fdroiddata* files, even localized ones.
* The *fdroiddata* files overwrite metadata from the app source.
* For data that is also contained in the APK file like the app's name, the previous two options both overwrite the
data from the APK file.

However, the following more specific rule also applies:

* Graphic files from the app’s source of *fdroiddata* overwrites files in the repo.
