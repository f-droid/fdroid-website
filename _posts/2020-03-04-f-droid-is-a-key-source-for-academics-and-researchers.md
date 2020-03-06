---
layout: post
title: F-Droid is a Key Source for Academics and Researchers
author: "eighthave"

---

We rarely hear from academics and researchers, but we know that F-Droid is important to their work because they cite F-Droid as a source in so many papers:

* arXiv lists [more than 200 results](http://search.arxiv.org:8081/?query=f-droid)
* Semantic Scholar lists [more than 200 results](https://www.semanticscholar.org/search?q=f-droid.org)
* Google Scholar lists [more than thousand results](https://scholar.google.com/scholar?q=fdroid)

Here are a couple that we found particularly interesting:

* [Deobfuscating Android Applications through Deep Learning](https://pdfs.semanticscholar.org/8587/79f77d4934ddab0552fc6817f85d2bc32926.pdf)
* [Reliable Third-Party Library Detection in Android and its Security Applications](https://trust.cispa.saarland/~bugiel/publications/pdfs/bugiel16-ccs.pdf)

We welcome everyone using F-Droid as a resource, this is one valuable thing that only Free Software can provide.  Free Software means giving people the freedom to use the software for things they are interested in.  F-Droid is not only providing Free Software apps, but also lots of Free Software tools, as well as a whole collection of cleanly organized data about all that software.  We are happy to see our hard work be put to use towards making a better Android ecosystem.  We especially enjoy the attention of malware researchers, who have yet to find malware in F-Droid.  F-Droid also provides tools to make building lots of apps much easier, like `fdroid import` to set up building apps from the source URL, and the full build stack, which automates building and deploying apps to a repo.

As part of the [NLnet-funded](https://nlnet.nl/project/F-Droid-Trackers/) [Tracking the Trackers]({{ site.baseurl }}{% post_url 2020-01-16-tracking-the-trackers %}) project, we are also cleaning up and expanding our tools for detecting tracking.  For example, there is now the reusable [issuebot](https://gitlab.com/fdroid/issuebot) for running these checks in GitLab.  We are also generating a lot of data about how tracking works, and will be publishing as much of that as possible.  We will be syncing with [Exodus Privacy's ETIP database](https://etip.exodus-privacy.eu.org/), and we encourage others to use that as the common, public database about tracking.


## Creative Reuse

In order to encourage more creative reuse, we have been pushing to make all of our data in standard formats in easy to find places.  The whole app collection is now in _fdroiddata_ [YAML format]({{ site.baseurl }}/2019/09/11/yaml-metadata.html).  Using `from fdroidserver import index` provides easy access to the data in the repo index files (e.g. https://f-droid.org/repo/index-v1.jar).  There are also a number of binary transparency logs to keep a record of key binaries used in the building process: [gradle binaries](https://gitlab.com/fdroid/gradle-transparency-log/-/raw/master/all.json), [Android SDK binaries](https://gitlab.com/fdroid/android-sdk-transparency-log/-/blob/master/checksums.json), [guardianproject.info/fdroid binary transparency log](https://github.com/guardianproject/binary_transparency_log)


## Download All the Things!

Our whole repository of APKs, source tarballs, icons, etc. is available for download and use.  For example, it is often used as the "clean set" of APKs for malware research.  There are a number of ways to get the full collection from a repo.  _f-droid.org_ is now mirrored on many standard Free Software mirror servers, three of those currently provide _rsync_, which is the preferred way to download a lot (the repo section is about 70 GB, and the whole archive is nearing 400 GB).

* China: `rsync -axv mirrors.tuna.tsinghua.edu.cn::fdroid/repo`
* Germany: `rsync -axv ftp.fau.de::fdroid/repo`
* USA/Indiana: `rsync -axv plug-mirror.rcac.purdue.edu::fdroid/repo`

Please use mirrors, don't download from _f-droid.org_, since it can overwhelm the main server.  Also, there is no more need for custom crawlers for those who want to mirror other F-Droid repos.  We have our own: `fdroid mirror`.  And lastly, if you are going to keep a copy of the _f-droid.org_ repo, you can give back by opening it up as a public mirror.  We are looking for public mirrors outside of the EU, especially Africa, Australia, and South America.

## Contribute

The F-Droid robot does not run itself, it takes time and money to keep going.  So we ask all those who rely on F-Droid in their research to give something back to keep F-Droid going.  Here are some suggestions:

* [Donate money!]({{ site.baseurl }}/donate)
* [Get involved in working on issues](https://gitlab.com/groups/fdroid/-/issues?scope=all&utf8=%E2%9C%93&state=opened&label_name[]=help-wanted)
* [Hire an F-Droid contributor]({{ site.baseurl }}/consulting) to help with your project
* Host some infrastructure for F-Droid
* Review some apps in [fdroiddata](https://gitlab.com/fdroid/fdroiddata/-/merge_requests) or [rfp](https://gitlab.com/fdroid/rfp/issues)

Lastly, if you are a researcher or academic working with F-Droid data, please come by and say hi! We are always interested to hear about how people are using our work.
