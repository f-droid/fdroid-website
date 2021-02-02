---
layout: post
title: <tt>fdroidserver</tt> 2.0
author: eighthave
---

_fdroidserver_ is the core collection of tools for building apps, scanning them
for issues or [Anti-Features]({{ site.baseurl }}/docs/Anti-Features),
collecting the resulting files into repos, and publishing them to the
world. Today, a big update was released which has a large number of changes and
updates that have been a long time coming.  First, this release turns our 10
year old collection of tools and tricks for working with Android apps into more
of a toolkit with an API, including a core set of [functions declared with a
stable
interface](https://gitlab.com/fdroid/fdroidserver/blob/master/fdroidserver/__init__.py).
This allows for a wide range of new uses, like [headless, automated
repos](https://gitlab.com/guardianproject/wind-repo/-/blob/master/scripts/fdroid-update-ersatz.py)
or [_issuebot_](https://gitlab.com/fdroid/issuebot/-/blob/master/issuebot.py).
It is now also possible to extend the command line interface using the new
[plugins](https://gitlab.com/fdroid/fdroidserver/-/blob/master/examples/fdroid_fetchsrclibs.py).
The app metadata files are now purely [YAML]({{ site.baseurl }}/{% post_url
2019-09-11-yaml-metadata %}), so they are an API in themselves, easily parsable
and writeable by any standard YAML library.  Also, the preferred format for the
repo config file is now YAML (_config.yml_).

F-Droid is 10 years old, so this release also focused on modernizing.  Software
developed and used over 10 years inevitably builds up cruft and technical debt.
We took this opportunity to remove lots of things that were broken, unused, or
unmaintained. So there are some breaking changes, as detailed in the Changelog. 
We hope this all makes it a lot easier for new contributors to get involved and
make valuable contributions, all while making things work better for existing
contributors.

Last but not least, this is the first _fdroidserver_ release that fully supports
[localization](https://hosted.weblate.org/projects/f-droid/fdroidserver/).  2.0
ships with བོད་སྐད་, Deutsch, English, español, français, magyar, italiano,
한국어, norsk bokmål, polski, português do Brasil, português europeu, русский,
shqip, Türkçe, українська, 简体中文, and 繁體中文.


## ChangeLog

This changelog points to specific highlights and details.  For a more complete
overview, see the [2.0 milestone](https://gitlab.com/fdroid/fdroidserver/-/milestones/10)

### Added
* `fdroid update` inserts donation links based on upstream's _FUNDING.yml_
  ([!754](https://gitlab.com/fdroid/fdroidserver/merge_requests/754))
* Stable, public API for most useful functions
  ([!798](https://gitlab.com/fdroid/fdroidserver/merge_requests/798))
* Load with any YAML lib and use with the API, no more custom parser needed
  ([!826](https://gitlab.com/fdroid/fdroidserver/merge_requests/826))
  ([!838](https://gitlab.com/fdroid/fdroidserver/merge_requests/838))
* _config.yml_ for a safe, easy, standard configuration format
  ([!663](https://gitlab.com/fdroid/fdroidserver/merge_requests/663))
* Config options can be set from environment variables using this syntax:
  `keystorepass: {env: keystorepass}`
  ([!669](https://gitlab.com/fdroid/fdroidserver/merge_requests/669))
* Add SHA256 to filename of repo graphics
  ([!669](https://gitlab.com/fdroid/fdroidserver/merge_requests/669))
* Support for srclibs metadata in YAML format
  ([!700](https://gitlab.com/fdroid/fdroidserver/merge_requests/700))
* Check srclibs and app-metadata files with yamllint
  ([!721](https://gitlab.com/fdroid/fdroidserver/merge_requests/721))
* Added plugin system for adding subcommands to `fdroid`
  ([!709](https://gitlab.com/fdroid/fdroidserver/merge_requests/709))
* `fdroid update`, `fdroid publish`, and `fdroid signindex` now work
  with SmartCard HSMs, specifically the NitroKey HSM
  ([!779](https://gitlab.com/fdroid/fdroidserver/merge_requests/779))
  ([!782](https://gitlab.com/fdroid/fdroidserver/merge_requests/782))
* `fdroid update` support for Triple-T Gradle Play Publisher v2.x
  ([!683](https://gitlab.com/fdroid/fdroidserver/merge_requests/683))
* Translated into: bo de es fr hu it ko nb_NO pl pt pt_BR pt_PT ru sq tr uk
  zh_Hans zh_Hant

### Fixed
* Smoother process for signing APKs with `apksigner`
  ([!736](https://gitlab.com/fdroid/fdroidserver/merge_requests/736))
  ([!821](https://gitlab.com/fdroid/fdroidserver/merge_requests/821))
* `apksigner` is used by default on new repos
* All parts except _build_ and _publish_ work without the Android SDK
  ([!821](https://gitlab.com/fdroid/fdroidserver/merge_requests/821))
* Description: is now passed to clients unchanged, no HTML conversion
  ([!828](https://gitlab.com/fdroid/fdroidserver/merge_requests/828))
* Lots of improvements for scanning for proprietary code and trackers
  ([!748](https://gitlab.com/fdroid/fdroidserver/merge_requests/748))
  ([!844](https://gitlab.com/fdroid/fdroidserver/merge_requests/844))
* `fdroid mirror` now generates complete, working local mirror repos
* fix build-logs dissapearing when deploying
  ([!685](https://gitlab.com/fdroid/fdroidserver/merge_requests/685))
* do not crash when system encoding can not be retrieved
  ([!671](https://gitlab.com/fdroid/fdroidserver/merge_requests/671))
* checkupdates: UpdateCheckIngore gets properly observed now
  ([!659](https://gitlab.com/fdroid/fdroidserver/merge_requests/659),
  [!660](https://gitlab.com/fdroid/fdroidserver/merge_requests/660))
* keep yaml metadata when rewrite failed
  ([!658](https://gitlab.com/fdroid/fdroidserver/merge_requests/658))
* import: `template.yml` now supports omitting values
  ([!657](https://gitlab.com/fdroid/fdroidserver/merge_requests/657))
* build: deploying buildlogs with rsync
  ([!651](https://gitlab.com/fdroid/fdroidserver/merge_requests/651))
* `fdroid init` generates PKCS12 keystores, drop Java < 8 support
  ([!801](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/801))
* Parse Version Codes specified in hex
  ([!692](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/692))
* Major refactoring on core parts of code to be more Pythonic
  ([!756](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/756))
* `fdroid init` now works when installed with pip

### Removed
* Removed all support for _.txt_ and _.json_ metadata
  ([!772](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/772))
* dropped support for Debian 8 _jessie_ and 9 _stretch_
* dropped support for Ubuntu releases older than bionic 18.04
* dropped `fdroid server update` and `fdroid server init`,
  use `fdroid deploy`
* `fdroid dscanner` was removed.
  ([!711](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/711))
* `make_current_version_link` is now off by default
* Dropped `force_build_tools` config option
  ([!797](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/797))
* Dropped `accepted_formats` config option, there is only _.yml_ now
  ([!818](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/818))
* `Provides:` was removed as a metadata field
  ([!654](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/654))
* Remove unused `latestapps.dat`
  ([!794](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/794))
