---
layout: page
permalink: /manual/
description: 'F-Droid Server Manual'
keywords: 'F-Droid Server Manual'
title: 'F-Droid Server Manual'
---

## 2 System Requirements<a name="System-Requirements"></a>


The system requirements for using the tools will vary depending on your
intended usage. At the very least, you’ll need:

-   GNU/Linux
-   Python 3.4 or later
-   The Android SDK Tools and Build-tools. Note that F-Droid does not
    assume that you have the Android SDK in your `PATH`: these
    directories will be specified in your repository configuration.
    Recent revisions of the SDK have `aapt` located in
    android-sdk/build-tools/ and it may be necessary to make a symlink
    to it in android-sdk/platform-tools/

If you intend to build applications from source you’ll also need most,
if not all, of the following:

-   JDK (Debian package openjdk-6-jdk): openjdk-6 is recommended though
    openjdk-7 should work too
-   VCS clients: svn, git, git-svn, hg, bzr
-   A keystore for holding release keys. (Safe, secure and well
    backed up!)

If you intend to use the ’Build Server’ system, for secure and clean
builds (highly recommended), you will also need:

-   VirtualBox (debian package virtualbox)
-   Ruby (debian packages ruby and rubygems)
-   Vagrant (debian package vagrant - 1.4.x or higher required)
-   vagrant-cachier plugin (unpackaged): ‘vagrant plugin install
    vagrant-cachier‘
-   Paramiko (debian package python-paramiko)
-   Imaging (debian package python-imaging)

On the other hand, if you want to build the apps directly on your system
without the ’Build Server’ system, you may need:

-   All SDK platforms requested by the apps you want to build (The
    Android SDK is made available by Google under a proprietary license
    but within that, the SDK platforms, support library and some other
    components are under the Apache license and source code is provided.
    Google APIs, used for building apps using Google Maps, are free to
    the extent that the library comes pre-installed on the device.
    Google Play Services, Google Admob and others are proprietary and
    shouldn’t be included in the main F-Droid repository.)
-   A version of the Android NDK
-   Ant with Contrib Tasks (Debian packages ant and ant-contrib)
-   Maven (Debian package maven)
-   JavaCC (Debian package javacc)
-   Miscellaneous packages listed in
    buildserver/cookbooks/fdroidbuild-general/recipes/default.rb of the
    F-Droid server repository


## 3 Setup<a name="Setup"></a>


Because the tools and data will always change rapidly, you will almost
certainly want to work from a git clone of the tools at this stage. To
get started:

```
git clone https://gitlab.com/fdroid/fdroidserver.git
```

You now have lots of stuff in the fdroidserver directory, but the most
important is the ’fdroid’ command script which you run to perform all
tasks. This script is always run from a repository data directory, so
the most sensible thing to do next is to put your new fdroidserver
directory in your `PATH`.


### 3.1 Data<a name="Data"></a>

To do anything, you’ll need at least one repository data directory. It’s
from this directory that you run the `fdroid` command to perform all
repository management tasks. You can either create a brand new one, or
grab a copy of the data used by the main F-Droid repository:

```
git clone https://gitlab.com/fdroid/fdroiddata.git
```

Regardless of the intended usage of the tools, you will always need to
set up some basic configuration details. This is done by creating a file
called `config.py` in the data directory. You should do this by copying
the example file (`./examples/config.py`) from the fdroidserver project
to your data directory and then editing according to the instructions
within.

Once configured in this way, all the functionality of the tools is
accessed by running the `fdroid` command. Run it on its own to get a
list of the available sub-commands.

You can follow any command with `--help` to get a list of additional
options available for that command.

```
fdroid update --help
```


## 4 Simple Binary Repository<a name="Simple-Binary-Repository"></a>

If you want to maintain a simple repository hosting only binary APKs
obtained and compiled elsewhere, the process is quite simple:

1.  Set up the server tools, as described in Setup.
2.  Make a directory for your repository. This is the directory from
    which you will do all the work with your repository. Create a config
    file there, called `config.py`, by copying `./examples/config.py`
    from the server project and editing it.
3.  Within that, make a directory called `repo` and put APK files in it.
4.  Run `fdroid update`.
5.  If it reports that any metadata files are missing, you can create
    them in the `metadata` directory and run it again.
6.  To ease creation of metadata files, run `fdroid update` with the
    `-c` option. It will create ’skeleton’ metadata files that are
    missing, and you can then just edit them and fill in the details.
7.  Then, if you’ve changed things, run `fdroid update` again.
8.  Running `fdroid update` adds an Icons directory into the repo
    directory, and also creates the repository index (index.xml, and
    also index.jar if you’ve configured the system to use a
    signed index).
9.  Publish the resulting contents of the `repo` directory to your
    web server.

Following the above process will result in a `repo` directory, which you
simply need to push to any HTTP (or preferably HTTPS) server to make it
accessible.

While some information about the applications (and versions thereof) is
retrieved directly from the APK files, most comes from the corresponding
file in the `metadata` directory. The metadata file covering ALL
versions of a particular application is named `package.id.txt` where
package.id is the unique identifier for that package.

See the Metadata chapter for details of what goes in the metadata file.
All fields are relevant for binary APKs, EXCEPT for `Build:` entries,
which should be omitted.



## 5 Building Applications<a name="Building-Applications"></a>

Instead of (or as well as) including binary APKs from external sources
in a repository, you can build them directly from the source code.

Using this method, it is is possible to verify that the application
builds correctly, corresponds to the source code, and contains only free
software. Unforunately, in the Android world, it seems to be very common
for an application supplied as a binary APK to present itself as Free
Software when in fact some or all of the following are true:

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


### 5.1 More about "fdroid build"<a name="More-about-fdroid-build"></a>

When run without any parameters, `fdroid build` will build any and all
versions of applications that you don’t already have in the `repo`
directory (or more accurately, the `unsigned` directory). There are
various other things you can do. As with all the tools, the `--help`
option is your friend, but a few annotated examples and discussion of
the more common usage modes follows:

To build a single version of a single application, you could run the
following:

```
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

```
fdroid publish
```

The source tarball would move to the `repo` directory (which is the
directory you would push to your web server). A signed and zip-aligned
version of the APK would also appear there, and both files would be
removed from the `unsigned` directory.

If you’re building purely for the purposes of testing, and not intending
to push the results to a repository, at least yet, the `--test` option
can be used to direct output to the `tmp` directory instead of
`unsigned`. A similar effect could by achieved by simply deleting the
output files from `unsigned` after the build, but with the risk of
forgetting to do so!

Along similar lines (and only in conjunction with `--test`, you can use
`--force` to force a build of a Disabled application, where normally it
would be completely ignored. Similarly a version that was found to
contain ELFs or known non-free libraries can be forced to build. See
also — `scanignore=` and `scandelete=` in the `Build:` section.

If the build was unsuccessful, you can find out why by looking at the
output in the logs/ directory. If that isn’t illuminating, try building
the app the regular way, step by step: android update project,
ndk-build, ant debug.

Note that source code repositories often contain prebuilt libraries. If
the app is being considered for the main F-Droid repository, it is
important that all such prebuilts are built either via the metadata or
by a reputable third party.


### 5.2 Running "fdroid build" in your app’s source<a name="Running-fdroid-build-in-your-apps-source"></a>

Another option for using `fdroid build` is to use a metadata file that
is included in the app’s source itself, rather than in a `metadata/`
folder with lots of other apps. This metadata file should be in the root
of your source repo, and be called `.fdroid.json`, `.fdroid.xml`,
`.fdroid.yaml`, or `.fdroid.txt`, depending on your preferred data
format: JSON, XML, YAML, or F-Droid’s `.txt` format.

Once you have that setup, you can build the most recent version of the
app using the whole FDroid stack by running:

```
fdroid build
```

If you want to build every single version, then specify `--all`.


### 5.3 Direct Installation<a name="Direct-Installation"></a>

You can also build and install directly to a connected device or
emulator using the `fdroid install` command. If you do this without
passing packages as arguments then all the latest built and signed
version available of each package will be installed . In most cases,
this will not be what you want to do, so execution will stop straight
away. However, you can override this if you’re sure that’s what you
want, by using `--all`. Note that currently, no sanity checks are
performed with this mode, so if the files in the signed output directory
were modified, you won’t be notified.



## 6 Importing Applications<a name="Importing-Applications"></a>

To help with starting work on including a new application, use
`fdroid import` to set up a new template project. It has two modes of
operation, starting with a cloned git repo:

```
git clone https://gitlab.com/fdroid/fdroidclient
cd fdroidclient
fdroid import
```

Or starting with a URL to a project page:

```
fdroid import --url=http://address.of.project
```

When a URL is specified using the `--url=` flag, `fdroid import` will
use that URL to find out information about the project, and if it finds
a git repo, it will also clone that. For this to work, the URL must
point to a project format that the script understands. Currently this is
limited to one of the following:

1.  GitLab - `https://gitlab.com/PROJECTNAME/REPONAME`
2.  Gitorious - `https://gitorious.org/PROJECTNAME/REPONAME`
3.  Github - `https://github.com/USER/PROJECT`
4.  Google Code - `http://code.google.com/p/PROJECT/` Supports git, svn
    and hg repos.

    Some Google Code projects have multiple repositories, identified by
    a dropdown list on the `source/checkout` page. To access one other
    than the default, specify its name using the `--repo` switch.

5.  Bitbucket - `https://bitbucket.org/USER/PROJECT/`
6.  Git - `git://REPO`

Depending on the project type, more or less information may be gathered.
For example, the license will be retrieved from a Google Code project,
but not a GitHub one. A bare repo url, such as the git:// one, is the
least preferable optional of all, since you will have to enter much more
information manually.

If the import is successful, a metadata file will be created. You will
need to edit this further to check the information, and fill in the
blanks.

If it fails, you’ll be told why. If it got as far as retrieving the
source code, you can inspect it further by looking in `tmp/importer`
where a full checkout will exist.

A frequent cause of initial failure is that the project directory is
actually a subdirectory in the repository. In this case, run the
importer again using the `--subdir` option to tell it where. It will not
attempt to determine this automatically, since there may be several
options.




## 8 Update Processing<a name="Update-Processing"></a>

### 8.1 Detecting<a name="Detecting"></a>

There are various mechanisms in place for automatically detecting that
updates are available for applications, with the `Update Check Mode`
field in the metadata determining which method is used for a particular
application.

Running the `fdroid checkupdates` command will apply this method to each
application in the repository and update the `Current Version` and
`Current Version Code` fields in the metadata accordingly.

As usual, the `-p` option can be used with this, to restrict processing
to a particular application.

Note that this only updates the metadata such that we know what the
current published/recommended version is. It doesn’t make that version
available in the repository - for that, see the next section.


### 8.2 Adding<a name="Adding"></a>

Adding updates (i.e. new versions of applications already included in
the repository) happens in two ways. The simple case is applications
where the APK files are binaries, retrieved from a developer’s published
build. In this case, all that’s required is to place the new binary in
the `Repo` directory, and the next run of `fdroid update` will pick it
up.

For applications built from source, it is necessary to add a new
`Build Version` line to the metadata file. At the very least, the
version name, version code and commit will be different. It is also
possible that the additional build flags will change between versions.

For processing multiple updates in the metadata at once, it can be
useful to run `fdroid update --interactive`. This will check all the
applications in the repository, and where updates are required you will
be prompted to \[E\]dit the metadata, \[I\]gnore the update, or \[Q\]uit
altogether.


## 9 Build Server<a name="Build-Server"></a>

The Build Server system isolates the builds for each package within a
clean, isolated and secure throwaway virtual machine environment.


### 9.1 Overview<a name="Overview-2"></a>

Building applications in this manner on a large scale, especially with
the involvement of automated and/or unattended processes, could be
considered a dangerous pastime from a security perspective. This is even
more the case when the products of the build are also distributed widely
and in a semi-automated ("you have updates available") fashion.

Assume that an upstream source repository is compromised. A small
selection of things that an attacker could do in such a situation:

1.  Use custom Ant build steps to execute virtually anything as the user
    doing the build.
2.  Access the keystore.
3.  Modify the built apk files or source tarballs for other applications
    in the repository.
4.  Modify the metadata (which includes build scripts, which again, also
    includes the ability to execute anything) for other applications in
    the repository.

Through complete isolation, the repurcussions are at least limited to
the application in question. Not only is the build environment fresh for
each build, and thrown away afterwards, but it is also isolated from the
signing environment.

Aside from security issues, there are some applications which have
strange requirements such as custom versions of the NDK. It would be
impractical (or at least extremely messy) to start modifying and
restoring the SDK on a multi-purpose system, but within the confines of
a throwaway single-use virtual machine, anything is possible.

All this is in addition to the obvious advantage of having a
standardised and completely reproducible environment in which builds are
made. Additionally, it allows for specialised custom build environments
for particular applications.


### 9.2 Setting up a build server<a name="Setting-up-a-build-server"></a>

In addition to the basic setup previously described, you will also need
a Vagrant-compatible Debian Testing base box called ’jessie64’.

You can use a different version or distro for the base box, so long as
you don’t expect any help making it work. One thing to be aware of is
that working copies of source trees are moved from the host to the
guest, so for example, having subversion v1.6 on the host and v1.7 on
the guest would fail.


#### 9.2.1 Creating the Debian base box<a name="Creating-the-Debian-base-box"></a>

The output of this step is a minimal Debian VM that has support for
remote login and provisioning.

Unless you’re very trusting, you should create one of these for yourself
from verified standard Debian installation media. However, by popular
demand, the `makebuildserver` script will automatically download a
prebuilt image unless instructed otherwise. If you choose to use the
prebuilt image, you may safely skip the rest of this section.

Documentation for creating a base box can be found at
<https://www.vagrantup.com/docs/boxes/base.html>.

In addition to carefully following the steps described there, you should
consider the following:

1.  It is advisable to disable udev network device persistence,
    otherwise any movement of the VM between machines, or
    reconfiguration, will result in broken networking.

    For a Debian/Ubuntu default install, just
    `touch /etc/udev/rules.d/75-persistent-net-generator.rules` to turn
    off rule generation, and at the same time, get rid of any rules it’s
    already created in `/etc/udev/rules.d/70-persistent-net.rules`.

2.  Unless you want the VM to become totally inaccessible following a
    failed boot, you need to set `GRUB_RECORDFAIL_TIMEOUT` to a value
    other than -1 in `/etc/grub/default` and then run `update-grub`.


#### 9.2.2 Creating the F-Droid base box<a name="Creating-the-F-Droid-base-box"></a>

The next step in the process is to create `makebs.config.py`, using
`./examples/makebs.config.py` as a reference - look at the settings and
documentation there to decide if any need changing to suit your
environment. There is a path for retrieving the base box if it doesn’t
exist, and an apt proxy definition, both of which may need customising
for your environment. You can then go to the `fdroidserver` directory
and run this:

```
./makebuildserver
```

This will take a long time, and use a lot of bandwidth - most of it
spent installing the necessary parts of the Android SDK for all the
various platforms. Luckily you only need to do it occasionally. Once you
have a working build server image, if the recipes change (e.g. when
packages need to be added) you can just run that script again and the
existing one will be updated in place.

The main sdk/ndk downloads will automatically be cached to speed things
up the next time, but there’s no easy way of doing this for the longer
sections which use the SDK’s `android` tool to install platforms,
add-ons and tools. However, instead of allowing automatic caching, you
can supply a pre-populated cache directory which includes not only these
downloads, but also .tar.gz files for all the relevant additions. If the
provisioning scripts detect these, they will be used in preference to
running the android tools. For example, if you have
`buildserver/addons/cache/platforms/android-19.tar.gz` that will be used
when installing the android-19 platform, instead of re-downloading it
using `android update sdk --no-ui -t android-19`. It is possible to
create the cache files of this additions from a local installation of
the SDK including these:

```
cd /path/to/android-sdk/platforms
tar czf android-19.tar.gz android-19
mv android-19.tar.gz /path/to/buildserver/addons/cache/platforms/
```

If you have already built a buildserver it is also possible to get this
files directly from the buildserver:

```
vagrant ssh -- -C 'tar -C ~/android-sdk/platforms czf android-19.tar.gz android-19'
vagrant ssh -- -C 'cat ~/android-sdk/platforms/android-19.tar.gz' > /path/to/fdroidserver/buildserver/cache/platforms/android19.tar.gz
```

Once it’s complete you’ll have a new base box called ’buildserver’ which
is what’s used for the actual builds. You can then build packages as
normal, but with the addition of the `--server` flag to `fdroid build`
to instruct it to do all the hard work within the virtual machine.

The first time a build is done, a new virtual machine is created using
the ’buildserver’ box as a base. A snapshot of this clean machine state
is saved for use in future builds, to improve performance. You can force
discarding of this snapshot and rebuilding from scratch using the
`--resetserver` switch with `fdroid build`.
