---
layout: page
title: Deploying the Website

---

The F-Droid website is built using [Jekyll](https://jekyllrb.com/) and
[gitlab-ci](https://about.gitlab.com/features/gitlab-ci-cd/).  The
whole website now works using a standard git
["fork" workflow](https://docs.gitlab.com/ce/workflow/forking_workflow.html)
that is well supported by GitLab, and well known from services like
GitHub.  For all of the pages and information about apps and packages
distributed by _f-droid.org_, those pages are generated using our
[jekyll-fdroid](https://gitlab.com/fdroid/jekyll-fdroid) plugin, which
takes the content from the
[_f-droid.org_ index file](https://f-droid.org/repo/index-v1.jar).


### Staging on development forks

All development forks of
[fdroid-website](https://gitlab.com/fdroid/fdroid-website)
automatically have a staging server setup and maintained by the
_gitlab-ci_ configuration.  This automatically deploys the content of
the fork's _master_ branch to
[GitLab Pages](https://pages.gitlab.io/).  For example, _nicoalt_'s
git fork is at <https://gitlab.com/nicoalt/fdroid-website>, and the
_master_ branch from that is automatically deployed to
<https://nicoalt.gitlab.io/fdroid-website>.


### Staging of the official website

Like with forks, the _master_ branch of the main git repo for the
website, <https://gitlab.com/fdroid/fdroid-website>, is automatically
deployed to <https://fdroid.gitlab.io/fdroid-website>.  That is the
place to review the current state of the website before tagging a
release.


### Deploying to https://f-droid.org

When an update to the website is tested and ready to go, a release
manager creates a PGP-signed release tag in the main git repo.  The
deploy server monitors the main git repo for new tags.  When it sees a
new tag, it first checks the PGP signature on the git tag using a
manually configured GnuPG keyring that contains only the public keys
of the PGP keys that are allowed to tag website releases.

After the git tag is verified, the `f-droid.org` target in
[.gitlab-ci.yml](https://gitlab.com/fdroid/fdroid-website/blob/master/.gitlab-ci.yml)
is run to generate the actual files for the site.  Those files are
then copied into place on the _f-droid.org_ servers.

The deploy tags use a "semantic versioning" naming scheme:

* _\<major>.\<minor>_
* _\<minor>_ is incremented on each deployment
* _\<major>_ is only incremented when there are major changes
