---
layout: page
title: Repository Style Guide

---

This page is a __work in progress__, and needs attention from experts on
the subject, especially on fact checking.

This guide gives some more detailed information on what to store in
metadata fields. Most items are outdated and will be merge with the
manual over time.

### Source Code

* *E.g* <https://gitlab.com/fdroid/fdroidclient/tree/master>

The F-Droid server does not directly publish an APK online, instead the
F-Droid server needs a buildable source to build an APK from. This way
the server guarantees that the resulting APK accurately represents the
source code without any hidden anti-features.

Because F-Droid builds every app from its source code (via the Android
SDK with ant, gradle or maven, sometimes with help from the Android NDK,
standard GNU/Linux programs and a little pre-processing in the BASH
shell), probably if you can see a file called _AndroidManifest.xml_ or
_build.gradle_ in your sources then there are many possibilities that
F-Droid will be able to build it.

Note that most projects call upon pre-built libraries. The source code
for these is found elsewhere. For ant, these will be found in the
`libs/` folder and external ones are mentioned in the
_project.properties_ files; for gradle, these will be mentioned in
_build.gradle_ and are usually pulled from <http://mvnrepository.com>;
for maven there will be `pom.xml` files which describe the dependencies.
If native code pre-built libraries are used, these will often be found
in `res/raw/` or `assets/`: there should be something said about these
in the `README`. The example above has one jar file dependency with a
text reference and doesn't use any external libraries, so no extra
references are needed.


### License

- *E.g.* Overall: <https://gitlab.com/fdroid/fdroidclient/blob/master/LICENSE> (overall of
a source code under a *GPLv3+* license);
- *E.g.* Source code header: <https://gitlab.com/fdroid/fdroidclient/blob/master/app/src/main/java/org/fdroid/fdroid/AppDetails.java> (header of a file under a *GPLv3+* license);
- *E.g.* Libraries: <https://gitlab.com/fdroid/fdroidclient/tree/master/libs> (see the `LICENSE` file with the *Apache License, Version 2.0* license for that library);
- *E.g.* Artwork: <https://f-droid.org/about> (see the *CC BY-SA 3.0* license for artworks)

All apps in the F-Droid repository *must* be FOSS (Free and Open Source
software). If the software doesn't clearly state a license that is
listed as a Free Software License in the [GNU license
list](http://www.gnu.org/licenses/license-list.html#SoftwareLicenses)
then it probably isn't.

If there aren't any `README` or `LICENSE` in the source code of the app
it's very difficult for the F-Droid community verify that the entire
source code, libraries and artwork each are released under a suitable
Free and Open Source license. So, it's a good pratice to verify that the
app has headers in every file of the source code, a text file in the
library folder and a statement in the source code or on the official
website of the app that clearly explain the license about all the stuff
that can be find related the app.

*Note:* There is a little precisation to do about the use of the *GNU
General Public License **v2***. The Android support library and most
other Android libraries are licensed under the *Apache Licence*. Due to
technical legal reasons, these can't be combined with the *GNU General
Public License **v2***. In case of an app released under the
*GPL**v2***, it is legally accepted only if the source code headers of
the app say «GPLv2 **or later**», then we can choose the overall licence
to be *GPL**v3*** (this because on the contrary the *GPL**v3*** is full
legally compatible with the Android support library and the others
libraries).


### Summaries

The summary should be the shortest possible thing that describes what
the app does or enables the user to do, e.g. instead of "E-mail client"
use "Receive and send e-mails".


### Descriptions

Descriptions should be written in an objective, neutral style, with at
least the first paragraph devoted to describing what the application is
and what features it has. This can be followed with concise help for
specific features/problems, and links to external resources for more
information. Additional information such as links to
related/compatible/required (but not alternative) applications should
also be included where appropriate.

Some other notes:

-   Phrases like "a note-taking app for Android" should never appear.
    Obviously it's for Android. Obviously it's an app.
-   Similary, don't say "it's free software" or "it's open source"
    because obviously it is.
-   There shouldn't be any compatiblity-related things in there (e.g.
    "for Android 2.3+") because this is handled automatically. Only
    include compatibility notes when the client app doesn't
    automatically detect them.
-   The summary will always be shown with the description, so avoid
    repeating it.
-   If there is anything different about the F-Droid build compared to a
    standard one, it should be described.
-   There should never be anything written from the developer's point of
    view, e.g. "I wrote this cat gallery app because I like cats".

Other information worth mentioning are:

-   Does the app require root permissions?
-   Can it interact with other apps?
-   How easy is it to use?


### Donations

Where a project accepts donations, the ideal donation link would be to a
specific page that the project maintains for that purpose. If one
doesn't exist, it's acceptable to just link to their page that has a
donation icon or similar somewhere on it, but this doesn't create a good
user experience when, for example, someone selects 'Donate' in the
F-Droid client and then has to search a page for the details. Try to
encourage the developers to create a dedicate page if possible.


### AntiFeatures

In addition some software, even being Free and Open Source software, may
do practices which can be considered undesirable and that we consider
[_AntiFeatures_](https://monitor.f-droid.org/anti-features)". Where possible the F-Droid
community still include these applications in the repository but
flagging and cataloging these antifeatures in order to warn users (on
the F-Droid client and on the web repository browser) by any
antifeatures present on the app. Even though software can be included in
the F-Droid even with antifeatures, it is frequently the case that
software with these antifeatures is actually not entirely FOSS (for
example advertising and tracking user activity is often enabled via
Non-Free binary libraries) compromising in this way the inclusion of the
app in the F-Droid repository.


### Updating

- *E.g.* <https://gitlab.com/fdroid/fdroidclient/graphs/master> & <https://gitlab.com/fdroid/fdroidclient/network/master> & <http://f-droid.org/news-and-reviews>

Getting the app in the repository isn't the end of the story: we have to
keep the versions, descriptions and URLs up-to-date.

The most important is to know when new versions are published. We have
three automatic methods and one manual: from tags; checking the
_AndroidManifest.xml_ at the most recent revision in the repository; and
checking Google Play. If these won't do, we must look at the version of
the package published by the upstream developers, either by loading the
Google Play web page or downloading an APK and checking its version.
Repository tags are the natural way of labelling new versions (look for
them under "releases" on an example in
[github.com](https://github.com/dschuermann/document-viewer/releases) or
under the "tags" directory in the case of SVN repos). If you can't find
tags it would be a helpful to make an issue about it on the issue
tracker. In the example, we point to a changelog page as a backup check;
other possiblities are a Google Code download page or a Google Play
link.
