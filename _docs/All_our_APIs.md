---
layout: page
title: All our APIs
---


For F-Droid to be trusted, we need to be transparent.  Making it easy for people
to pay attention to all the processes and systems we use helps us stay secure.
These are the APIs with key information about the publishing process.


## Active packages

There is a per-app API accessible via `https://f-droid.org/api/v1/packages`,
which can be used to query information about the applications in the main
repository. The JSON API currently lists the published and suggested
versions. Archived applications and packages are not available in this API.

Example request:

```
GET https://f-droid.org/api/v1/packages/org.fdroid.fdroid HTTP/1.1
```

Example response:
```
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8
```
```json
{
  "packageName": "org.fdroid.fdroid",
  "suggestedVersionCode": 1009000,
  "packages": [
    {
      "versionName": "1.10-alpha0",
      "versionCode": 1010000
    },
    {
      "versionName": "1.9",
      "versionCode": 1009000
    }
  ]
}
```

This API is already used by shields.io project to provide F-Droid badges, [like this](https://img.shields.io/f-droid/v/org.fdroid.fdroid).

Note: the expected client behaviour is to install `suggestedVersionCode`, and if that's not available _(eg. if package [waits for a rebuild](https://monitor.f-droid.org/builds/missingbuilds) or if package [waits for manual update](https://monitor.f-droid.org/builds/needsupdate))_ then use the highest `versionCode` that is compatible with the device.


### The repo index

F-Droid is built around a signed index of all the apps and packages that are
available.  This is a JSON file, though more of an index than an API since all
the information is distributed via a single file.

* <https://f-droid.org/repo/index-v2.json>
* <https://f-droid.org/repo/index-v1.json>
* <https://f-droid.org/archive/index-v2.json>
* <https://f-droid.org/archive/index-v1.json>

As of index-v2, there is support for files that only contain the changes, known
as "diff" files.  There is also a separate entry point, which is signed by a JAR
and a GPG signature and lists the available index and diff files.

* <https://f-droid.org/repo/entry.jar>
* <https://f-droid.org/repo/entry.json>
* <https://f-droid.org/repo/entry.json.asc>

The v1 repo index formats come in the form of a signed JAR file that
contains _index-v1.json_.  The best method is to verify the JAR signature, then
extract _index-v1.json_ if it validates. The _fdroidserver_ Python library
provides `fdroidserver.download_repo_index()` to make this easy to do.

* <https://f-droid.org/repo/index-v1.jar>
* <https://f-droid.org/archive/index-v1.jar>

There are also GPG signatures for verifying the JSON files:

* <https://f-droid.org/repo/index-v2.json.asc>
* <https://f-droid.org/repo/index-v1.json.asc>
* <https://f-droid.org/archive/index-v2.json.asc>
* <https://f-droid.org/archive/index-v1.json.asc>


###  App Search API

We've got a basic web-api for performing a full-text searches on the
_f-droid.org_ repository.

* <https://search.f-droid.org/api/search_apps?q=f-droid>


###  App build metadata

Every app in _f-droid.org_ has a corresponding
[build metadata file]({{ site.baseurl }}/docs/Build_Metadata_Reference) in
[_fdroiddata_](https://gitlab.com/fdroid/fdroiddata).  In order to encourage
more creative reuse, we keep our data in standard formats in easy to find
places.  The whole app collection is in [YAML format]({%
post_url 2019-09-11-yaml-metadata %}).  The file can be directly accessed
by Application ID using the GitLab Raw URL
`https://gitlab.com/fdroid/fdroiddata/-/raw/master/metadata/<ApplicationID>.yml`
(e.g. <https://gitlab.com/fdroid/fdroiddata/-/raw/master/metadata/org.fdroid.fdroid.yml>).
The repo index and the [GitLab Repository Files
API](https://docs.gitlab.com/ee/api/repository_files.html) can be used to query
which Application IDs are available.  These files are also available via the
mirror on GitHub,
e.g. <https://raw.githubusercontent.com/f-droid/fdroiddata/master/metadata/org.fdroid.fdroid.yml>


### f-droid.org build server status

The four main steps of the build cycle are: _checkupdates_, _build_, _update_,
and _deploy_.  There is a JSON file for each one of those with status
information.  It is posted once that step completes running.  The step that is
currently running is posted to _running_.

* <https://f-droid.org/repo/status/running.json>
* <https://f-droid.org/repo/status/build.json>
* <https://f-droid.org/repo/status/update.json>
* <https://f-droid.org/repo/status/deploy.json>

Two examples of how these JSON APIs can be used are the [F-Droid
Monitor](https://monitor.f-droid.org/) website and the [F-Droid Build Status]({{
site.baseurl }}/packages/de.storchp.fdroidbuildstatus/) app.


### Mirror and repo monitoring

[_mirror-monitor_](https://gitlab.com/fdroid/mirror-monitor) and
[_repo-monitor_](https://gitlab.com/fdroid/repo-monitor) are automated jobs that
check various stats about _f-droid.org_ mirrors and third party repos
respectively.  They each provide a single, large JSON log of all the times the
checks where run:

* _f-droid.org_ mirror status: <https://fdroid.gitlab.io/mirror-monitor/report.json>
* third-party repo status: <https://fdroid.gitlab.io/repo-monitor/report.json>


### Reproducible builds

_verification.f-droid.org_ is a rebuilder that rebuilds the official releases
from _f-droid.org_, then checks to see if they were [reproducibly
built](https://reproducible-builds.org/). There is an entry point for each package based on the package name:
<https://verification.f-droid.org/org.fdroid.fdroid.json>

Then there is a JSON file per APK that has been checked, where the filename
follows the pattern `<ApplicationId>_<VersionCode>.apk.json`, for example:
<https://verification.f-droid.org/org.fdroid.fdroid_1010050.apk.json>

There is also a listing of all the successfully verified APKs:
<https://verification.f-droid.org/verified.json>


### Binary transparency logs

[Binary transparency](https://wiki.mozilla.org/Security/Binary_Transparency) is
the idea that all released packages should be logged as they are published.
This provides a way to check if a given binary was produced by the publisher, or
came from somewhere else, e.g. as an exploit.  _fdroidserver_ has built in tools
for managing a binary transparency log of the index files as part of the release
process. This has been enabled on _f-droid.org_:
<https://gitlab.com/fdroid/f-droid.org-transparency-log>

Since Gradle and the Google Android Tools team does not publish one, F-Droid has
done it.  The basic API is a JSON file with a listing of all URLs known to have
be published.  Each URL then contains a list of SHA-256 checksums that the log
process has seen.  There are also other files tracked, based on what the
publisher provides.

* <https://gitlab.com/fdroid/gradle-transparency-log/-/raw/master/checksums.json>
* <https://gitlab.com/fdroid/android-sdk-transparency-log/-/raw/master/checksums.json>


### <tt>issuebot</tt>

[_issuebot_](https://gitlab.com/fdroid/issuebot#json-rest-api) runs on app merge
requests and requests for packaging (RFP) to provide information to reviewers
about the app.  Much of that information is also published in JSON format.  Each
report is made of data from modules that run on a specific app.  There are two
entry points:

* <https://fdroid.gitlab.io/rfp/issuebot/applicationIds.json>
* <https://fdroid.gitlab.io/rfp/issuebot/sourceUrls.json>


### Metrics

[Usage data]({% post_url 2019-04-15-privacy-preserving-analytics %})
is gathered from [various F-Droid websites](https://fdroid.gitlab.io/metrics/)
and published with no personally identifiable information (PII).  It is
published with one JSON file per-week, with a JSON index file per website.  For
example, here is a week of search metrics:
<https://fdroid.gitlab.io/metrics/search.f-droid.org/2021-01-18.json>

Though not really an API, the <ftp.fau.de> mirror does provide some metrics:
https://ftp.fau.de/cgi-bin/show-ftp-stats.cgi


### Git stats

Each _git_ repo has lots of interesting metadata.  The _GitStats_ project
generates nice charts from that data.  This is not quite an API, but it is
related since it is using public project data.  Pre-generated pages for each of
the central git repos are visible here: <https://fdroid.gitlab.io/>.
