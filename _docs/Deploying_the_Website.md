---
layout: page
title: Deploying the Website

---

The F-Droid website is built using [Jekyll](https://jekyllrb.com/) and
[gitlab-ci](https://about.gitlab.com/features/gitlab-ci-cd/).  The
whole website now works using a standard git
["fork" workflow](https://docs.gitlab.com/ce/workflow/forking_workflow.html)
that is well supported by gitlab, and well known from services like
GitHub.  For all of the pages and information about apps and packages
distributed by _f-droid.org_, those pages are generated using our
[jekyll-fdroid](https://gitlab.com/fdroid/jekyll-fdroid) plugin, which
takes the content from the
[_f-droid.org_ index file](https://f-droid.org/repo/index-v1.json).


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


##### Deploying merge request branches

The current _gitlab-ci_ setup is optionally capable of pushing the
resulting HTML to a live webserver and linking to it automatically
from the GitLab merge request, deploying to
[surge.sh](https://surge.sh).

Doing so will allow for easier review of your merge requests, but is
not required.  If you don't follow the steps below, your merge
requests will still run through the _gitlab-ci_ continuous integration
checks, but the resulting HTML will not be accessible online.

To configure this:

 * Install the [surge.sh](https://surge.sh) CLI: `npm install surge`
 * Signup for [surge.sh](https://surge.sh): `surge login`
 * Get a "token" to allow CI to deploy on your behalf: `surge token`
 * [Add two "Secret Variables"](https://docs.gitlab.com/ce/ci/variables/README.html#secret-variables) to your fork of this project:
   * Navigate to your projects Settings -> CI/CD Pipelines -> Secret Variables.
   * Add the following two variables:
     * `SURGE_LOGIN`: The email you used to signup with `surge login`.
     * `SURGE_TOKEN`: The value given when you ran `surge token`.

Now your CI jobs should be authorized to deploy to surge.sh, and the
GitLab merge requests screen will automatically link to this
deployment.


### Staging of the official website

Like with forks, the _master_ branch of the main git repo for the
website, <https://gitlab.com/fdroid/fdroid-website>, is automatically
deployed to <https://fdroid.gitlab.io/fdroid-website>.  That is the
place to review the current state of the website before tagging a
release.


### Deploying to https://f-droid.org

When an update to the website is tested and ready to go, a release
manager creates a PGP-signed release tag in the main git repo.  The
deploy server monitors the main git repo for new tgs.  When it sees a
new tag, it first checks the PGP signature on the git tag using a
manually configured GnuPG keyring that contains only the public keys
of the PGP keys that are allowed to tag website releases.

After the git tag is verified, the `f-droid.org` target in
[.gitlab-ci.yml](https://gitlab.com/fdroid/fdroid-website/blob/master/.gitlab-ci.yml)
is run to generate the actual files for the site.  Those files are
then copied into place on the _f-droid.org_ servers.

* TODO document release tag naming scheme


### Setting up and running the deploy procedure

The deploy procedure was tested on a machine running Debian/stretch.
It should be triggered whenever the repo index is published, so it can
rebuild with the latest app information.  This whole procedure can be
run as root, or just `gitlab-runner`.  This final procedure is not
part of a script committed into the website git repo so that the
commands that run outside of docker cannot be modified via git.

1. [setup docker](https://docs.docker.com/engine/installation/linux/debian/)
2. [setup gitlab-ci-multi-runner](https://docs.gitlab.com/runner/install/linux-repository.html)
3. prepare _deploy-whitelist-keyring.gpg_ using GnuPG:
```console
$ gpg --recv-keys 00aa5556
$ gpg --fingerprint 00aa5556  # verify it!
$ gpg --export 00aa5556 > /path/to/deploy-whitelist-keyring.gpg
```
4. get the website source code:
```console
$ git clone https://gitlab.com/fdroid/fdroid-website
```
5.  run the generation:
```console
$ cd fdroid-website
$ git fetch --tags
$ sudo gitlab-runner exec docker f-droid.org \
              --pre-build-script ./prepare-for-deploy.py \
              --docker-volumes "/path/to/deploy-whitelist-keyring.gpg:/root/.gnupg/pubring.gpg:ro" \
              --docker-volumes `pwd`/_site:/builds/output --env DEPLOY_DIR=/builds/output
```
6. deploy the site's files to the webserver, for example:
```console
$ rsync -ax --delete --exclude repo/ --exclude archive/  _site/build/  f-droid.org:/var/www/
```
