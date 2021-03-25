---
layout: page
title: Building Applications

---

Instead of (or as well as) including binary APKs from external sources
in a repository, you can build them directly from the source code.

Using this method, it is is possible to verify that the application
builds correctly, corresponds to the source code, and contains only free
software. Unfortunately, in the Android world, it seems to be very common
for an application supplied as a binary APK to present itself as Free
Software when in fact some if not all of the following is true:

1.  The source code (either for a particular version, or even
    all versions!) is unavailable or incomplete.
2.  The source code is not capable of producing the actual
    binary supplied.
3.  The ’source code’ contains binary files of unknown origin, or with
    proprietary licenses.

For this reason, source-built applications are the preferred method for
the main F-Droid repository, although occasionally for technical or
historical reasons, exceptions are made to this policy.

When building applications from source, it should be noted that you will
be signing them (all APK files must be signed to be installable on
Android) with your own key. When an application is already installed on
a device, it is not possible to upgrade it in place to a new version
signed with a different key without first uninstalling the original.
This may present an inconvenience to users, as the process of
uninstalling loses any data associated with the previous installation.

The process for managing a repository for built-from-source applications
is very similar to that described in the Simple Binary Repository
chapter, except now you need to:

1.  Include Build entries in the metadata files.
2.  Run `fdroid build` to build any applications that are not
    already built.
3.  Run `fdroid publish` to finalise packaging and sign any APKs that
    have been built.


### App data directory aka _fdroiddata_

To do anything, you’ll need at least one repository data directory. It’s
from this directory that you run the `fdroid` command to perform all
repository management tasks. You can either create a brand new one, or
grab a copy of the data used by the main F-Droid repository:

```bash
git clone https://gitlab.com/fdroid/fdroiddata.git
```

Regardless of the intended usage of the tools, you will always need to
set up some basic configuration details. This is done by creating a file
called _config.yml_ in the data directory. You should do this by copying
the example file (`./examples/config.yml`) from the fdroidserver project
to your data directory and then editing according to the instructions
within.

Once configured in this way, all the functionality of the tools is
accessed by running the `fdroid` command. Run it on its own to get a
list of the available sub-commands.

You can follow any command with `--help` to get a list of additional
options available for that command.

```bash
fdroid update --help
```


### More about `fdroid build`

When run without any parameters, `fdroid build` will build any and all
versions of applications that you don’t already have in the `repo`
directory (or more accurately, the `unsigned` directory). There are
various other things you can do. As with all the tools, the `--help`
option is your friend, but a few annotated examples and discussion of
the more common usage modes follows:

To build a single version of a single application, you could run the
following:

```bash
fdroid build org.fdroid.fdroid:16
```

This attempts to build version code 16 (which is version 0.25) of the
F-Droid client. Many of the tools recognise arguments as packages,
allowing their activity to be limited to just a limited set of packages.

If the build above was successful, two files will have been placed in
the `unsigned` directory:

```
org.fdroid.fdroid_16.apk
org.fdroid.fdroid_16_src.tar.gz
```

The first is the (unsigned) APK. You could sign this with a debug key
and push it direct to your device or an emulator for testing. The second
is a source tarball containing exactly the source that was used to
generate the binary.

If you were intending to publish these files, you could then run:

```bash
fdroid publish
```

The source tarball would move to the `repo` directory (which is the
directory you would push to your web server). A signed and zipaligned
version of the APK would also appear there, and both files would be
removed from the `unsigned` directory.

If you’re building purely for the purposes of testing, and not intending
to push the results to a repository, at least yet, the `--test` option
can be used to direct output to the `tmp` directory instead of
`unsigned`. A similar effect could be achieved by simply deleting the
output files from `unsigned` after the build, but with the risk of
forgetting to do so!

Along similar lines (and only in conjunction with `--test`, you can use
`--force` to force a build of a Disabled application, where normally it
would be completely ignored. Similarly a version that was found to
contain ELFs or known Non-Free libraries can be forced to build. See
also — _scanignore_ and _scandelete_ in the _Builds_ section.

If the build was unsuccessful, you can find out why by looking at the
output in the _logs/_ directory. If that isn’t illuminating, try building
the app the regular way, step by step: android update project,
ndk-build, ant debug.

Note that source code repositories often contain prebuilt libraries. If
the app is being considered for the main F-Droid repository, it is
important that all such prebuilts are built either via the metadata or
by a reputable third party.


### Running `fdroid build` in your app’s source

Another option for using `fdroid build` is to use a metadata file that
is included in the app’s source itself, rather than in a _metadata/_
folder with lots of other apps. The _.fdroid.yml_ metadata file should
be in the root of your source repo.

Once you have that setup, you can build the most recent version of the
app using the whole F-Droid stack by running:

```bash
fdroid build
```

If you want to build every single version, then specify `--all`.


### Direct Installation

You can also build and install directly to a connected device or
emulator using the `fdroid install` command. If you do this without
passing packages as arguments then all the latest built and signed
version available of each package will be installed . In most cases,
this will not be what you want to do, so execution will stop straight
away. However, you can override this if you’re sure that’s what you
want, by using `--all`. Note that currently, no sanity checks are
performed with this mode, so if the files in the signed output directory
were modified, you won’t be notified.
