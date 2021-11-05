---
layout: page
title: Build Metadata Reference

---

Information used by `fdroid update` to compile the public index comes
from several sources:

* APK, media, etc files in the _repo_ sub-directory
* per-package "metadata" files in the _metadata_ sub-directory
* [localizable texts and graphics](../All_About_Descriptions_Graphics_and_Screenshots#in-the-apps-build-metadata-in-an-fdroiddata-collection) in the _metadata_ subdirectory
* localizable texts and graphics [embedded in an app's source code](../All_About_Descriptions_Graphics_and_Screenshots#in-the-apps-source-repository)

These metadata files are simple, easy to edit text files, always named
as the "package name" with file type appended.  There are a wide range
of available fields for adding information to describe packages and/or
apps.  For all of the fields like _AuthorName_ that apply to all
releases of a package/app, the fields use CamelCase starting with an
upper case letter.  All other fields use camelCase starting with a
lower case letter, including per-build fields, localized fields, etc.

Metadata files are written in [YAML](http://www.yaml.org/start.html) format

Note that although the metadata files are designed to be easily read
and writable by humans, they are also processed and written by various
scripts. They can be automatically cleaned up when necessary. The
structure and comments will be preserved correctly, although the order
of fields will be standardised. (In the event that the original file
was in a different order, comments are considered as being attached to
the field following them). In fact, you can standardise all packages
in a repository using a single command, without changing the
functional content, by running:

```
fdroid rewritemeta
```

Or just run it on a specific app:

```
fdroid rewritemeta org.adaway
```

The following sections describe the fields recognised within the file.

* [_Categories_](#Categories)
* [_AuthorName_](#AuthorName)
* [_AuthorEmail_](#AuthorEmail)
* [_AuthorWebSite_](#AuthorWebSite)
* [_License_](#License)
* [_AutoName_](#AutoName)
* [_Name_](#Name)
* [_WebSite_](#WebSite)
* [_SourceCode_](#SourceCode)
* [_IssueTracker_](#IssueTracker)
* [_Translation_](#Translation)
* [_Changelog_](#Changelog)
* [_Donate_](#Donate)
* [_FlattrID_](#FlattrID)
* [_Liberapay_](#Liberapay)
* [_OpenCollective_](#OpenCollective)
* [_Bitcoin_](#Bitcoin)
* [_Litecoin_](#Litecoin)
* [_Summary_](#Summary)
* [_Description_](#Description)
* [_MaintainerNotes_](#MaintainerNotes)
* [_RepoType_](#RepoType)
* [_Repo_](#Repo)
* [_Binaries_](#Binaries)
* [_Builds_](#Builds)
* [_Builds.versionName_](#build_versionName)
* [_Builds.versionCode_](#build_versionCode)
* [_Builds.commit_](#build_commit)
* [_Builds.disable_](#build_disable)
* [_Builds.subdir_](#build_subdir)
* [_Builds.submodules_](#build_submodules)
* [_Builds.sudo_](#build_sudo)
* [_Builds.timeout_](#build_timeout)
* [_Builds.init_](#build_init)
* [_Builds.oldsdkloc_](#build_oldsdkloc)
* [_Builds.target_](#build_target)
* [_Builds.androidupdate_](#build_androidupdate)
* [_Builds.encoding_](#build_encoding)
* [_Builds.forceversion_](#build_forceversion)
* [_Builds.forcevercode_](#build_forcevercode)
* [_Builds.rm_](#build_rm)
* [_Builds.extlibs_](#build_extlibs)
* [_Builds.srclibs_](#build_srclibs)
* [_Builds.patch_](#build_patch)
* [_Builds.prebuild_](#build_prebuild)
* [_Builds.scanignore_](#build_scanignore)
* [_Builds.scandelete_](#build_scandelete)
* [_Builds.build_](#build_build)
* [_Builds.buildjni_](#build_buildjni)
* [_Builds.ndk_](#build_ndk)
* [_Builds.gradle_](#build_gradle)
* [_Builds.maven_](#build_maven)
* [_Builds.preassemble_](#build_preassemble)
* [_Builds.gradleprops_](#build_gradleprops)
* [_Builds.antcommands_](#build_antcommands)
* [_Builds.output_](#build_output)
* [_Builds.novcheck_](#build_novcheck)
* [_Builds.antifeatures_](#build_antifeatures)
* [_AllowedAPKSigningKeys_](#AllowedAPKSigningKeys)
* [_AntiFeatures_](#AntiFeatures)
* [_Disabled_](#Disabled)
* [_RequiresRoot_](#RequiresRoot)
* [_ArchivePolicy_](#ArchivePolicy)
* [_UpdateCheckMode_](#UpdateCheckMode)
* [_UpdateCheckIgnore_](#UpdateCheckIgnore)
* [_VercodeOperation_](#VercodeOperation)
* [_UpdateCheckName_](#UpdateCheckName)
* [_UpdateCheckData_](#UpdateCheckData)
* [_AutoUpdateMode_](#AutoUpdateMode)
* [_CurrentVersion_](#CurrentVersion)
* [_CurrentVersionCode_](#CurrentVersionCode)
* [_NoSourceSince_](#NoSourceSince)



### _Categories_<a name="Categories"></a>


Any number of categories for the application to be placed in. There is
no fixed list of categories - both the client and the web site will
automatically show any categories that exist in any applications.
However, if your metadata is intended for the main F-Droid repository,
you should use one of the existing categories (`Connectivity`,`Development`,
`Games`,`Graphics`,`Internet`,`Money`,`Multimedia`,`Navigation`,`Phone & SMS`,
`Reading`,`Science & Education`,`Security`,`Sports & Health`,`System`,`Theming`,
`Time`,`Writing`), or discuss the proposal to add a new one. _Categories_
must be a list of items, even if there is just one.

This is converted to (`<categories>`) in the XML file (_index.xml_).



### _AuthorName_<a name="AuthorName"></a>

The name of the author, either full, abbreviated or pseudonym. If
present, it should represent the name(s) as published by upstream, e.g.
in their copyright or authors file. This can be omitted (or left blank).

__Warning__: this overrides all _AuthorName_ entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).

This is converted to (`<author>`) in the XML file (_index.xml_).



### _AuthorEmail_<a name="AuthorEmail"></a>

The e-mail address of the author(s). This can be omitted (or left
blank).

__Warning__: this overrides all _AuthorEmail_ entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).

This is converted to (`<email>`) in the XML file (_index.xml_).



### _AuthorWebSite_<a name="AuthorWebSite"></a>

The website url of the author(s). This can be omitted (or left blank).

__Warning__: this overrides all _AuthorWebSite_ entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).



### _License_<a name="License"></a>

The overall license for the application in terms of the binary that
the user can install. Values should correspond to short identifiers of
the [SPDX](https://spdx.org/licenses/) license list. There can only be
one license listed here. If there are multiple licenses that apply to
the source code, then this field should contain the least restrictive
license that the whole app can be used under.  When multiple licenses
are combined, that usually means the most restrictive wins.

This field cannot represent the complexity of licenses that apply to
parts of the app, or apps that have the entire thing released under
more than one license.

This is converted to (`<license>`) in the XML file (_index.xml_).



### _AutoName_<a name="AutoName"></a>

The name of the application as can best be retrieved from the source
code. This is done so that `fdroid checkupdates` can put a familiar
name in the description of commits created when a new update of the
application is found. The _AutoName_ entry is generated automatically
when `fdroid checkupdates` is run, and is only used for the commit
messages generated by `fdroid checkupdates`.



### _Name_<a name="Name"></a>

The title of the application, with optional descriptive phrase. This
field will override all other sources of the application name,
including scraped from the APK and from [localized
metadata](../All_About_Descriptions_Graphics_and_Screenshots).
Setting _Name_ is usually not needed, since the application’s correct
name is retrieved from the APK file.  However, in a situation where an
APK contains a bad or missing application name, it can be overridden
using this. Note that this only overrides the name in the list of apps
presented in the client; it doesn’t change the name or application
label in the source code.

__50 character limit__

__Warning__: this overrides all _Name_/_title_ entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).

This is converted to (`<name>`) in the XML file (_index.xml_).



### _WebSite_<a name="WebSite"></a>

The URL for the application’s web site. If there is no relevant web
site, this can be omitted (or left blank).

This is converted to (`<web>`) in the XML file (_index.xml_).



### _SourceCode_<a name="SourceCode"></a>

The URL to view or obtain the application’s source code. This should be
something human-friendly. Machine-readable source-code is covered in the
_Repo_ field.

This is converted to (`<source>`) in the XML file (_index.xml_).



### _IssueTracker_<a name="IssueTracker"></a>

The URL for the application’s issue tracker. Optional, since not all
applications have one.

This is converted to (`<tracker>`) in the XML file (_index.xml_).



### _Translation_<a name="Translation"></a>

The URL for the application’s translation portal or at least a guide.
Optional, since not all applications have one.

This is converted to (`translation`) in the JSON file (_index.json_).



### _Changelog_<a name="Changelog"></a>

The URL for the application’s changelog. Optional, since not all
applications have one.

This is converted to (`<changelog>`) in the XML file (_index.xml_).



### _Donate_<a name="Donate"></a>

The URL to donate to the project. This should be the project’s donate
page if it has one.

It is possible to use a direct PayPal link here, if that is all that is
available. However, bear in mind that the developer may not be aware of
that direct link, and if they later changed to a different PayPal
account, or the PayPal link format changed, things could go wrong. It is
always best to use a link that the developer explicitly makes public,
rather than something that is auto-generated ’button code’.

This is converted to (`<donate>`) in the XML file (_index.xml_).



### _FlattrID_<a name="FlattrID"></a>

The project’s Flattr (https://flattr.com) ID, if it has one. This should
be a numeric ID, such that (for example) https://flattr.com/thing/xxxx
leads directly to the page to donate to the project.

This is converted to (`<flattr>`) in the XML file (_index.xml_).


### _Liberapay_<a name="Liberapay"></a><a name="LiberapayID"></a>

The project’s Liberapay (https://liberapay.com) user or group name, if
it has one. This should be an alphanumeric name, such that (for
example) https://liberapay.com/xxxxx which redirects to your account
page. This used to be _LiberapayID_, which was a numeric ID fetched
from Liberapay’s site by adding /public.json behind your team page.

This is converted to (`<liberapay>`) in the XML file (_index.xml_).


### _OpenCollective_<a name="OpenCollective"></a>

The project’s OpenCollective (https://opencollective.com) user or
group name, if it has one. This should be an alphanumeric name, such
that (for example) https://opencollective.com/xxxxx redirects to your
account page.


### _Bitcoin_<a name="Bitcoin"></a>

A bitcoin address for donating to the project.

This is converted to (`<bitcoin>`) in the XML file (_index.xml_).



### _Litecoin_<a name="Litecoin"></a>

A litecoin address for donating to the project.

This is converted to (`<litecoin>`) in the XML file (_index.xml_).



### _Summary_<a name="Summary"></a>

A brief summary of what the application is.  The _Summary_ is used in
the app list and tile views of the F-Droid client, and as a
sub-headline in some other views.

__80 character limit__

__Warning__: this overrides all _Summary_ aka "short description" entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).

This is converted to (`<summary>`) in the XML file (_index.xml_).



### _Description_<a name="Description"></a>

A full description of the application, relevant to the latest version.
This can span multiple lines (which should be kept to a maximum of 80
characters), and is terminated by a line containing a single ’.’.

The description formatting follows the established conventions that
work across many app stores:

* Basic HTML formatting can be used.
* Newlines will be preserved.
* Links to other packages on f-droid.org will show up as clickable on
the website, other links will show up as plain text.

It can be helpful to note information pertaining to updating from an
earlier version; whether the app contains any prebuilts built by the
upstream developers or whether Non-Free elements were removed; whether
the app is in rapid development or whether the latest version lags
behind the current version; whether the app supports multiple
architectures or whether there is a maximum SDK specified (such info not
being recorded in the index).

__4000 character limit__

__Warning__: this overrides all _Description_ aka "full description" entries
[set in the app's source code](../All_About_Descriptions_Graphics_and_Screenshots).

This is converted to (`<desc>`) in the XML file (_index.xml_).



### _MaintainerNotes_<a name="MaintainerNotes"></a>

This is a multi-line field using the same rules and syntax as the
description. It’s used to record notes for F-Droid maintainers to assist
in maintaining and updating the application in the repository.

This information is also published to the wiki.



### _RepoType_<a name="RepoType"></a>

The type of repository - for automatic building from source. If this is
not specified, automatic building is disabled for this application.
Possible values are:

-   ‘git’
-   ‘svn’
-   ‘git-svn’
-   ‘hg’
-   ‘bzr’
-   ‘srclib’



### _Repo_<a name="Repo"></a>

The repository location. Usually a git: or svn: URL, for example.

The git-svn option connects to an SVN repository, and you specify the
URL in exactly the same way, but git is used as a back-end. This is
preferable for performance reasons, and also because a local copy of the
entire history is available in case the upstream repository disappears.
(It happens!). In order to use Tags as _UpdateCheckMode_ for this VCS
type, the URL must have the tags= special argument set. Likewise, if you
intend to use the RepoManifest/branch scheme, you would want to specify
branches= as well. Finally, trunk= can also be added. All these special
arguments will be passed to "git svn" in order, and their values must be
relative paths to the svn repo root dir. Here’s an example of a complex
git-svn _Repo_ URL:
http://svn.code.sf.net/p/project/code/svn;trunk=trunk;tags=tags;branches=branches

If the _RepoType_ is `srclib`, then you must specify the name of the
according srclib .txt file. For example if `scrlibs/FooBar.txt` exist
and you want to use this srclib, then you have to set _Repo_ to `FooBar`.



### _Binaries_<a name="Binaries"></a>

The location of binaries used in verification process.

If specified, F-Droid will verify the output APK file of a build against
the one specified. You can use %v and %c to point to the version name
and version code of the current build. To verify the F-Droid client
itself you could use:
`Binaries: https://f-droid.org/repo/org.fdroid.fdroid_%c.apk`

F-Droid will use upstream binaries if the verification succeeded.



### _Builds_<a name="Builds"></a>

Any number of sub-entries can be present, each specifying a version to
automatically build from source.
For example:

```
Builds:
  - versionName: '1.2'
    versionCode: 12
    commit: v1.2

  - versionName: '1.3'
    versionCode: 13
    commit: v1.3-fdroid
```

`versionName: xxx`<a name="build_versionName"></a>

`versionCode: yyy`<a name="build_versionCode"></a>

:   Specifies to build version xxx, which has a version code of yyy.

`commit: xxx`<a name="build_commit"></a>

:   The _commit_ parameter specifies the tag, commit or revision number
    from which to build it in the source repository.

In addition to the three, always required, parameters described above,
further parameters can be added (in `name: value` format) to apply further
configuration to the build. These are (roughly in order of application):

`disable: <message>`<a name="build_disable"></a>

:   Disables this build, giving a reason why. (For backwards
    compatibility, this can also be achieved by starting the commit ID
    with ’!’)

    The purpose of this feature is to allow non-buildable releases (e.g.
    the source is not published) to be flagged, so the scripts don’t
    generate repeated messages about them. (And also to record the
    information for review later). If an APK has already been built,
    disabling causes it to be deleted once `fdroid update` is run; this
    is the procedure if ever a version has to be replaced.

`subdir: <path>`<a name="build_subdir"></a>

:   Specifies to build from a subdirectory of the checked out source
    code. Normally this directory is changed to before building,

`submodules: true`<a name="build_submodules"></a>

:   Use if the project (git only) has submodules - causes
    `git submodule update --init --recursive` to be executed after the
    source is cloned. Submodules are reset and cleaned like the main app
    repository itself before each build.

`sudo: xxxx`<a name="build_sudo"></a>

:   Specifies a script to be run using `sudo bash -x -c "xxxx"` in the
    buildserver VM guest.  This script is run with full root privileges,
    but the state will be reset after each build.  The vast majority of
    apps build using the standard Debian/stable base environment. This
    is useful for setting up the buildserver for complex builds that
    need very specific things that are not appropriate to install for
    all builds, or for things that would conflict with other builds.

`timeout: <seconds>`<a name="build_timeout"></a>

:   Time limit for this build (in seconds).  After time is up,
    buildserver VM is forcefully terminated.  The default is 7200
    (2 hours); 0 means no limit.

    Limitation is applied only in server mode, i.e. when `fdroid build`
    is invoked with the `--server` option.

`init: xxxx`<a name="build_init"></a>

:   Like ’prebuild’, but runs on the source code BEFORE any other
    processing takes place.

    You can use \$\$SDK\$\$, \$\$NDK\$\$ and \$\$MVN3\$\$ to
    substitute the paths to the android SDK and NDK directories and the maven 3
    executable respectively. The following
    per-build variables are available likewise: \$\$VERSION\$\$,
    \$\$VERCODE\$\$ and \$\$COMMIT\$\$.

`oldsdkloc: true`<a name="build_oldsdkloc"></a>

:   The sdk location in the repo is in an old format, or the build.xml
    is expecting such. The ’new’ format is sdk.dir while the VERY OLD
    format is sdk-location. Typically, if you get a message along the
    lines of: "com.android.ant.SetupTask cannot be found" when trying to
    build, then try enabling this option.

`target: <target>`<a name="build_target"></a>

:   Specifies a particular SDK target for compilation, overriding the
    value defined in the code by upstream. This has different effects
    depending on what build system used — this flag currently affects
    Ant, Maven and Gradle projects only. Note that this does not change
    the target SDK in the AndroidManifest.xml, which determines the
    level of features that can be included in the build.

    In the case of an Ant project, it modifies _project.properties_ of the
    app and possibly sub-projects. This is likely to cause the whole
    _build.xml_ to be rewritten, which is fine if it’s a ’standard’
    android file or doesn’t already exist, but not a good idea if it’s
    heavily customised.

`androidupdate: <auto/dirs>`<a name="build_androidupdate"></a>

:   By default, ’android update’ is used in Ant builds to generate or
    update the project and all its referenced projects. Specifying
    update=no bypasses that. Note that this is useless in builds that
    don’t use Ant.

    Default value is ’`auto`’, which recursively uses the paths in
    _project.properties_ to find all the subprojects to update.

    Otherwise, the value can be a comma-separated list of directories in
    which to run ’android update’ relative to the application directory.

`encoding: xxxx`<a name="build_encoding"></a>

:   Adds a java.encoding property to local.properties with the
    given value. Generally the value will be ’utf-8’. This is picked up
    by the SDK’s ant rules, and forces the Java compiler to interpret
    source files with this encoding. If you receive warnings during the
    compile about character encodings, you probably need this.

`forceversion: true`<a name="build_forceversion"></a>

:   If specified, the package version in _AndroidManifest.xml_ is replaced
    with the version name for the build as specified in the metadata.

    This is useful for cases when upstream repo failed to update it for
    specific tag; to build an arbitrary revision; to make it apparent
    that the version differs significantly from upstream; or to make it
    apparent which architecture or platform the APK is designed to
    run on.

`forcevercode: true`<a name="build_forcevercode"></a>

:   If specified, the package version code in the _AndroidManifest.xml_ is
    replaced with the version code for the build. See also forceversion.

`rm: <path1>[,<path2>,...]`<a name="build_rm"></a>

:   Specifies the relative paths of files or directories to delete
    before the build is done. The paths are relative to the base of the
    build directory - i.e. the root of the directory structure checked
    out from the source respository - not necessarily the directory that
    contains _AndroidManifest.xml_.

    Multiple files/directories can be specified by separating them with
    ’,’. Directories will be recursively deleted.

`extlibs: <lib1>[,<lib2>,...]`<a name="build_extlibs"></a>

:   Comma-separated list of external libraries (jar files) from the
    `build/extlib` library, which will be placed in the `libs` directory
    of the project.

`srclibs: [n:]a@r,[n:]b@r1,...`<a name="build_srclibs"></a>

:   Comma-separated list of source libraries or Android projects. Each
    item is of the form name@rev where name is the predefined source
    library name and rev is the revision or tag to use in the respective
    source control.

    For Ant projects, you can optionally append a number with a colon at
    the beginning of a srclib item to automatically place it in
    _project.properties_ as a library under the specified number. For
    example, if you specify `1:somelib@1.0`, F-Droid will automatically
    do the equivalent of the legacy practice
    `prebuild=echo "android.library.reference.1=$$somelib$$" >> project.properties`.

    Each srclib has a metadata file under srclibs/ in the repository
    directory, and the source code is stored in build/srclib/.
	_RepoType_ and _Repo_ are specified in the same way
    as for apps; Subdir: can be a comma separated list, for when
    directories are renamed by upstream; Update Project: updates the
    projects in the working directory and one level down; Prepare: can
    be used for any kind of preparation: in particular if you need to
    update the project with a particular target. You can then also use
    \$\$name\$\$ in the init/prebuild/build command to substitute the
    relative path to the library directory, but it could need tweaking
    if you’ve changed into another directory.

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
    -   ‘OSS JFrog’ - maintained by the people behind jCenter, this
        repository focuses on hosting services for open source project
        binaries.
    -   ‘JitPack.io’ - builds directly from GitHub repositories.
        However, they do not provide any option to reproduce or verify
        the resulting binaries. Builds pre-release versions in
        some cases.
    -   ‘Clojars’ - Clojure libraries repo.
    -   ‘CommonsWare’ - repo holding a collection of open-source libs.

`patch: x`<a name="build_patch"></a>

:   Apply patch(es). ’x’ names one (or more - comma-seperated) files
    within a directory below the metadata, with the same name as the
    metadata file but without the extension. Each of these patches is
    applied to the code in turn.

`prebuild: xxxx`<a name="build_prebuild"></a>

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

`scanignore: <path1>[,<path2>,...]`<a name="build_scanignore"></a>

:   Enables one or more files/paths to be excluded from the scan
    process. This should only be used where there is a very good reason,
    and probably accompanied by a comment explaining why it
    is necessary.

    When scanning the source tree for problems, matching files whose
    relative paths start with any of the paths given here are ignored.

`scandelete: <path1>[,<path2>,...]`<a name="build_scandelete"></a>

:   When running the scan process, any files that trigger errors - like
    binaries - will be removed. It acts just like _scanignore_, but
    instead of ignoring the files, it removes them.

    Useful when a source code repository includes binaries or other
    unwanted files which are not needed for the build. Instead of
    removing them manually via _rm_, using _scandelete_ is easier.

`build: xxxx`<a name="build_build"></a>

:   As for ’prebuild’, but runs during the actual build phase (but
    before the main Ant/Maven build). Use this only for actions that do
    actual building. Any preparation of the source code should be done
    using ’init’ or ’prebuild’.

    Any building that takes place before _build_ will be ignored, as
    either Ant, mvn or gradle will be executed to clean the build
    environment right before _build_ (or the final build) is run.

    You can use \$\$SDK\$\$, \$\$NDK\$\$ and \$\$MVN3\$\$ to substitute
    the paths to the android SDK and NDK directories, and maven 3
    executable respectively. The following per-build variables are
    available likewise: \$\$VERSION\$\$, \$\$VERCODE\$\$
    and \$\$COMMIT\$\$.

`buildjni: [yes|no|<dir list>]`<a name="build_buildjni"></a>

:   Enables building of native code via the _ndk-build_ script before
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

`ndk: <version>`<a name="build_ndk"></a>

:   Version of the NDK to use in this build.  The value is the NDK version as a
    string in either of the two official version schemes, e.g. _r21e_ or
    _21.4.7075529_.  NDK r10e or later is supported.  This can also be a list of
    version strings, and all listed versions will be installed.  The
    `ANDROID_SDK_ROOT` environment variable will be set to the first version in
    the list.

`gradle: <flavour1>[,<flavour2>,...]`<a name="build_gradle"></a>

:   Build with Gradle instead of Ant, specifying what flavours to use.
    Flavours are case sensitive since the path to the output APK is
    as well.

    If only one flavour is given and it is ’yes’, no flavour will be
    used. Note that for projects with flavours, you must specify at
    least one valid flavour since ’yes’ will build all of
    them separately.

`maven: yes[@<dir>]`<a name="build_maven"></a>

:   Build with Maven instead of Ant. An extra @&lt;dir&gt; tells F-Droid
    to run Maven inside that relative subdirectory. Sometimes it is
    needed to use @.. so that builds happen correctly.

`preassemble: <task1>[,<task2>,...]`<a name="build_preassemble"></a>

:   List of Gradle tasks to be run before the assemble task in a Gradle
    project build.

`gradleprops: <prop1>[,<prop2>,...]`<a name="build_gradleprops"></a>

:   List of Gradle properties to pass via the command line to Gradle. A
    property can be of the form `foo` or of the form `key=value`.

    For example: `gradleprops=enableFoo,someSetting=bar` will result in
    `gradle -PenableFoo -PsomeSetting=bar`.

`antcommands: <target1>[,<target2>,...]`<a name="build_antcommands"></a>

:   Specify an alternate set of Ant commands (target) instead of the
    default ’release’. It can’t be given any flags, such as the path to
    a _build.xml_.

`output: glob/to/output.apk`<a name="build_output"></a>

:   Specify a glob path where the resulting unsigned release APK from
    the build should be. This can be used in combination with build
    methods like `gradle=yes` or `maven=yes`, but if no build method is
    specified, the build is manual. You should run your build commands,
    such as `make`, in _build_.

`novcheck: true`<a name="build_novcheck"></a>

:   Don’t check that the version name and code in the resulting APK are
    correct by looking at the build output - assume the metadata
    is correct. This takes away a useful level of sanity checking, and
    should only be used if the values can’t be extracted.

`antifeatures: <antifeature1>[,<antifeature2>,...]`<a name="build_antifeatures"></a>

:   List of Anti-Features for this specific build. They are described
    in [_AntiFeatures_](#AntiFeatures).



### _AllowedAPKSigningKeys_<a name="AllowedAPKSigningKeys"></a>

When making automated binary repositories with `fdroid update`, it is generally
easy to find out the expected signing key for the APKs that are gathered.
`AllowedAPKSigningKeys` lets the repo operator set the expected signing keys, then
`fdroid update` will check that the APKs are signed by one of those keys.  If
not, the mismatched APKs will not be included in the repo.  If `fdroid update
--delete-unknown` is specified, the mismatched APKs will be deleted.  Then an
automated process can be used to download newer APKs to the repo, and they will
only be included if they have a known good signature.  The value is a lowercase
hex value of the SHA-256 fingerprint of the signing certificate.  This can be
fetched using:

```
apksigner verify --print-certs example.apk | grep SHA-256
```


### _AntiFeatures_<a name="AntiFeatures"></a>

This is optional - if present, it contains a comma-separated list of any
of the following values, describing an anti-feature the application has.
It is a good idea to mention the reasons for the anti-feature(s) in the
description:

-   ‘Ads’ - the application contains advertising.
-   ‘Tracking’ - user or activity data is tracked or leaks, by default.
    True if the app or a feature can not be used without collecting and sharing
    such data, or doing requests to a data collecting network service (regard-
    less if the service is based on free software, or not). For example, 
    activity-based down-loading of weather data, maps, avatars etc. (data 
    hosting and delivery services), or uploading of crash logs etc.
-   ‘NonFreeNet’ - the application contains a feature that uses a Non-Free
    network service which is impossible, or not easy to replace. Replacement
    requires changes to the app or service. This antifeature would not apply, if
    there is a simple configuration option that allows pointing the app to a 
    running instance of an alternative, publicly available, self-hostable, free 
    software server solution.
-   ‘NonFreeAdd’ - the application promotes Non-Free add-ons, such that
    the app is effectively an advert for other Non-Free Software.
-   ‘NonFreeDep’ - the application depends on a Non-Free application
    (e.g. Google Maps) - i.e. it requires it to be installed on the
    device, but does not include it.
-   ‘UpstreamNonFree’ - the application is or depends on Non-Free
    software. This does not mean that Non-Free Software is included with
    the app: Most likely, it has been patched in some way to remove the
    Non-Free code. However, functionality may be missing.
-   ‘NonFreeAssets’ - the application contains and makes use of
    Non-Free assets. The most common case is apps using artwork -
    images, sounds, music, etc - under a non-commercial license.
-   ‘KnownVuln’ - the application has known security vulnerabilities.
-   ‘ApplicationDebuggable‘ - APK file is compiled for debugging
    (`application-debuggable`), which normally makes it unsuitable
    for regular users and use cases.
-   ‘NoSourceSince‘ - Upstream source for this app is no longer
    available. Either the app went commercial, the repo was dropped,
    or it has moved to a location currently unknown to us. This usually
    means there won't be further updates unless the source reappears.

This is converted to (`<antifeatures>`) in the XML file (_index.xml_).


### _Disabled_<a name="Disabled"></a>

If this field is present, the application does not get put into the
public index. This allows metadata to be retained while an application
is temporarily disabled from being published. The value should be a
description of why the application is disabled. No APKs or source code
archives are deleted: to purge an APK see the Build Version section or
delete manually for developer builds. The field is therefore used when
an app has outlived it’s usefulness, because the source tarball is
retained.


### _RequiresRoot_<a name="RequiresRoot"></a>

Set this optional field to 'True' if the application requires root
privileges to be usable. This lets the client filter it out if the user
so desires. Whether root is required or not, it is good to give a
paragraph in the description to the conditions on which root may be
asked for and the reason for it.

This is converted to (`<requirements>`) in the XML file (_index.xml_).


### _ArchivePolicy_<a name="ArchivePolicy"></a>

This determines the policy for moving old versions of an app to the
archive repo, if one is configured. The configuration sets a default
maximum number of versions kept in the main repo, after which older ones
are moved to the archive. This app-specific policy setting can override
that.

The version specified via `CurrentVersionCode` is always considered the 
newest version when deciding which versions to put into the archive.
This means that when `ArchivePolicy` is set to "1 versions" only the APK
corresponding to CVC is kept, which is not necessarily the one with the 
highest version code.

Currently the only supported format is "n versions", where n is the
number of versions to keep. Defaults to "3 versions".


### _UpdateCheckMode_<a name="UpdateCheckMode"></a>

This determines the method using for determining when new releases are
available - in other words, the updating of the _CurrentVersion_ and
_CurrentVersionCode_ fields in the metadata by the `fdroid checkupdates`
process.

Valid modes are:

-   `None` - No checking is done because there’s no appropriate
    automated way of doing so. Updates should be checked for manually.
    Use this, for example, when deploying unstable or patched versions;
    when builds are done in a directory different to where the
    _AndroidManifest.xml_ is; if the developers use the Gradle build
    system and store version info in a separate file; if the developers
    make a new branch for each release and don’t make tags; or if you’ve
    changed the package name or version code logic.
-   `Static` - No checking is done - either development has ceased or
    new versions are not desired. This method is also used when there is
    no other checking method available and the upstream developer keeps
    us posted on new versions.
-   `RepoManifest` - At the most recent commit, the _AndroidManifest.xml_
    and _build.gradle_ files are looked for in the directory where
    they were found in the the most recent build. The appropriateness of
    this method depends on the development process used by the
    application’s developers. You should not specify this method unless
    you’re sure it’s appropriate. For example, some developers bump the
    version when commencing development instead of when publishing. It
    will return an error if the _AndroidManifest.xml_ has moved to a
    different directory or if the package name has changed. The current
    version that it gives may not be accurate, since not all versions
    are fit to be published.  Therefore, before building, it is often
    necessary to check if the current version has been published
    somewhere by the upstream developers, either by checking for APKs
    that they distribute or for tags in the source code repository.

    It currently works for every repository type to different extents,
    except the srclib repo type. For git, git-svn and hg repo types, you
    may use "RepoManifest/yourbranch" as _UpdateCheckMode_ so that "yourbranch" would
    be the branch used in place of the default one. The default values
    are "master" for git, "default" for hg and none for git-svn (it
    stays in the same branch). On the other hand, branch support hasn’t
    been implemented yet in bzr and svn, but _RepoManifest_ may still be
    used without it.

-   `RepoTrunk` - For svn and git-svn repositories, especially those who
    don’t have a bundled _AndroidManifest.xml_ file, the Tags and
    RepoManifest checks will not work, since there is no version
    information to obtain. But, for those apps who automate their build
    process with the commit ref that HEAD points to, RepoTrunk will set
    the _CurrentVersion_ and _CurrentVersionCode_ to that number.
-   `Tags` - The _AndroidManifest.xml_ and _build.gradle_ files in all
    tagged revisions in the source repository are checked, looking for
    the highest version code.  The appropriateness of this method
    depends on the development process used by the application’s
    developers. You should not specify this method unless you’re sure
    it’s appropriate. It shouldn’t be used if the developers like to tag
    unstable versions or are known to forget to tag releases. Like
    RepoManifest, it will not return the correct value if the directory
    containing the _AndroidManifest.xml_ has moved. Despite these caveats,
    it is the often the favourite _UpdateCheckMode_.

    It currently only works for git, hg, bzr and git-svn repositories.
    In the case of the latter, the repo URL must contain the path to the
    trunk and tags or else no tags will be found.

    Optionally append a regex pattern at the end - separated with a
    space - to only check the tags matching said pattern. Useful when
    apps tag non-release versions such as X.X-alpha, so you can filter
    them out with something like `.*[0-9]$` which requires tag names to
    end with a digit.

    Optionally `UpdateCheckData` can be specified to extract version code and
    name from repository files you specify (instead of relying on the defaults
    used to match against otherwise, which in most cases is `build.gradle` or
    `AndroidManifest.xml`).

-   `HTTP` - HTTP requests are used to determine the current version
    code and version name. This is controlled by the _UpdateCheckData_
    field, which is of the form `urlcode|excode|urlver|exver`.

    Firstly, if `urlcode` is non-empty, the document from that URL is
    retrieved, and matched against the regular expression `excode`, with
    the first group becoming the version code.

    Secondly, if `urlver` is non-empty, the document from that URL is
    retrieved, and matched against the regular expression `exver`, with
    the first group becoming the version name. The `urlver` field can be
    set to simply ’.’ which says to use the same document returned for
    the version code again, rather than retrieving a different one.



### _VercodeOperation_<a name="VercodeOperation"></a>

Operation to be applied to the vercode obtained by the defined
_UpdateCheckMode_. `%c` will be replaced by the actual vercode, and
the whole string will be passed to python’s `eval` function.

Especially useful with apps that we want to compile for different ABIs,
but whose vercodes don’t always have trailing zeros. For example, with
_VercodeOperation_ set at something like `%c*10 + 4`, we will be able
to track updates and build up to four different versions of every
upstream version.


### _UpdateCheckIgnore_<a name="UpdateCheckIgnore"></a>

When checking for updates (via _UpdateCheckMode_) this can be used to
specify a regex which, if matched against the version name, causes that
version to be ignored. For example, ’beta’ could be specified to ignore
version names that include that text.

Only Available with _UpdateCheckMode_ `HTTP`.


### _UpdateCheckName_<a name="UpdateCheckName"></a>

When checking for updates (via _UpdateCheckMode_) this can be used to
specify the package name to search for. Useful when apps have a static
package name but change it programmatically in some app flavors, by e.g.
appending ".open" or ".free" at the end of the package name.

You can also use `Ignore` to ignore package name searching. This should
only be used in some specific cases, for example if the app’s
build.gradle file does not contain the package name.


### _UpdateCheckData_<a name="UpdateCheckData"></a>

Used in conjunction with _UpdateCheckMode_ `Tag` or `HTTP`.

```
UpdateCheckData: <vercode-location>|<RegEx-for-versionCode>|<versionName-location>|<RegEx-for-versionName>
```

-   `vercode-location` - URL (with `UpdateCheckMode: HTTP`) or path/file
    relative to repo root, leave empty to check the tag name instead (with
    `UpdateCheckMode: Tags`).
-   `RegEx-for-versionCode` - RegEx to match versionCode.
-   `versionName-location` - Same as vercode-location just for versionName. A .
    means to take vercode-location, leave empty to check the tag name instead
    (only with `UpdateCheckMode: Tags`).
-   `RegEx-for-versionName` - Similar to RegEx-for-versionCode, just for versionName.
-   RegEx pipe operators are not supported at this time.

Examples for `UpdateCheckMode: Tag`:
-   Flutter app with the `pubspec.yaml` in the repo root:
    `pubspec.yaml|version:\s.+\+(\d+)|.|version:\s(.+)\+`
-   Use the git tag as version name:
    `app/build.gradle|versionCode\s(\d+)||`
-   Optionally a regex to extract the version name from the tag can be specified:
    `app/build.gradle|versionCode\s(\d+)||Android-([\d.]+)`
-   If no file for the version code was specified, code and name can be extracted from the tag:
    `'|\+(\d+)||Android-([\d.]+)'`
-   Note: Be sure to use *single* quotes around the entire value if you leave `vercode-location` empty:
    `UpdateCheckData: '|\+(\d+)||Android-([\d.]+)'`

Examples for `UpdateCheckMode: HTTP`:
-   `https://foo/version.json|"version_code":.*"(.*)"|.|"version_name":.*\"(.*)\",`
-   `https://foo/version_fdroid.txt|versionCode=(.*)|.|versionName=(.*)`


### _AutoUpdateMode_<a name="AutoUpdateMode"></a>

This determines the method used for auto-generating new builds when
new releases are available - in other words, adding a new Build
Version line to the metadata. This happens in conjunction with the
_UpdateCheckMode_ functionality - i.e. when an update is detected by
that, it is also processed by this.

Valid modes are:

-   `None` - No auto-updating is done
-   `Version` - Generates a value (tag name) used for the `commit:` property of
    new build blocks. It is simply text in which %v and %c are replaced with
    the required version name and version code respectively. The resulting
    string must match an existing tag in the app's repo, which then will be
    used by F-Droid to build the corresponding version.

    For example, if an app always has a tag "2.7.2" corresponding to
    version 2.7.2, you would simply specify "Version %v". If an app
    always has a tag "ver\_1234" for a version with version code 1234,
    you would specify "Version ver\_%c".

    Continuing the first example above, you would specify that as "Version
    +-fdroid %v" - "-fdroid" is the suffix F-Droid will then append to the
    `versionName` specified in e.g. `build.gradle` when building the APK.

    Additionally, a suffix can be added to the version name at this
    stage, to differentiate F-Droid’s build from the original.
    Continuing the first example above, you would specify that as
    "Version +-fdroid %v" - "-fdroid" is the suffix.

    If UpdateCheckMode is set to `Tags` the generator string behind `Version`
    is optional and not used for the `commit:` field.


### _CurrentVersion_<a name="CurrentVersion"></a>

The [name of the version](https://developer.android.com/guide/topics/manifest/manifest-element.html#vname) that is the recommended release. There may be newer versions of
the application than this (e.g. unstable versions), and there will
almost certainly be older ones. This should be the one that is
recommended for general use. In the event that there is no source code
for the current version, or that Non-Free libraries are being used, this
would ideally be the latest version that is still free, though it may
still be expedient to retain the automatic update check — see No Source
Since.

This field is normally automatically updated - see _UpdateCheckMode_.

This is converted to (`<marketversion>`) in the XML file (_index.xml_).


### _CurrentVersionCode_<a name="CurrentVersionCode"></a>

The [version code](https://developer.android.com/guide/topics/manifest/manifest-element.html#vcode) corresponding to the [_CurrentVersion_](#CurrentVersion) field. Both these
fields must be correct and matching although it’s the current version
code that’s used by Android to determine version order and by F-Droid
client to determine which version should be recommended.

This field is normally automatically updated - see
[_UpdateCheckMode_](#UpdateCheckMode).

If not set, clients will recommend the highest version they can, as if
the _CurrentVersionCode_ was infinite.

This is converted to (`<marketvercode>`) in the XML file (_index.xml_).


### _NoSourceSince_<a name="NoSourceSince"></a>

In case we are missing the source code for the _CurrentVersion_ reported
by Upstream, or that Non-Free elements have been introduced, this
defines the first version that began to miss source code. Apps that are
missing source code for just one or a few versions, but provide source
code for newer ones are not to be considered here - this field is
intended to illustrate which apps do not currently distribute source
code, and since when have they been doing so.




# Deprecated or Removed Fields

### _Provides_<a name="Provides"></a>

Comma-separated list of application IDs that this app provides. This
field was only ever a stub and was never used for anything.  It was
never supported in _index-v1.json nor _.yml_ metadata files.

This is converted to (`<provides>`) in the XML file (_index.xml_).
