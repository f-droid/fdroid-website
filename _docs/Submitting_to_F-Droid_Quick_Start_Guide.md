---
layout: page
title: Submitting to F-Droid Quick Start Guide
---

Doing this is apparently the best way to get your own package into the
repository, since you can provide a direct merge request for the metadata about
your package, making it easy for the maintainers.

To understand the overview of the process, read the *Proposal by Metadata Merge
Request* section of the [Inclusion How-To](../Inclusion_How-To/).

## First steps

In the source of the application you want to include, find all the
_AndroidManifest.xml_ and _build.gradle_ files, and write down in which subdir
the most detailed of them happen to be.

Register on [GitLab](https://gitlab.com/) and fork the
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) repository.

## Upstream metadata

Each official release commit in the application's upstream Git repository
should have a tag. For example, if its AndroidManifest contains `versionName:
'1.0'`, the commit needs a `v1.0` tag. It is strongly encouraged to add
metadata in the application's source repo, too:

* _metadata/en-US/short_description.txt_ (30-50 chars, no trailing dot)
* _metadata/en-US/full_description.txt_
* _metadata/en-US/images/icon.png_
* _metadata/en-US/images/phoneScreenshots/screenshot.png_

If the AndroidManifest contains `versionCode: 123`, there should be a
corresponding explanation of what's new in this version:

* _metadata/en-US/changelogs/123.txt_ (max 500 characters)

Browse the [F-Droid client
metadata](https://gitlab.com/fdroid/fdroidclient/-/tree/master/metadata/en-US)
directory to see a real-world example.

Other formats and locations of the [description, graphics, and
screenshots](../All_About_Descriptions_Graphics_and_Screenshots/) are
supported, too. For example, the _metadata/en-US_ directory can instead be
_fastlane/metadata/android/en-US_.

Send the application's development team a merge request if the repository
doesn't have those files, and open an issue if it has no version tags. Having
this metadata in place lets it be under direct control of the developer, and
their updates and future translations will be pulled automatically.

## Build environment

On a laptop with Ubuntu 21.10 in February 2022, it took 2 GB of traffic and 5
GB of disk space to set up an F-Droid build environment.

Network requirements:

* 60 MB: shallow-clone _fdroiddata_ and _fdroidserver_
* 75 MB: install _docker.io_
* 1000 MB: load the container
* 800 MB: build

Storage requirements:

* 1000 MB: clone the repos and install _docker.io_
* 4000 MB: load the container and build

Download your fork, then create a new branch and a metadata file. For example,
if the application's _build.gradle_ says `applicationId "com.example"`:

```sh
git clone --depth=1 https://gitlab.com/YOUR_ACCOUNT/fdroiddata ~/fdroiddata
cd ~/fdroiddata
git checkout -b com.example
cp templates/build-gradle.yml metadata/com.example.yml
```

Fill _~/fdroiddata/metadata/com.example.yml_ according to the [build metadata
reference](../Build_Metadata_Reference/). If you have convinced the
application's development team to include the descriptions and use version tags
in their repository as explained above, the file will be very concise:

```yaml
Categories:
  - Internet
  - Navigation
License: GPL-3.0-or-later
SourceCode: https://gitlab.com/APPLICATION_UPSTREAM/ExampleCom

RepoType: git
Repo: https://gitlab.com/APPLICATION_UPSTREAM/ExampleCom

Builds:
  - versionName: '1.0'
    versionCode: 123
    commit: v1.0
    # Where build.gradle is:
    subdir: app
    sudo:
      - apt-get update || apt-get update
      - apt-get install -y librsvg2-bin openjdk-11-jdk-headless
      - update-alternatives --auto java
    gradle:
      - yes

AutoUpdateMode: Version
UpdateCheckMode: Tags
CurrentVersion: '1.0'
CurrentVersionCode: 123
```

Adjust or remove the relevant _sudo_ lines if needed:

* The example application's _build.gradle_ executes _rsvg-convert_ to
  rasterize its vector icons, so we install _librsvg2-bin_ from the official
  Debian repositories. All such dependencies should be specified in the app's
  _README_.

* _build.gradle_ mentions `com.android.tools.build:gradle:7.1.0`,
  and the Gradle Android plugin version 7 is known to depend on Java 11. So we
  install _openjdk-11-jdk-headless_ and select it as the _java_ alternative.

Download and launch the latest version of the server tools container:

```sh
git clone --depth=1 https://gitlab.com/fdroid/fdroidserver ~/fdroidserver
sudo sh -c 'apt-get update &&apt-get install -y docker.io'
sudo docker run --rm -itu vagrant --entrypoint /bin/bash \
  -v ~/fdroiddata:/build:z \
  -v ~/fdroidserver:/home/vagrant/fdroidserver:Z \
  registry.gitlab.com/fdroid/fdroidserver:buildserver
```

In the container:

```sh
. /etc/profile
export PATH="$fdroidserver:$PATH" PYTHONPATH="$fdroidserver"
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 > /dev/null | grep 'java.home' | awk -F'=' '{print $2}' | tr -d ' ')
cd /build
fdroid readmeta
fdroid rewritemeta com.example
fdroid checkupdates --allow-dirty com.example
fdroid lint com.example
fdroid build com.example
```

If any command, such as `fdroid readmeta`, returns an error, edit
_~/fdroiddata/metadata/com.example.yml_ accordingly and try running the command
again. After a successful build, exit the container, commit your metadata file
with a `New App` label, and push it to your fork:

```sh
exit
cd ~/fdroiddata
git add metadata/com.example.yml
git commit -m "New App: com.example"
git push origin com.example
```

Create a [merge request](https://gitlab.com/fdroid/fdroiddata/-/merge_requests)
at the fdroiddata repository, selecting your _com.example_ source branch. Wait
for the packagers to pick up your merge request. Please keep track if they
asked any questions and reply to them as soon as possible.

## Troubleshooting

You can [get help with F-Droid](../../about/#contact) via IRC, Matrix, XMPP,
e-mail and some other channels.
