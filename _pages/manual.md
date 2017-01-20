---
layout: page
permalink: /manual
description: 'F-Droid Server Manual'
keywords: 'F-Droid Server Manual'
title: 'F-Droid Server Manual'
---

## Table of Contents

-   [1 Overview](#Overview)
-   [2 System Requirements](#System-Requirements)
-   [3 Setup](#Setup)
    -   [3.1 Data](#Data)
-   [4 Simple Binary Repository](#Simple-Binary-Repository)
-   [5 Building Applications](#Building-Applications)
    -   [5.1 More about "fdroid build"](#More-about-fdroid-build)
    -   [5.2 Running "fdroid build" in your app’s source](#Running-fdroid-build-in-your-apps-source)
    -   [5.3 Direct Installation](#Direct-Installation)
-   [6 Importing Applications](#Importing-Applications)
-   [7 Metadata](#Metadata)
    -   [7.1 Categories](#Categories)
    -   [7.2 Author Name](#Author-Name)
    -   [7.3 Author Email](#Author-Email)
    -   [7.4 License](#License)
    -   [7.5 Auto Name](#Auto-Name)
    -   [7.6 Name](#Name)
    -   [7.7 Provides](#Provides)
    -   [7.8 Web Site](#Web-Site)
    -   [7.9 Source Code](#Source-Code)
    -   [7.10 Issue Tracker](#Issue-Tracker)
    -   [7.11 Changelog](#Changelog)
    -   [7.12 Donate](#Donate)
    -   [7.13 FlattrID](#FlattrID)
    -   [7.14 Bitcoin](#Bitcoin)
    -   [7.15 Litecoin](#Litecoin)
    -   [7.16 Summary](#Summary)
    -   [7.17 Description](#Description)
    -   [7.18 Maintainer Notes](#Maintainer-Notes)
    -   [7.19 Repo Type](#Repo-Type)
    -   [7.20 Repo](#Repo)
    -   [7.21 Binaries](#Binaries)
    -   [7.22 Build](#Build)
    -   [7.23 AntiFeatures](#AntiFeatures)
    -   [7.24 Disabled](#Disabled)
    -   [7.25 Requires Root](#Requires-Root)
    -   [7.26 Archive Policy](#Archive-Policy)
    -   [7.27 Update Check Mode](#Update-Check-Mode)
    -   [7.28 Vercode Operation](#Vercode-Operation)
    -   [7.29 Update Check Ignore](#Update-Check-Ignore)
    -   [7.30 Update Check Name](#Update-Check-Name)
    -   [7.31 Update Check Data](#Update-Check-Data)
    -   [7.32 Auto Update Mode](#Auto-Update-Mode)
    -   [7.33 Current Version](#Current-Version)
    -   [7.34 Current Version Code](#Current-Version-Code)
    -   [7.35 No Source Since](#No-Source-Since)
-   [8 Update Processing](#Update-Processing)
    -   [8.1 Detecting](#Detecting)
    -   [8.2 Adding](#Adding)
-   [9 Build Server](#Build-Server)
    -   [9.1 Overview](#Overview-2)
    -   [9.2 Setting up a build server](#Setting-up-a-build-server)
        -   [9.2.1 Creating the Debian base
            box](#Creating-the-Debian-base-box)
        -   [9.2.2 Creating the F-Droid base
            box](#Creating-the-F_002dDroid-base-box)
-   [10 Signing](#Signing)
    -   [10.1 Repo Index Signing](#Repo-Index-Signing)
    -   [10.2 Package Signing](#Package-Signing)


# F-Droid Server

This manual is for the F-Droid repository server tools.

Copyright © 2010, 2011, 2012, 2013, 2014, 2015 Ciaran Gultnieks

Copyright © 2011 Henrik Tunedal, Michael Haas, John Sullivan

Copyright © 2013 David Black

Copyright © 2013, 2014, 2015 Daniel Martí

Copyright © 2015 Boris Kraut

Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.3 or
any later version published by the Free Software Foundation; with no
Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts. A
copy of the license is included in the section entitled "GNU Free
Documentation License".


## 1 Overview<a name="Overview"></a>

The F-Droid server tools provide various scripts and tools that are used
to maintain the main F-Droid application repository. You can use these
same tools to create your own additional or alternative repository for
publishing, or to assist in creating, testing and submitting metadata to
the main repository.


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



## 7 Metadata<a name="Metadata"></a>

Information used by update.py to compile the public index comes from two
sources:

1.  the APK files in the repo directory, and
2.  the metadata files in the metadata directory.

The original metadata files are simple, easy to edit text files, always
named as the application’s package ID with ’.txt’ appended.
Additionally, you can use JSON, XML, or YAML for app metadata, using the
same fields as the original ’.txt’ format.

Note that although the metadata files are designed to be easily read and
writable by humans, they are also processed and written by various
scripts. The original ’.txt’ format can be automatically cleaned up when
necessary. The structure and comments will be preserved correctly,
although the order of fields will be standardised. (In the event that
the original file was in a different order, comments are considered as
being attached to the field following them). In fact, you can
standardise all the ’.txt’ metadata in a single command, without
changing the functional content, by running:

```
fdroid rewritemeta
```

Or just run it on a specific app:

```
fdroid rewritemeta org.adaway
```

The following sections describe the fields recognised within the file.

  -------------------------------------------------- ---- --
  • [Categories](#Categories):                            
  • [Author Name](#Author-Name):                          
  • [Author Email](#Author-Email):                        
  • [License](#License):                                  
  • [Auto Name](#Auto-Name):                              
  • [Name](#Name):                                        
  • [Provides](#Provides):                                
  • [Web Site](#Web-Site):                                
  • [Source Code](#Source-Code):                          
  • [Issue Tracker](#Issue-Tracker):                      
  • [Changelog](#Changelog):                              
  • [Donate](#Donate):                                    
  • [FlattrID](#FlattrID):                                
  • [Bitcoin](#Bitcoin):                                  
  • [Litecoin](#Litecoin):                                
  • [Summary](#Summary):                                  
  • [Description](#Description):                          
  • [Maintainer Notes](#Maintainer-Notes):                
  • [Repo Type](#Repo-Type):                              
  • [Repo](#Repo):                                        
  • [Binaries](#Binaries):                                
  • [Build](#Build):                                      
  • [AntiFeatures](#AntiFeatures):                        
  • [Disabled](#Disabled):                                
  • [Requires Root](#Requires-Root):                      
  • [Archive Policy](#Archive-Policy):                    
  • [Update Check Mode](#Update-Check-Mode):              
  • [Update Check Ignore](#Update-Check-Ignore):          
  • [Vercode Operation](#Vercode-Operation):              
  • [Update Check Name](#Update-Check-Name):              
  • [Update Check Data](#Update-Check-Data):              
  • [Auto Update Mode](#Auto-Update-Mode):                
  • [Current Version](#Current-Version):                  
  • [Current Version Code](#Current-Version-Code):        
  • [No Source Since](#No-Source-Since):                  
  -------------------------------------------------- ---- --



### 7.1 Categories<a name="Categories"></a>

Any number of categories for the application to be placed in. There is
no fixed list of categories - both the client and the web site will
automatically show any categories that exist in any applications.
However, if your metadata is intended for the main F-Droid repository,
you should use one of the existing categories (look at the site/client),
or discuss the proposal to add a new one.

Categories must be separated by a single comma character, ’,’. For
backwards compatibility, F-Droid will use the first category given as
&lt;category&gt; element for older clients to at least see one category.

This is converted to (`<categories>`) in the public index file.



### 7.2 Author Name<a name="Author-Name"></a>


The name of the author, either full, abbreviated or pseudonym. If
present, it should represent the name(s) as published by upstream, e.g.
in their copyright or authors file. This can be omitted (or left blank).

This is converted to (`<author>`) in the public index file.


### 7.3 Author Email<a name="Author-Email"></a>


The e-mail address of the author(s). This can be omitted (or left
blank).

This is converted to (`<email>`) in the public index file.



### 7.4 License<a name="License"></a>


The overall license for the application, or in certain cases, for the
source code only.

Common values:

-   ‘GPLv2’ GNU GPL version 2
-   ‘GPLv2+’ GNU GPL version 2 or later
-   ‘GPLv3’ GNU GPL version 3
-   ‘GPLv3+’ GNU GPL version 3 or later
-   ‘GPL’ An unspecified GPL version. Use this only as a last resort or
    if there is some confusion over compatiblity of component licenses:
    particularly the use of Apache libraries with GPLv2 source code.
-   ‘AGPL’ Afferro GPL version 3.
-   ‘Apache2’ Apache 2
-   ‘MIT’ MIT X11 license
-   ‘BSD’ BSD license - the original ’4-clause’ version.
-   ‘NewBSD’ BSD license - the new, or modified, version.

This is converted to (`<license>`) in the public index file.



### 7.5 Auto Name<a name="Auto-Name"></a>


The name of the application as can best be retrieved from the source
code. This is done so that the commitupdates script can put a familiar
name in the description of commits created when a new update of the
application is found. The Auto Name entry is generated automatically
when `fdroid checkupdates` is run.


### 7.6 Name<a name="Name"></a>


The name of the application. Normally, this field should not be present
since the application’s correct name is retrieved from the APK file.
However, in a situation where an APK contains a bad or missing
application name, it can be overridden using this. Note that this only
overrides the name in the list of apps presented in the client; it
doesn’t changed the name or application label in the source code.



### 7.7 Provides<a name="Provides"></a>


Comma-separated list of application IDs that this app provides. In other
words, if the user has any of these apps installed, F-Droid will show
this app as installed instead. It will also appear if the user clicks on
urls linking to the other app IDs. Useful when an app switches package
name, or when you want an app to act as multiple apps.



### 7.8 Web Site<a name="Web-Site"></a>


The URL for the application’s web site. If there is no relevant web
site, this can be omitted (or left blank).

This is converted to (`<web>`) in the public index file.


### 7.9 Source Code<a name="Source-Code"></a>


The URL to view or obtain the application’s source code. This should be
something human-friendly. Machine-readable source-code is covered in the
’Repo’ field.

This is converted to (`<source>`) in the public index file.


### 7.10 Issue Tracker<a name="Issue-Tracker"></a>


The URL for the application’s issue tracker. Optional, since not all
applications have one.

This is converted to (`<tracker>`) in the public index file.


### 7.11 Changelog<a name="Changelog"></a>


The URL for the application’s changelog. Optional, since not all
applications have one.

This is converted to (`<changelog>`) in the public index file.



### 7.12 Donate<a name="Donate"></a>


The URL to donate to the project. This should be the project’s donate
page if it has one.

It is possible to use a direct PayPal link here, if that is all that is
available. However, bear in mind that the developer may not be aware of
that direct link, and if they later changed to a different PayPal
account, or the PayPal link format changed, things could go wrong. It is
always best to use a link that the developer explicitly makes public,
rather than something that is auto-generated ’button code’.

This is converted to (`<donate>`) in the public index file.


### 7.13 FlattrID<a name="FlattrID"></a>


The project’s Flattr (http://flattr.com) ID, if it has one. This should
be a numeric ID, such that (for example) https://flattr.com/thing/xxxx
leads directly to the page to donate to the project.

This is converted to (`<flattr>`) in the public index file.



### 7.14 Bitcoin<a name="Bitcoin"></a>


A bitcoin address for donating to the project.

This is converted to (`<bitcoin>`) in the public index file.


### 7.15 Litecoin<a name="Litecoin"></a>


A litecoin address for donating to the project.



### 7.16 Summary<a name="Summary"></a>


A brief summary of what the application is. Since the summary is only
allowed one line on the list of the F-Droid client, keeping it to within
80 characters will ensure it fits most screens.


### 7.17 Description<a name="Description"></a>


A full description of the application, relevant to the latest version.
This can span multiple lines (which should be kept to a maximum of 80
characters), and is terminated by a line containing a single ’.’.

Basic MediaWiki-style formatting can be used. Leaving a blank line
starts a new paragraph. Surrounding text with `''` make it italic, and
with `'''` makes it bold.

You can link to another app in the repo by using `[[app.id]]`. The link
will be made appropriately whether in the Android client, the web repo
browser or the wiki. The link text will be the apps name.

Links to web addresses can be done using `[http://example.com Text]`.

Bulletted lists are done by simply starting each item with a `*` on a
new line, and numbered lists are the same but using `#`. There is
currently no support for nesting lists - you can have one level only.

It can be helpful to note information pertaining to updating from an
earlier version; whether the app contains any prebuilts built by the
upstream developers or whether non-free elements were removed; whether
the app is in rapid development or whether the latest version lags
behind the current version; whether the app supports multiple
architectures or whether there is a maximum SDK specified (such info not
being recorded in the index).

This is converted to (`<desc>`) in the public index file.



### 7.18 Maintainer Notes<a name="Maintainer-Notes"></a>


This is a multi-line field using the same rules and syntax as the
description. It’s used to record notes for F-Droid maintainers to assist
in maintaining and updating the application in the repository.

This information is also published to the wiki.



### 7.19 Repo Type<a name="Repo-Type"></a>


The type of repository - for automatic building from source. If this is
not specified, automatic building is disabled for this application.
Possible values are:

-   ‘git’
-   ‘svn’
-   ‘git-svn’
-   ‘hg’
-   ‘bzr’
-   ‘srclib’



### 7.20 Repo<a name="Repo"></a>


The repository location. Usually a git: or svn: URL, for example.

The git-svn option connects to an SVN repository, and you specify the
URL in exactly the same way, but git is used as a back-end. This is
preferable for performance reasons, and also because a local copy of the
entire history is available in case the upstream repository disappears.
(It happens!). In order to use Tags as update check mode for this VCS
type, the URL must have the tags= special argument set. Likewise, if you
intend to use the RepoManifest/branch scheme, you would want to specify
branches= as well. Finally, trunk= can also be added. All these special
arguments will be passed to "git svn" in order, and their values must be
relative paths to the svn repo root dir. Here’s an example of a complex
git-svn Repo URL:
http://svn.code.sf.net/p/project/code/svn;trunk=trunk;tags=tags;branches=branches

If the Repo Type is `srclib`, then you must specify the name of the
according srclib .txt file. For example if `scrlibs/FooBar.txt` exist
and you want to use this srclib, then you have to set Repo to `FooBar`.



### 7.21 Binaries<a name="Binaries"></a>


The location of binaries used in verification process.

If specified, F-Droid will verify the output apk file of a build against
the one specified. You can use %v and %c to point to the version name
and version code of the current build. To verify the F-Droid client
itself you could use:
`Binaries:https://f-droid.org/repo/org.fdroid.fdroid_%c.apk`

F-Droid will use upstream binaries if the verification succeeded.



### 7.22 Build<a name="Build"></a>


Any number of these fields can be present, each specifying a version to
automatically build from source. The value is a comma-separated list.
For example:

‘Build:1.2,12’

The above specifies to build version 1.2, which has a version code of
12. The `commit=` parameter specifies the tag, commit or revision number
from which to build it in the source repository. It is the only
mandatory flag, which in this case could for example be `commit=v1.2`.

In addition to the three, always required, parameters described above,
further parameters can be added (in name=value format) to apply further
configuration to the build. These are (roughly in order of application):

`disable=<message>`

:   Disables this build, giving a reason why. (For backwards
    compatibility, this can also be achieved by starting the commit ID
    with ’!’)

    The purpose of this feature is to allow non-buildable releases (e.g.
    the source is not published) to be flagged, so the scripts don’t
    generate repeated messages about them. (And also to record the
    information for review later). If an apk has already been built,
    disabling causes it to be deleted once `fdroid update` is run; this
    is the procedure if ever a version has to be replaced.

`subdir=<path>`

:   Specifies to build from a subdirectory of the checked out source
    code. Normally this directory is changed to before building,

`submodules=yes`

:   Use if the project (git only) has submodules - causes
    `git submodule update --init --recursive` to be executed after the
    source is cloned. Submodules are reset and cleaned like the main app
    repository itself before each build.

`init=xxxx`

:   As for ’prebuild’, but runs on the source code BEFORE any other
    processing takes place.

    You can use \$\$SDK\$\$, \$\$NDK\$\$, \$\$MVN3\$\$ and \$\$QT\$\$ to
    substitute the paths to the android SDK and NDK directories, maven 3
    executable, and Qt SDK directory respectively. The following
    per-build variables are available likewise: \$\$VERSION\$\$,
    \$\$VERCODE\$\$ and \$\$COMMIT\$\$.

`oldsdkloc=yes`

:   The sdk location in the repo is in an old format, or the build.xml
    is expecting such. The ’new’ format is sdk.dir while the VERY OLD
    format is sdk-location. Typically, if you get a message along the
    lines of: "com.android.ant.SetupTask cannot be found" when trying to
    build, then try enabling this option.

`target=<target>`

:   Specifies a particular SDK target for compilation, overriding the
    value defined in the code by upstream. This has different effects
    depending on what build system used — this flag currently affects
    Ant, Maven and Gradle projects only. Note that this does not change
    the target SDK in the AndroidManifest.xml, which determines the
    level of features that can be included in the build.

    In the case of an Ant project, it modifies project.properties of the
    app and possibly sub-projects. This is likely to cause the whole
    build.xml to be rewritten, which is fine if it’s a ’standard’
    android file or doesn’t already exist, but not a good idea if it’s
    heavily customised.

`update=<auto/dirs>`

:   By default, ’android update’ is used in Ant builds to generate or
    update the project and all its referenced projects. Specifying
    update=no bypasses that. Note that this is useless in builds that
    don’t use Ant.

    Default value is ’`auto`’, which recursively uses the paths in
    project.properties to find all the subprojects to update.

    Otherwise, the value can be a comma-separated list of directories in
    which to run ’android update’ relative to the application directory.

`encoding=xxxx`

:   Adds a java.encoding property to local.properties with the
    given value. Generally the value will be ’utf-8’. This is picked up
    by the SDK’s ant rules, and forces the Java compiler to interpret
    source files with this encoding. If you receive warnings during the
    compile about character encodings, you probably need this.

`forceversion=yes`

:   If specified, the package version in AndroidManifest.xml is replaced
    with the version name for the build as specified in the metadata.

    This is useful for cases when upstream repo failed to update it for
    specific tag; to build an arbitrary revision; to make it apparent
    that the version differs significantly from upstream; or to make it
    apparent which architecture or platform the apk is designed to
    run on.

`forcevercode=yes`

:   If specified, the package version code in the AndroidManifest.xml is
    replaced with the version code for the build. See also forceversion.

`rm=<path1>[,<path2>,...]`

:   Specifies the relative paths of files or directories to delete
    before the build is done. The paths are relative to the base of the
    build directory - i.e. the root of the directory structure checked
    out from the source respository - not necessarily the directory that
    contains AndroidManifest.xml.

    Multiple files/directories can be specified by separating them with
    ’,’. Directories will be recursively deleted.

`extlibs=<lib1>[,<lib2>,...]`

:   Comma-separated list of external libraries (jar files) from the
    `build/extlib` library, which will be placed in the `libs` directory
    of the project.

`srclibs=[n:]a@r,[n:]b@r1,...`

:   Comma-separated list of source libraries or Android projects. Each
    item is of the form name@rev where name is the predefined source
    library name and rev is the revision or tag to use in the respective
    source control.

    For Ant projects, you can optionally append a number with a colon at
    the beginning of a srclib item to automatically place it in
    project.properties as a library under the specified number. For
    example, if you specify `1:somelib@1.0`, F-Droid will automatically
    do the equivalent of the legacy practice
    `prebuild=echo "android.library.reference.1=$$somelib$$" >> project.properties`.

    Each srclib has a metadata file under srclibs/ in the repository
    directory, and the source code is stored in build/srclib/. Repo
    Type: and Repo: are specified in the same way as for apps; Subdir:
    can be a comma separated list, for when directories are renamed by
    upstream; Update Project: updates the projects in the working
    directory and one level down; Prepare: can be used for any kind of
    preparation: in particular if you need to update the project with a
    particular target. You can then also use \$\$name\$\$ in the
    init/prebuild/build command to substitute the relative path to the
    library directory, but it could need tweaking if you’ve changed into
    another directory.

    Currently srclibs are necessary when upstream uses jar files or
    pulls dependencies from non-trusted repositories. While there is no
    guarantee that those binaries are free and correspondent to the
    source code, F-Droid allows the following known repositories until a
    source-built alternative is available:

    -   ‘mavenCentral’ - the original repo, hardcoded in Maven
        and Gradle.
    -   ‘jCenter’ - hardcoded in Gradle, this repo by Bintray tries to
        provide easier handling. It should sync with mavenCentral from
        time to time.
    -   ‘OSS Sonatype’ - maintained by the people behind mavenCentral,
        this repository focuses on hosting services for open source
        project binaries.
    -   ‘JitPack.io’ - builds directly from Github repositories.
        However, they do not provide any option to reproduce or verify
        the resulting binaries. Builds pre-release versions in
        some cases.
    -   ‘Clojars’ - Clojure libraries repo.
    -   ‘CommonsWare’ - repo holding a collection of open-source libs.

`patch=x`

:   Apply patch(es). ’x’ names one (or more - comma-seperated) files
    within a directory below the metadata, with the same name as the
    metadata file but without the extension. Each of these patches is
    applied to the code in turn.

`prebuild=xxxx`

:   Specifies a shell command (or commands - chain with &&) to run
    before the build takes place. Backslash can be used as an escape
    character to insert literal commas, or as the last character on a
    line to join that line with the next. It has no special meaning in
    other contexts; in particular, literal backslashes should not
    be escaped.

    The command runs using bash.

    Note that nothing should be built during this prebuild phase -
    scanning of the code and building of the source tarball, for
    example, take place after this. For custom actions that actually
    build things or produce binaries, use ’build’ instead.

    You can use \$\$name\$\$ to substitute the path to a referenced
    srclib - see the `srclib` directory for details of this.

    You can use \$\$SDK\$\$, \$\$NDK\$\$ and \$\$MVN3\$\$ to substitute
    the paths to the android SDK and NDK directories, and Maven 3
    executable respectively e.g. for when you need to run
    `android update project` explicitly. The following per-build
    variables are available likewise: \$\$VERSION\$\$, \$\$VERCODE\$\$
    and \$\$COMMIT\$\$.

`scanignore=<path1>[,<path2>,...]`

:   Enables one or more files/paths to be excluded from the scan
    process. This should only be used where there is a very good reason,
    and probably accompanied by a comment explaining why it
    is necessary.

    When scanning the source tree for problems, matching files whose
    relative paths start with any of the paths given here are ignored.

`scandelete=<path1>[,<path2>,...]`

:   When running the scan process, any files that trigger errors - like
    binaries - will be removed. It acts just like scanignore=, but
    instead of ignoring the files, it removes them.

    Useful when a source code repository includes binaries or other
    unwanted files which are not needed for the build. Instead of
    removing them manually via rm=, using scandelete= is easier.

`build=xxxx`

:   As for ’prebuild’, but runs during the actual build phase (but
    before the main Ant/Maven build). Use this only for actions that do
    actual building. Any prepartion of the source code should be done
    using ’init’ or ’prebuild’.

    Any building that takes place before build= will be ignored, as
    either Ant, mvn or gradle will be executed to clean the build
    environment right before build= (or the final build) is run.

    You can use \$\$SDK\$\$, \$\$NDK\$\$ and \$\$MVN3\$\$ to substitute
    the paths to the android SDK and NDK directories, and maven 3
    executable respectively. The following per-build variables are
    available likewise: \$\$VERSION\$\$, \$\$VERCODE\$\$
    and \$\$COMMIT\$\$.

`buildjni=[yes|no|<dir list>]`

:   Enables building of native code via the ndk-build script before
    doing the main Ant build. The value may be a list of directories
    relative to the main application directory in which to run
    ndk-build, or ’yes’ which corresponds to ’.’ . Using explicit list
    may be useful to build multi-component projects.

    The build and scan processes will complain (refuse to build) if this
    parameter is not defined, but there is a `jni` directory present. If
    the native code is being built by other means like a Gradle task,
    you can specify `no` here to avoid that. However, if the native code
    is actually not required or used, remove the directory instead
    (using `rm=jni` for example). Using `buildjni=no` when the jni code
    isn’t used nor built will result in an error saying that native
    libraries were expected in the resulting package.

`ndk=<version>`

:   Version of the NDK to use in this build. Defaults to the latest NDK
    release that included legacy toolchains, so as to not break builds
    that require toolchains no longer included in current versions of
    the NDK.

    The buildserver supports r9b with its legacy toolchains, r10e, r11c
    and the latest release as of writing this document, r12b. You may
    add support for more versions by adding them to ’ndk\_paths’ in your
    config file.

`gradle=<flavour1>[,<flavour2>,...]`

:   Build with Gradle instead of Ant, specifying what flavours to use.
    Flavours are case sensitive since the path to the output apk is
    as well.

    If only one flavour is given and it is ’yes’, no flavour will be
    used. Note that for projects with flavours, you must specify at
    least one valid flavour since ’yes’ will build all of
    them separately.

`maven=yes[@<dir>]`

:   Build with Maven instead of Ant. An extra @&lt;dir&gt; tells F-Droid
    to run Maven inside that relative subdirectory. Sometimes it is
    needed to use @.. so that builds happen correctly.

`preassemble=<task1>[,<task2>,...]`

:   List of Gradle tasks to be run before the assemble task in a Gradle
    project build.

`gradleprops=<prop1>[,<prop2>,...]`

:   List of Gradle properties to pass via the command line to Gradle. A
    property can be of the form `foo` or of the form `key=value`.

    For example: `gradleprops=enableFoo,someSetting=bar` will result in
    `gradle -PenableFoo -PsomeSetting=bar`.

`antcommands=<target1>[,<target2>,...]`

:   Specify an alternate set of Ant commands (target) instead of the
    default ’release’. It can’t be given any flags, such as the path to
    a build.xml.

`output=glob/to/output.apk`

:   Specify a glob path where the resulting unsigned release apk from
    the build should be. This can be used in combination with build
    methods like `gradle=yes` or `maven=yes`, but if no build method is
    specified, the build is manual. You should run your build commands,
    such as `make`, in `build=`.

`novcheck=yes`

:   Don’t check that the version name and code in the resulting apk are
    correct by looking at the build output - assume the metadata
    is correct. This takes away a useful level of sanity checking, and
    should only be used if the values can’t be extracted.

Another example, using extra parameters:

‘Build Version:1.09.03,10903,45,subdir=Timeriffic,oldsdkloc=yes’



### 7.23 AntiFeatures<a name="AntiFeatures"></a>


This is optional - if present, it contains a comma-separated list of any
of the following values, describing an anti-feature the application has.
It is a good idea to mention the reasons for the anti-feature(s) in the
description:

-   ‘Ads’ - the application contains advertising.
-   ‘Tracking’ - the application tracks and reports your activity to
    somewhere without your consent. It’s commonly used for when
    developers obtain crash logs without the user’s consent, or when an
    app is useless without some kind of authentication.
-   ‘NonFreeNet’ - the application relies on computational services that
    are impossible to replace or that the replacement cannot be
    connected to without major changes to the app.
-   ‘NonFreeAdd’ - the application promotes non-free add-ons, such that
    the app is effectively an advert for other non-free software and
    such software is not clearly labelled as such.
-   ‘NonFreeDep’ - the application depends on a non-free application
    (e.g. Google Maps) - i.e. it requires it to be installed on the
    device, but does not include it.
-   ‘UpstreamNonFree’ - the application is or depends on non-free
    software. This does not mean that non-free software is included with
    the app: Most likely, it has been patched in some way to remove the
    non-free code. However, functionality may be missing.
-   ‘NonFreeAssets’ - the application contains and makes use of
    non-free assets. The most common case is apps using artwork -
    images, sounds, music, etc - under a non-commercial license.



### 7.24 Disabled<a name="Disabled"></a>


If this field is present, the application does not get put into the
public index. This allows metadata to be retained while an application
is temporarily disabled from being published. The value should be a
description of why the application is disabled. No apks or source code
archives are deleted: to purge an apk see the Build Version section or
delete manually for developer builds. The field is therefore used when
an app has outlived it’s usefulness, because the source tarball is
retained.


### 7.25 Requires Root<a name="Requires-Root"></a>


Set this optional field to "Yes" if the application requires root
privileges to be usable. This lets the client filter it out if the user
so desires. Whether root is required or not, it is good to give a
paragraph in the description to the conditions on which root may be
asked for and the reason for it.



### 7.26 Archive Policy<a name="Archive-Policy"></a>


This determines the policy for moving old versions of an app to the
archive repo, if one is configured. The configuration sets a default
maximum number of versions kept in the main repo, after which older ones
are moved to the archive. This app-specific policy setting can override
that.

Currently the only supported format is "n versions", where n is the
number of versions to keep. Defaults to "3 versions".



### 7.27 Update Check Mode<a name="Update-Check-Mode"></a>


This determines the method using for determining when new releases are
available - in other words, the updating of the Current Version and
Current Version Code fields in the metadata by the `fdroid checkupdates`
process.

Valid modes are:

-   `None` - No checking is done because there’s no appropriate
    automated way of doing so. Updates should be checked for manually.
    Use this, for example, when deploying unstable or patched versions;
    when builds are done in a directory different to where the
    AndroidManifest.xml is; if the developers use the Gradle build
    system and store version info in a separate file; if the developers
    make a new branch for each release and don’t make tags; or if you’ve
    changed the package name or version code logic.
-   `Static` - No checking is done - either development has ceased or
    new versions are not desired. This method is also used when there is
    no other checking method available and the upstream developer keeps
    us posted on new versions.
-   `RepoManifest` - At the most recent commit, the AndroidManifest.xml
    file is looked for in the directory where it was found in the the
    most recent build. The appropriateness of this method depends on the
    development process used by the application’s developers. You should
    not specify this method unless you’re sure it’s appropriate. For
    example, some developers bump the version when commencing
    development instead of when publishing. It will return an error if
    the AndroidManifest.xml has moved to a different directory or if the
    package name has changed. The current version that it gives may not
    be accurate, since not all versions are fit to be published.
    Therefore, before building, it is often necessary to check if the
    current version has been published somewhere by the upstream
    developers, either by checking for apks that they distribute or for
    tags in the source code repository.

    It currently works for every repository type to different extents,
    except the srclib repo type. For git, git-svn and hg repo types, you
    may use "RepoManifest/yourbranch" as UCM so that "yourbranch" would
    be the branch used in place of the default one. The default values
    are "master" for git, "default" for hg and none for git-svn (it
    stays in the same branch). On the other hand, branch support hasn’t
    been implemented yet in bzr and svn, but RepoManifest may still be
    used without it.

-   `RepoTrunk` - For svn and git-svn repositories, especially those who
    don’t have a bundled AndroidManifest.xml file, the Tags and
    RepoManifest checks will not work, since there is no version
    information to obtain. But, for those apps who automate their build
    process with the commit ref that HEAD points to, RepoTrunk will set
    the Current Version and Current Version Code to that number.
-   `Tags` - The AndroidManifest.xml file in all tagged revisions in the
    source repository is checked, looking for the highest version code.
    The appropriateness of this method depends on the development
    process used by the application’s developers. You should not specify
    this method unless you’re sure it’s appropriate. It shouldn’t be
    used if the developers like to tag unstable versions or are known to
    forget to tag releases. Like RepoManifest, it will not return the
    correct value if the directory containing the AndroidManifest.xml
    has moved. Despite these caveats, it is the often the favourite
    update check mode.

    It currently only works for git, hg, bzr and git-svn repositories.
    In the case of the latter, the repo URL must contain the path to the
    trunk and tags or else no tags will be found.

    Optionally append a regex pattern at the end - separated with a
    space - to only check the tags matching said pattern. Useful when
    apps tag non-release versions such as X.X-alpha, so you can filter
    them out with something like `.*[0-9]$` which requires tag names to
    end with a digit.

-   `HTTP` - HTTP requests are used to determine the current version
    code and version name. This is controlled by the `Update Check Data`
    field, which is of the form `urlcode|excode|urlver|exver`.

    Firstly, if `urlcode` is non-empty, the document from that URL is
    retrieved, and matched against the regular expression `excode`, with
    the first group becoming the version code.

    Secondly, if `urlver` is non-empty, the document from that URL is
    retrieved, and matched against the regular expression `exver`, with
    the first group becoming the version name. The `urlver` field can be
    set to simply ’.’ which says to use the same document returned for
    the version code again, rather than retrieving a different one.



### 7.28 Vercode Operation<a name="Vercode-Operation"></a>


Operation to be applied to the vercode obtained by the defined
`Update Check Mode`. `%c` will be replaced by the actual vercode, and
the whole string will be passed to python’s `eval` function.

Especially useful with apps that we want to compile for different ABIs,
but whose vercodes don’t always have trailing zeros. For example, with
`Vercode Operation` set at something like `%c*10 + 4`, we will be able
to track updates and build up to four different versions of every
upstream version.



### 7.29 Update Check Ignore<a name="Update-Check-Ignore"></a>


When checking for updates (via `Update Check Mode`) this can be used to
specify a regex which, if matched against the version name, causes that
version to be ignored. For example, ’beta’ could be specified to ignore
version names that include that text.


### 7.30 Update Check Name<a name="Update-Check-Name"></a>


When checking for updates (via `Update Check Mode`) this can be used to
specify the package name to search for. Useful when apps have a static
package name but change it programmatically in some app flavors, by e.g.
appending ".open" or ".free" at the end of the package name.

You can also use `Ignore` to ignore package name searching. This should
only be used in some specific cases, for example if the app’s
build.gradle file does not contain the package name.


### 7.31 Update Check Data<a name="Update-Check-Data"></a>


Used in conjunction with `Update Check Mode` for certain modes.


### 7.32 Auto Update Mode<a name="Auto-Update-Mode"></a>


This determines the method using for auto-generating new builds when new
releases are available - in other words, adding a new Build Version line
to the metadata. This happens in conjunction with the ’Update Check
Mode’ functionality - i.e. when an update is detected by that, it is
also processed by this.

Valid modes are:

-   `None` - No auto-updating is done
-   `Version` - Identifies the target commit (i.e. tag) for the new
    build based on the given version specification, which is simply text
    in which %v and %c are replaced with the required version name and
    version code respectively.

    For example, if an app always has a tag "2.7.2" corresponding to
    version 2.7.2, you would simply specify "Version %v". If an app
    always has a tag "ver\_1234" for a version with version code 1234,
    you would specify "Version ver\_%c".

    Additionally, a suffix can be added to the version name at this
    stage, to differentiate F-Droid’s build from the original.
    Continuing the first example above, you would specify that as
    "Version +-fdroid %v" - "-fdroid" is the suffix.



### 7.33 Current Version<a name="Current-Version"></a>


The name of the version that is current. There may be newer versions of
the application than this (e.g. unstable versions), and there will
almost certainly be older ones. This should be the one that is
recommended for general use. In the event that there is no source code
for the current version, or that non-free libraries are being used, this
would ideally be the latest version that is still free, though it may
still be expedient to retain the automatic update check — see No Source
Since.

This field is normally automatically updated - see Update Check Mode.

This is converted to (`<marketversion>`) in the public index file.


### 7.34 Current Version Code<a name="Current-Version-Code"></a>


The version code corresponding to the Current Version field. Both these
fields must be correct and matching although it’s the current version
code that’s used by Android to determine version order and by F-Droid
client to determine which version should be recommended.

This field is normally automatically updated - see Update Check Mode.

If not set or set to `0`, clients will recommend the highest version
they can, as if the `Current Version Code` was infinite.

This is converted to (`<marketvercode>`) in the public index file.


### 7.35 No Source Since<a name="No-Source-Since"></a>


In case we are missing the source code for the Current Version reported
by Upstream, or that non-free elements have been introduced, this
defines the first version that began to miss source code. Apps that are
missing source code for just one or a few versions, but provide source
code for newer ones are not to be considered here - this field is
intended to illustrate which apps do not currently distribute source
code, and since when have they been doing so.


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


## 10 Signing<a name="Signing"></a>

There are two kinds of signing involved in running a repository - the
signing of the APK files generated from source builds, and the signing
of the repo index itself. The latter is optional, but very strongly
recommended.


### 10.1 Repo Index Signing<a name="Repo-Index-Signing"></a>

When setting up the repository, one of the first steps should be to
generate a signing key for the repository index. This will also create a
keystore, which is a file that can be used to hold this and all other
keys used. Consider the location, security and backup status of this
file carefully, then create it as follows:

`keytool -genkey -v -keystore my.keystore -alias repokey -keyalg RSA -keysize 2048 -validity 10000`

In the above, replace ’my.keystore’ with the name of the keystore file
to be created, and ’repokey’ with a name to identify the repo index key
by.

You’ll be asked for a password for the keystore, AND a password for the
key. They shouldn’t be the same. In between, you’ll be asked for some
identifying details which will go in the certificate.

The two passwords entered go into `config.py`, as `keystorepass` and
`keypass` respectively. The path to the keystore file, and the alias you
chose for the key also go into that file, as `keystore` and
`repo_keyalias` respectively.


### 10.2 Package Signing<a name="Package-Signing"></a>

With the repo index signing configured, all that remains to be done for
package signing to work is to set the `keydname` field in `config.py` to
contain the same identifying details you entered before.

A new key will be generated using these details, for each application
that is built. (If a specific key is required for a particular
application, this system can be overridden using the `keyaliases` config
settings.


