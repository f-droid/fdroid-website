---
author: linsui
layout: post
title: "Maven Central is not as free as it looks"
---

F-Droid is always commited to distribute FOSS Android apps. Building free software from source for Android comes with a different set of challenges from GNU/Linux distros like Debian. Android apps are cross-compiled: they are not built on the same OS as they run. On top of that, Android provides only a barebones set of libraries built-in. Like the Java ecosystem, apps are expected to fetch library binaries from Maven repos and build them into the app. To ensure that the app is only built with FOSS deps, we develop a scanning system in _fdroidserver_ to restrict the dependency source and find problematic dependencies.

F-Droid forbids unknown Maven repos and trusts only some well-known Maven repos [since 2015](https://gitlab.com/fdroid/fdroidserver/-/commit/21117b77d228458b4d3b003c4af19a2ac236b784). From then on, [some](https://gitlab.com/fdroid/fdroidserver/-/commit/d17da074e92e59bd543c362aff1bde3f087a0220) [more](https://gitlab.com/fdroid/fdroidserver/-/commit/a92f9a3a4c26e6b0b66f711891d342813d58cf48) [repos](https://gitlab.com/fdroid/fdroidserver/-/commit/1ff4f63de348ccca80dc3e773fcd2da58ffd07b2) [are](https://gitlab.com/fdroid/fdroidserver/-/commit/c87cdb91db3e731384d67045563d056b03858728) [added](https://gitlab.com/fdroid/fdroidserver/-/commit/c056b95fd5db81484d9e2b21d71975b12ffa9ac3) [to](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/102) the list. Currently there are 8 Maven repos we trust:

- Maven Central
- Google Maven Repo
- JCenter
- OSS Sonatype
- OSS JFrog
- JitPack.io
- Clojars
- CommonsWare
- Gradle plugin repo

In 2020, JAR and AAR files embeded in the source code were [forbidden](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/325) and these trusted repos became the last weak point. We rely on them to provide only FOSS libs. However, none of them are guaranteed to do so and they have been a big source of non-free libs sneaking into the APKs. 

The Maven Central repo is ["the largest collection of Java and other open source components"](https://central.sonatype.org/pages/about/#what-is-the-central-repository) and a default source of libraries for Maven and Gradle ["Serving Open Source Components Since 2002"](https://central.sonatype.org/). The vast majority of libraries used in Android apps, outside of Google's own, are fetched from Maven Central. It's one of the most established and well-known Maven repos. Maven Central has strict requirements that [the source code](https://central.sonatype.org/publish/requirements/#supply-javadoc-and-sources) and [the source control system information](https://central.sonatype.org/publish/requirements/#scm-information) should be provided, and [the license should be declared](https://central.sonatype.org/publish/requirements/#license-information). It also requires that the group ID should match the owner's domain and the files should be signed. Furthermore, Maven Central [supports reproducible builds](https://Maven.apache.org/guides/mini/guide-reproducible-builds.html) in a first class way which is a big help for ensuring that apps are 100% free software.

Everything sounds too good to be true.  Unfortunately, it is. Though they declare that Maven Central is ["OSS Repository Hosting"](https://central.sonatype.org/publish/publish-guide/#introduction), they don't require that the libs hosted on there are FOSS. Sometimes we find that [a](https://gitlab.com/fdroid/fdroidserver/-/issues/628) [non-free](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/680) [lib](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/542) was pulled from Maven Central and have to disable lots of affected versions of published apps.

Are those open source libs hosted on Maven Central trustable? No, not really. Some libs are tagged with a FOSS license but the source JAR files are empty. What is worse is that they even encourage [uploading a dummy source JAR file of the sources to pass the requirements](https://central.sonatype.org/faq/closed-source/) which makes their requirement totally meaningless. The declared license information may [just](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1147) [be](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1150) [wrong](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1130) and the source control system information just [points to a random link](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1130) or [a repo with binary jars only](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1147). Another common case is that the lib itself is "open source" but it depends on other [proprietary](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/712) [libs](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1150).

Other trusted Maven repos also have problems. The Google one hosts many proprietary libs, of course, and the open source libs may [depend](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1011) on those proprietary one. The OSS Sonatype and JCenter repos are synced with Maven Central, and include some extra libs. JitPack.io hosts whatever is built from GitHub, without [checking the license](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1091) or if there is any binary in the repo, let alone the dependencies. Clojars and Gradle plugin repo don't have a license requirement either. The java packages from Debian and the CommonsWare repo are pretty good but barely used.

Given our limited resource and the situation, this may be an endless fighting. But we are getting more weapons. Thanks to our binary scanner, we have [found](https://gitlab.com/fdroid/fdroidserver/-/issues/1004) lots of libs that depend on non-free deps in these Maven repos, most of which are from Maven Central. In the future we may scan the dependency map to find them before the build. However, this can't help find libs with non-free license. Those non-free libs in our block list are mostly found by chance and experience. We are now [working on](https://gitlab.com/groups/fdroid/-/milestones/10#tab-issues) more reliable methods for the future.  
