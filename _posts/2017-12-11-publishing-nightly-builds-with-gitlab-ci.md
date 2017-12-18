---
layout: post
title: "Publishing a nightly builds repo with GitLab or Travis CI"
author: "eighthave"

---

Having users run "nightly" builds is a great way to get rapid feedback
on current development activities.  One key way to get this kind of
feedback is to make it as easy as possible for people to install the
nightly builds, and to keep updated.  The F-Droid tools now let you
automate this whole process for any app hosting on GitLab or GitHub,
using a CI build service like gitlab-ci or Travis CI.

The new `fdroid nightly` command automates the whole process of
setting up and running this repo.  The repo is then published to its
own GitLab/GitHub git repo, where any F-Droid client can access it.

Learn how to set this up for your app by reading
[Publishing Nightly Builds]({{ site.baseurl }}/docs/Publishing_Nightly_Builds).
See it in action in _fdroidclient_:
* <https://gitlab.com/fdroid/fdroidclient-nightly>
* <https://gitlab.com/fdroid/fdroidclient/blob/5f26a785/.gitlab-ci.yml>

With F-Droid [Update Channels]({{ site.baseurl
}}/2017/06/01/announcing-new-libraries-f-droid-update-channels.html),
you can even make your app update itself from your nightly repo.
