---
layout: post
title: Our build and release infrastructure, and upcoming updates
author: "eighthave"
---

Behind the scenes of F-Droid is a giant pile of automation to manage the process of building thousands of apps from source.  This means checking out thousands of source repos, checking them all for updates, building and new releases, and securely signing them en masse.  All builds are run in a fresh virtual machine guest instance known as the [_buildserver_](https://gitlab.com/fdroid/fdroidserver/-/tree/master/buildserver).  All Gradle binaries and Android SDK packages are verified against our [public](https://gitlab.com/fdroid/android-sdk-transparency-log) [logs](https://gitlab.com/fdroid/gradle-transparency-log) of observed SHA-256 checksums.  The transparency log processes also verify against upstream's [public checksums](https://gradle.org/release-checksums/).

Our setup runs on Debian almost exclusively.  Debian is a leader in free software, rock solid servers, and reproducible builds.  That makes it a natural home for F-Droid.  We also work to ensure we maintain the packages we use, and build our processes on top of Debian packages.  That means we share the maintenance with anything that uses Debian.  It may seem like more work to give back, but our experience is that it pays off in the long run.  The F-Droid community is able to maintain many things with a small team.  Another example of this is this website itself: it is built using Jekyll packages that are all in Debian.

If you have an app on f-droid.org, you might have noticed that all builds happen on a 5 year old Debian release: _stretch_.  We are in the midst of a [big effort](https://gitlab.com/groups/fdroid/-/milestones/5) to upgrade to the latest _bullseye_ release right now.  This is not just a simple `apt-get upgrade`, we are also taking this opportunity to overhaul the build process so that app builds work with a relatively plain Debian install as the base OS.  We have to provide a platform to build thousands of apps, so we cannot just upgrade the base image as often as we like.  Some apps need the latest, greatest.  Other apps need the ancient, stable base OS.
This change means that the [metadata]({{ site.baseurl }}/docs/Build_Metadata_Reference) contains as much of the build logic as possible, so that the app maintainer has control over all the steps.  To achieve this, as much as possible is being stripped out of the from the _buildserver_ base image.

We have considered offering a selection of base images.  This is a possible solution, but it is not easy as just using any available Docker image.  Only base images that are guaranteed to be free software are appropriate.  Just pointing to any Docker image would open up the possibility of proprietary build dependencies, since it is not possible to automatically check whether any Docker image is 100% free software.  Using a selection of pre-approved base boxes could solve that.  Keep in mind, this is more complex than with GNU/Linux distros since Android apps are cross-compiled.  GNU/Linux distros build their packages on their own OS.  During builds, Debian does not even allow network access since all dependencies need to come from Debian packages.  That level of verification is a goal of F-Droid, and [Maven](https://maven.apache.org/guides/mini/guide-reproducible-builds.html)'s work towards a reproducible [Maven Central](https://reproducible-builds.org/docs/jvm/) ecosystem helps a lot.

Since [CalyxOS](https://calyxos.org/) builds in F-Droid by default, [Calyx Institute](https://calyxinstitute.org/) also want to ensure that F-Droid is running smoothly, and that app developers are happy.  I would like to thank Calyx Institute for sponsoring 42 hours a month of my time to work on making our build infrastructure run smoothly.  Additionally, I will be working on improving the automation of the signing process.  Our signing process is currently 100% offline.  While this is nice for security, it does slow down the release process.  With modern hardware security modules and server setups, it is possible to have good security without being 100% offline.  Having signing automation then opens up possibilities for parallelizing the whole process, including running multiple app builds, and also, running the main steps of building, index generating, and signing all in parallel.  This work will be incrementally deployed as each bit is finished. So be patient, and you will notice releases happening faster and faster!