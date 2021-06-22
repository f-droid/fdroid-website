---
layout: post
title: Announcing <tt>issuebot</tt>
author: eighthave
---

F-Droid is a robot with a passion for Free and Open Source (FOSS)
software, and now F-Droid has a new helper: _issuebot_!  It started
life as a hacked together
[script](https://gitlab.com/fdroid/rfp/blob/69a9e2b7a11dfbc492dbdd334f426bcbec257880/.issuebot.py)
running on the [RFP](https://gitlab.com/fdroid/rfp/issues) tracker,
where it was doing some automated checks on the information that
people submitted in their requests for packaging.  As part of the
Tracking the Tracker project, we talked to maintainers and
contributors to F-Droid's
[_fdroiddata_](https://gitlab.com/fdroid/fdroiddata/issues) and RFP to
find out how _issuebot_ could help them. One key goal was to make it
possible for people to contribute to the app reviews, even if they are
not an Android developer in any way, shape, or form.  This is possible
by making _issuebot_ run as many of the core build processes and
review tools automatically, then _issuebot_ presents that information
as a response in the thread of the RFP issue or _fdroiddata_ merge
request.  We brainstormed a number of ways to present this
information, and decided the best place to integrate _issuebot_ was
into the existing workflow where F-Droid contributors and community
members work on reviewing apps: the GitLab projects.  There are always
uses for this information that we did not anticipate, and the data was
already being assembled into a single place, so _issuebot_ also
includes a JSON API.

Now _issuebot_ is a full-fledged automaton that start with a source
URL, build an APK app file, scan the source code and APK for issues,
and post reports to gitlab.com.  This has already improved the human
efficiency in terms of reviewing app submissions and providing
feedback to submitters.


## RFP Issues

Anyone can submit a "request for packaging" (RFP) or app merge request
to F-Droid.  The basic user experience is familiar to most internet
users since it is built around a user account and a form to submit
text.  This means that the RFP issue tracker has less technical users.
Given the relative simplicity of _issuebot_, the goal had to be to
help reviewers communicate to submitters.  Technical submitters will
be able to follow the _issuebot_ posts, and in other cases, F-Droid
contributors can point non-technical submitters to information in the
_issuebot_ reports in order to highlight problems.  As long as they
provide a link to a source code repository or an Android APK app file,
_issuebot_ can provide useful reviews on its own.  It also presents
lots of information to make the human reviewer's job a lot easier.
There are RFP issues, and the submitted apps can contain a wide
variety of technological approaches and coding environments.  No
reviewer has all of those skills, so it is important for reviewers to
be able to quickly find submissions that they will feel qualified to
review.  Also, there are many things that _issuebot_ can automaticaly
detect.  Therefore, we built a system of colored labels for _issuebot_
to add to every submission.  From these labels, a reviewer can quickly
select the platform they are familiar with, e.g. Flutter.  They can
also see whether a submission has clear problems that likely
disqualify it, like requiring proprietary libraries or known tracking
services.

<img alt="labels from RFP issuebot" src="{% asset posts/2020-12-21-announcing-issuebot/rfp-labels.png %}" />

The GitLab issue labels also provide a simple interface for managing
when _issuebot_ runs on an issue.
[_issuebot_](https://gitlab.com/fdroid/issuebot) runs on a schedule to
scan all new submissions and post its reports directly to the issue or
merge request.  Once _issuebot_ completes posting its report, it will
add the `fdroid-bot` label to the issue.  That tells _issuebot_ to
ignore the issue in future runs.  To allow _issuebot_ to run on any
item again, remove the `fdroid-bot` label.  On the next run,
_issuebot_ will do the whole review from the beginning.


## _fdroiddata_ Merge Requests

For app merge requests, we focused on the people involved in
submitting, reviewing and accepting the merge requests.  We therefore
assume basic working knowledge of GitLab, Git, and how Android apps
are built.  In this case, _issuebot_ responds to changes to the code
contained in the merge request.  Often times, when apps are submitted
to _fdroiddata_, they must be changed in order to build properly and
meet the F-Droid standards.  In this case, the technical posts by
_issuebot_ speak directly to the app submitter.  The F-Droid
contributors regularly review the merge requests, and can provide
feedback and assistance as expected by participants of a merge request
user experience.

[This merge
request](https://gitlab.com/fdroid/fdroiddata/-/merge_requests/7514)
that adds the newspaper [taz](https://taz.de/)'s new app is a good
example of the user experience.  It was submitted as "Work In
Progress" before _issuebot_ started reviewing merge requests.  It
received review and feedback from F-Droid contributors.  The submitter
made changes, then _issuebot_ kicked in and provided feedback to the
submitter with each update.

<img alt="issuebot reviews a merge request" src="{% asset posts/2020-12-21-announcing-issuebot/merge-request-review.png %}" />

Unfortunately, there are currently no labels on merge requests.
Technical limitations of the GitLab API mean that adding labels like
with the RFP issue tracker is not easy to implement.  Adding labels to
merge requests requires "Developer" privileges, which would also allow
the _issuebot_ account to modify code.  To keep _issuebot_'s attack
surface maintainable, it does not post labels for now.


## JSON API

_issuebot_ also provides a JSON API on top of the current HTML
reports, so that any web app can use the data in their own user
experience. This can be combined with our other developing APIs, like
the [_buildserver_ status
API](https://f-droid.org/repo/status/running.json).  There are two
entry points:

* Source code URL:
  [RFP](https://fdroid.gitlab.io/rfp/issuebot/sourceUrls.json) /
  [_fdroiddata_](https://fdroid.gitlab.io/fdroiddata/issuebot/sourceUrls.json)
* Application ID:
  [RFP](https://fdroid.gitlab.io/rfp/issuebot/applicationIds.json) /
  [_fdroiddata_](https://fdroid.gitlab.io/fdroiddata/issuebot/applicationIds.json)

Here is an excerpt of the Application ID entry point that shows the
_issuebot_ runs for one specific app.  There are two runs, with the
most recent first.  The newer version has the results from more
modules that were added since the first run.

```json
  "at.roteskreuz.stopcorona": [
    {
      "issueId": 1319,
      "jobId": "925261691",
      "modules": [
        "925261691/1319/active-hostnames.py.json",
        "925261691/1319/check-for-translation-service.py.json",
        "925261691/1319/dependencies-scrape.py.json",
        "925261691/1319/fastlane.py.json",
        "925261691/1319/fdroid-scan-apk.py.json",
        "925261691/1319/fdroid-scanner.py.json",
        "925261691/1319/gradle-productFlavors.py.json",
        "925261691/1319/gradle-wrapper.py.json",
        "925261691/1319/links-to-services.py.json",
        "925261691/1319/sdk.py.json",
        "925261691/1319/suspicious-names.py.json",
      ],
      "successfulBuilds": []
    },
    {
      "issueId": 1319,
      "jobId": "600681223",
      "modules": [
        "600681223/1319/check-for-translation-service.py.json",
        "600681223/1319/dependencies-scrape.py.json",
        "600681223/1319/fastlane.py.json",
        "600681223/1319/fdroid-scan-apk.py.json",
        "600681223/1319/fdroid-scanner.py.json",
        "600681223/1319/gradle-productFlavors.py.json",
        "600681223/1319/gradle-wrapper.py.json"
        "600681223/1319/sdk.py.json",
        "600681223/1319/suspicious-names.py.json",
      ]
    }
  ],
```

The ultimate entry is a catalog of what _issuebot_ saw in one
particular app in one particular run, identified by the GitLab CI
Job ID.  That includes a list of relative paths to the JSON output of
the _issuebot_ modules that ran.  The easiest way to get started with
the API right now is to download the whole collection of files from
the GitLab CI Job: go to the RFP
[Pipelines](https://gitlab.com/fdroid/rfp/-/pipelines) and click the
most recent download link on the right-most column.


## Future Work

The next step is linking together more key pieces of information in
order to provide reliable and concrete tracking of the tracker SDKs
and hostnames.  The Exodus Privacy database now provides code
signatures, network signatures and API Key IDs.  The _issuebot_
modules scrape domain names, library dependencies, and metadata from
the _AndroidManifest.xml_ that contains things like API Key IDs.
There are many exciting possibilities that should be quite easy to
implement now that this foundation is in place.

One of the ideas that we sketched out that still seems compelling is a
dedicated web app for submitting app requests and getting information
about reviews, anti-features, builds, privacy leaks, etc.  This has
the potential of greatly reducing the amount of technical knowledge
required for people to be more involved in the process of getting the
apps they use through the F-Droid submission and review process.  What
is clear is that this would be a relatively large scale project on its
own, so we set it aside and kept it in mind while building _issuebot_.

(_This work was supported by NLnet's [NGI Zero PET](https://nlnet.nl/thema/NGIZeroPET.html) fund._)
