---
layout: page
title: FAQ - App Developers

---

* Do not remove this line (it will not be displayed)
{:toc}

### How do I get my app included?

Please check the [inclusion policy](../Inclusion_Policy) to make sure
your app is suitable for inclusion in the official F-Droid repo.  The
quickest way to get an app included is to make a merge request to
_fdroiddata_, following
[these instructions](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md#merge-requests).
There's also a [Submitting to F-Droid Quick Start Guide](../Submitting_to_F-Droid_Quick_Start_Guide).
Requests for packaging can be posted in the
[Requests for Packaging](https://gitlab.com/fdroid/rfp/issues)
tracker.

You can also [set up your own repo](#Can_I_run_my_own_app_repo)
and distribute apps yourself, outside of the F-Droid.org repo.

### How do I change the description and add meta information like screenshots?

There are three locations we pull metadata from:

* upstream app repo, following the [fastlane](https://github.com/fastlane/fastlane) or [Triple-T play plugin](https://github.com/Triple-T/gradle-play-publisher) structure
* F-Droid's own [metadata repository](https://gitlab.com/fdroid/fdroiddata/blob/master/metadata)
* F-Droid's own `repo` staging area that gets published on the public F-Droid server

While you cannot edit the last one, merge requests to the metadata repository
updating the description are quite welcome. Screenshots on the other hand are
currently only used from upstream repository.

We hope to pull in more stuff (e.g. changelogs) directly from upstream in the
future, giving app developers more control of how their app is shown in F-Droid.
However, we will always keep a minimal, authoritative metadata repo of our own.

### How do I license my app?

There are, broadly, two categories: copyleft and permissive, with the
GPLv3 and the Apache 2.0 being the most popular respectively. Choose the
former if you insist that derivatives have the same licence and the
latter if you permit any kind of re-use.

The overall licence must be compatible with the licence of the
components. However we will grant some flexibility when it comes to
assets and resources; so if you have, for example, some music under a
Creative Commons non-commercial licence (i.e. a Non-Free licence), then
we will accept it. The important thing is to include copyright info for
assets as well as source code, in the file headers and/or the README. A
copy of the licences in the root of the repo is helpful (LICENSE or
COPYING files). Also make a note of the copyright and licenses
pertaining to external resources or programs and if it does connect to a
free service, consider using the Affero GPL. See the [Inclusion
Policy](../Inclusion_Policy) for more.


### How are donations handled?

On the web site and in the F-Droid client, we provide links to donate to
your project. Ideally you should have a dedicated page explaining how
and why to donate your project, so we can link directly to it. Remember
that most users will probably access this straight from the F-Droid
client on an Android device. You should also have this information
accessible from within your application.

We have fields in our metadata for Bitcoin, Litecoin, Flattr and Liberapay
donations. Be sure to contact us if there is a change to any of those or if
you stop accepting them; if you accept new methods you can contact us about that
too.

If your app is in our repo but we are missing any of the above
information, please make sure we know about it.


### Will my app be built from source?

Yes. In all but a very few cases (for technical or historical reasons),
we build all applications directly from the source code. This guarantees
that the source code is available for the version people have installed.
While we're not suggesting that *your* source code is incomplete, not
published or out of date, this happens a lot.


### What about versioning?

Android is aware of two version information, the versionName (a
user-facing string) and the versionCode (an integer that gets compared
to determine what actually IS an update). For additional information,
please see the [Android Developer
Documentation](https://developer.android.com/studio/publish/versioning.html).
Please make sure not to have contradicting information (e.g. mismatching
_AndroidManifest.xml_ and build.gradle).

We try to build only what you would consider to be releases. These
should have matching version names and, more importantly, matching
version codes to releases you build yourself, and be built from the same
code. Obviously this task is easier if your source code history is clear -
for example, if releases are tagged or otherwise labeled. If you tag
release, please ensure you keep the same tagging scheme, e.g. if you
start using a "v" prefix, keep using that.

We try not to build from a random repository head version.


### Do I need to tell you when I update?

We will [detect](../Build_Metadata_Reference#UpdateCheckMode) new
releases of your app and update our metadata accordingly, which will
then cause us to check the code and add new builds to our system. Tags
help greatly for adding new versions, but do remember to push the tags
to the origin repo each time. Of course, if you move source code to a
different website, you should tell us. There are currently some issues
around detecting new versions when the _AndroidManifest.xml_ is moved so
if there is some urgency, you can let us know if that happens.

Some app developers submit merge requests to us with all the relevant
build data when they release. You don't need to do this, but it can
speed things up. Historically, as a small community project, we have
been slower to process updates than we'd like to be, but this situation
is improving all the time.

Our update checks are dumb and just scrape build files: We do not run
any build code, so do not use time-based versioning or any other sort of
calculating your version at build time (e.g. moving them to multiple
subversions that get concatenated at build or even having complex
function calls to do this).


### I've published a new release. Why is it not in the repository?

When we detect a new release, it may take a few days to make it into the
repository as the build process runs only once a day. Before the build
has completed, the wiki page for your app will list it in
[:Category:Apps to Update](https://f-droid.org/wiki/page/:Category:Apps_to_Update). As long
as the text under *Versions* stating "The current (recommended) version
is *xxx* (version code *yyy*)" shows the version numbers corresponding
to your latest release, we detected it and the APK should be available
soon. Just give it some time.

Another reason could be that the app failed to build. You can watch the
build process on [Recent changes](https://f-droid.org/wiki/index.php?title=Special:RecentChanges&days=7&from=&hidebots=0&hideanons=1&hideliu=1) after clicking 'Show Bots'.


### What about signing?

Packages built by F-Droid are signed by F-Droid, so all apps in the
[official F-Droid repo](https://f-droid.org/repo) are signed by F-Droid
keys. F-Droid will generate a new key for each app that is included. All
of the different APKs built from different versions of an app will be
signed by the same app key. But do note: if an app is also distributed
in an APK signed by the developer, like in the Google Play Store, then
the F-Droid APK will have a different signature.

The Android OS requires that for an app to be upgraded in place, it
bears the same signature as the currently installed version. This
protects against inadvertent installation of an untrusted or unwanted
upgrade, and also protects the app's private data, which can only be
accessed by that application (or an application that has been granted
root access).

This situation presents a *minor* inconvenience to users who want to
switch from a version signed by one party to a version signed by
another. For example, if a user is running a version they installed via
F-Droid, and later wish to switch to a version you sign and distribute
yourself via another channel, they would have to take the additional
step of uninstalling and reinstalling the app. On its own this is not
even enough to qualify as a minor inconvenience - however, the
consequences of the uninstall are that the app's private data is removed
(again, this is for security) so the user will probably want to export
that first, and re-import it afterwards.

We also support reproducible builds, so we can build a version from
source and check against your official release. If they match (ignoring
the signature) we can then publish your official APK with your signature
used. This is a tedious task, since we have to standardize on the build
parameters and tools, but it should be worth it in the long run. We also
try to verify our own builds and get a lot of binary differences, see
[our verification server results](https://verification.f-droid.org/).
However, things will improve over time.


### Can APKs signed by my key be included?

Only APKs built by F-Droid are included in the official F-Droid
repo. We can try to reproduce your APK, as mentioned above, but if
this fails (or e.g. when you want to distribute an app with
closed-source components or API keys etc.), you can put any APK in
your own "[F-Droid binary repo](../Setup_an_F-Droid_App_Repo)", and
people can add your repo to their F-Droid client in order to get your
APKs.


### Can I run my own F-Droid package repository?<a name="Can_I_run_my_own_app_repo"></a>

Yes! You can also setup and run your own F-Droid repository of apps
and other packages.  If you also release your own app via other app
stores, like Google Play, we recommend that you also include those
releases in your own binary repo, for among other reasons, this will
provide a source of APKs for
[reproducible builds](../Reproducible_Builds).  This repository can be
a "[simple binary repo](../Setup_an_F-Droid_App_Repo)", which does not
use the _fdroidserver_ build system, or you could host your own mirror
of the full F-Droid.org repo.


### Can I see who's installing my app?

No. While information and metrics about installations would be
interesting and useful to you, it would also require us to track and
monitor our users, something we won't do. We don't have any information
about what apps or versions people install, whether they keep them
installed, what other software or OS version they're running, or indeed
anything else, so we can't pass that information on to you.


### Can I track users from my app?

You can, but if you include any kind of tracking or analytics in your
application (even sending crash reports) this must be something that the
user explicitly opts **in** to - i.e. you ask them on first run, before
sending anything anywhere, or there's a preference that defaults to OFF.
In all other cases, we may still include the app, but it will be flagged
with our 'Tracking' AntiFeature, which means users will only ever see
the app if they choose to view such apps.

Additionally, note that third party analytics libraries that come in the
form of proprietary software (for example, Google Analytics or Flurry)
are not acceptable here.


### Can I include advertising?

Yes, but:

1.  Many users don't like ads and find them intrusive. We flag
    applications that include ads, so people know what they're getting.
    They can choose whether or not these apps will be shown to them.
2.  Frequently incorporating ads into an app is done by including
    proprietary software in the form of a binary library (jar file).
    Obviously this would make your app ineligible for inclusion.


### Which libraries and dependencies are good to use?

To be FLOSS, your entire app has to be, including dependencies. If you
use Non-Free/proprietary libraries, we cannot build your app and thus it
cannot be included in our mainline repository (see "Can I run my own
app repo?" in that case). Unfortunately that rules out any libraries
that are part of the "Google repository" from the SDK manager (e.g.
play-services, fabric, firebase) -- only the "Android support
repository" is allowed.

For external resources, please restrain yourself to "well known
repositories", e.g. mavenCentral or JCenter (see complete listing in
the "srclib" section of
[Build Metadata Reference](../Build_Metadata_Reference)). Please note
that e.g. Bintray does not only offers JCenter, but user-repos as
well.  Those are not part of the trusted repository list.

If you require dependencies that are not available through those
repositories, please do not use binary jar files directly, but provide
an easy way to build them from source: e.g. by providing a "pre-build"
script, by including them to your actual build process (gradle task) and
including the library source in your project (hard or by submodule).

Replacements for known "usual suspects":

Note, that all of following are just subjective popularity-based
suggestions; there may be other FOSS projects better suited for your
needs.

-   Crittercism, BugSense — ACRA
-   Google Analytics — Piwik
-   Google Maps — OpenStreetMap, e.g. through
    [mapsforge](http://www.mapsforge.org) or
    [osmdroid](http://osmdroid.org)

### Aren't Google's SDK and libraries free, open source software?

While much of Android is free open source software, much of it is not
at all.  The Android SDK binaries is made available by Google under a
proprietary license but almost all of the source code for the Android
SDK is available under the Apache license.  Google APIs, used for
building apps using Google Services like Maps, GCM, etc, are free to
the extent that the library comes pre-installed on the device.  Almost
all of the Google libraries, like Play Services, Google Admob, and
GCM, are proprietary and cannot be included in the main F-Droid
repository.


### Which build system to use?

We have good support for "ant" and "gradle" based builds, while "maven"
was only used for a short period of time and for dependencies. For other
build systems, you might have to provide us some detailed information on
how to handle that, so we can setup the app correctly or maybe even
incorporate them into our server tools.

Special note on Cordova/Phonegap/HTML-Apps:

We cannot build cordova apps directly, but recent version allows you to
export the platform-specific code that can be build standalone using
"gradle". So for now we require this code to be present and up-to-date
in the source repository.


### How do I get my app removed?

Ok, this isn't a frequently asked question, but: To get your app
removed, you could use a license for future versions that prohibits
anyone from distributing it, or you could introduce proprietary binaries
into your source code. Both of those things will ensure that those
future versions do not appear in our repository, but you would have to
go a lot further (e.g. serious security flaws in the previous versions,
combined with unpublished source code and an uncooperative attitude) for
us to actually remove the whole application.

If, for whatever reason, you would simply prefer us not to distribute
the app then we can only apologise. You deserve respect for your work
which you've released under a Free Software license, and it wouldn't be
pleasant for us to have to go against your wishes. However, the
alternative is for us to deny use of the software to all our users.


### I see apps on the big stores that are blatant copies. Wouldn't it be better if I made my app closed source?

Firstly, it depends on the license: unless you apply a copyleft licence
like the GPLv3, other people can do whatever they like with the source
code (though they may be required to rebrand it). If your app is GPLv3
and no source code is published by the plagiarists; their versions
obviously include proprietary ad libraries, or any sign of your
authorship was simply removed, those copies are breaking the law and you
should [demand Google](https://www.google.com/android_dmca.html) to
remove them from their app store. You may threaten them with DMCA or
other local laws if you wish. If all else fails, before going
proprietary, balance the loss and confusion to the users and maintainers
of the free app against the feeling of justice that you'll get by seeing
those illegal clones lose the few cents in ad revenue that they would
have got. In the longer run we want to improve donations via F-Droid so
you can be supported financially and we already support Bitcoin, Litecoin,
OpenCollective, Flattr and Liberapay as well as any other payment method
that you can suggest via a website.


### How is the F-Droid client git workflow structured?

`git` allows tons of flexibility in the workflow of how people work
together, so it is important to clearly define the workflow of this
community so that people know what to expect. The `git` workflow the
F-Droid client app uses is relatively simple and based on the very common
workflow established by github.com, gitlab.com and others like it.
Here's a break down of what that means:

-   all development work happens in the `master` branch
-   code is submitted for inclusion via Merge Requests (MRs)
-   releases happen in a short-lived, stable release branch per major
    release (e.g. `stable-0.95`, `stable-0.96`, `stable-0.97`, etc.)
-   the work that goes into the stable release branch must be tightly
    focused and as small as possible to keep the release cycle as short
    as possible
-   the `master` branch must never be merged with any stable release
    branch
-   stable release branches must never be merged with the `master`
    branch
-   Merge Requests for a stable release branch can include commits from
    `master`
-   not all commits that are included in a stable release branch are
    required to be in `master`
-   what you do in your git forks is up to you, but the final merge
    request should not include merge commits

Here is the discussion from the meeting where we nailed this down:
<https://web.archive.org/web/20171220230923/https://botbot.me/freenode/fdroid-dev/2015-08-04/?msg=46407489&page=1>

This article includes a good discussion of "feature branches" versus
"release branches" and short-lived vs. long-lived branches:
<http://blogs.atlassian.com/2013/11/the-essence-of-branch-based-workflows/>
