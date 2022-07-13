---
layout: page
title: "Publishing Nightly Builds"

---

Having users run "nightly" builds is a great way to get rapid feedback
on current development activities.  One key way to get this kind of
feedback is to make it as easy as possible for people to install the
nightly builds, and to keep updated.  The F-Droid tools now let you
automate this whole process for apps that are setup on GitLab CI.

The F-Droid nightly repos are built on top of the standard Android
_~/.android/debug.keystore_ that the Android tools automatically
generate.  That signing key is used to sign the nightly builds as well
as the repo index.  This is meant to be easy to setup and manage, but
it does __not__ provide the same level of security as a standard
F-Droid repo!

Since this is about smoothing the development process, it also makes
sense to reuse a shared _debug.keystore_ among your team.  That way,
all debug builds are interchangeable.  This makes debugging certain
problems a lot easier since you can keep the app state when installing
your own debug builds, for example, to add logging.


## Automatic Version Codes

With nightly builds, the normal logic for setting `versionCode` in git
for each release no longer makes sense.  In order for Android to treat
each new build as a possible update, the `versionCode` must increase,
but that does not make sense to commit to git each time.  So there
needs to be some automatic logic for setting `versionCode`:

* timestamp in seconds (`date +%s`) will always increase
* incrementing the last release's `versionCode` (e.g. 104030034,
  104030035, 104030036)
* git commit count (`git rev-list --first-parent --count HEAD`)
  provides some hints of where in the code the build was made from

For many apps, some combo will make the most sense. For F-Droid, we
have a variable `DB_VERSION` for the internal database.  We only
handle upgrading the database, never downgrading.  So that needs to be
the most important part of the versionCode.  Any build with
`DB_VERSION = 77` should not be upgraded by any build with
`DB_VERSION = 75`.  Then the minor part is the commit count, so it
looks like (7502543, 7502544, 7702601, etc). with `DB_VERSION` as the
first two digits, then a 0-padded commit count as the last 5 digits.


## Configuring GitLab CI

This assumes that the app is already setup with _.gitlab-ci.yml_ and
builds are running on GitLab CI.  This also works for forks of the
main project that has the _.gitlab-ci-yml_.

1. Run `fdroid nightly --show-secret-var` in the local git repo that
   is being setup, e.g. _fdroid/fdroidclient_.  It will print out the
   SSH Public Key.  Using `--show-secret-var` will make it print out
   base 64 text to be pasted into secret variable called
   `DEBUG_KEYSTORE`.  Careful!  That text is the entire
   _debug.keystore_, so protect it accordingly!

2. Create a new GitLab "project" by appending _-nightly_ to the
   name. For example, <https://gitlab.com/fdroid/fdroidclient> becomes
   <https://gitlab.com/fdroid/fdroidclient-nightly> and
   <https://gitlab.com/eighthave/fdroidclient> becomes
   <https://gitlab.com/eighthave/fdroidclient-nightly>

3. In that new project, add the SSH Public Key derived from your
   _debug.keystore_ as a Deploy Key in your Repository Settings, e.g.
   `https://gitlab.com/eighthave/fdroidclient-nightly/settings/repository`

4. In the CI/CD Settings of the project being built, paste that into
   GitLab CI Secret Variable called `DEBUG_KEYSTORE`, e.g.
   `https://gitlab.com/eighthave/fdroidclient/settings/ci_cd`

5. Then in that same page, in the Protected section, set up your
   _master_ branch to limit the possibility of leaking the
   _debug.keystore_.  If _master_ cannot be force-pushed, then any
   attempts to get the stored secrets are permanently written to the
   git history.  Without that protection, someone with push access
   could push a commit in a branch to print out the secrets, then
   remove that commit to hide their actions.

6. Add a _deploy_ stage to your _.gitlab-ci.yml_ that produces only
   the build to publish to the nightly, then runs `fdroid
   nightly`. For example:

```yaml
deploy_nightly:
  stage: deploy
  only:
    - master
  script:
    - ./gradlew assembleDebug
    - pip3 install fdroidserver
    - export PATH=~/.local/bin:$PATH
    - fdroid nightly
```

For a real world example using _gitlab-ci_, see _fdroidclient_:
* <https://gitlab.com/fdroid/fdroidclient-nightly>
* <https://gitlab.com/fdroid/fdroidclient/blob/master/.gitlab-ci.yml>


## Configuring for GitHub Actions

GitHub and GitHub Actions are both proprietary platforms that are widely used to
develop free software.  Since F-Droid does not promote proprietary software,
there is no official support for GitHub Actions.  All of the F-Droid tooling is
free software, so contributors have made a GitHub Action based on the F-Droid
tools.

1. Run `fdroid nightly --show-secret-var` in the local git repo that is being
   setup, e.g. _fdroid/fdroidclient_.  It will print out the SSH Public Key.
   Using `--show-secret-var` will make it print out base 64 text to be pasted
   into secret variable called `DEBUG_KEYSTORE`.  Careful!  That text is the
   entire _debug.keystore_, so protect it accordingly!

2. Create a new GitHub "project" by appending _-nightly_ to the
   name. For example, <https://github.com/f-droid/fdroidclient> becomes
   <https://github.com/f-droid/fdroidclient-nightly> and
   <https://github.com/eighthave/fdroidclient> becomes
   <https://github.com/eighthave/fdroidclient-nightly>

3. In that new project, add the SSH Public Key derived from your
   _debug.keystore_ as a Deploy Key in your Security settings, e.g.
   `https://github.com/eighthave/fdroidclient-nightly/settings/keys`

4. In the Settings of the project being built, find "Actions" under "Secrets" in
   the "Security" section.  Paste the whole `DEBUG_KEYSTORE` output line into a
   new repository secret called `DEBUG_KEYSTORE`, e.g.
   `https://github.com/eighthave/fdroidclient/settings/secrets/actions`.

5. Add a _nightly_ stage to your _.github/workflows/_ that produces only
   the build to publish to the nightly, then runs `fdroid
   nightly`. For example:

```yaml
name: Publish nightly build

on:
  push:
    branches:
      - main

jobs:
  nightly:
    name: Publish nightly build
    runs-on: ubuntu-latest
    environment: nightly
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Gradle Wrapper Validation
        uses: gradle/wrapper-validation-action@v1
      - name: Set up JDK 11
        uses: actions/setup-java@v2
        with:
          distribution: 'adopt'
          java-version: 11
      - name: Build
        run: |
          # use timestamp as Version Code
          export versionCode=$(date '+%s')
          sed -i "s,^\(\s*versionCode\)  *[0-9].*,\1 $versionCode," app/build.gradle
          ./gradlew assembleDebug
      - name: fdroid nightly
        run: |
          sudo add-apt-repository ppa:fdroid/fdroidserver
          sudo apt-get update
          sudo apt-get install apksigner fdroidserver --no-install-recommends
          export DEBUG_KEYSTORE=$\{\{ secrets.DEBUG_KEYSTORE \}\}
          fdroid nightly --archive-older 10
```

There is an alternate approach based on Docker maintained by @wardvl:
[wardvl/f-droid-nightly-action](https://github.com/wardvl/f-droid-nightly-action/)


## Configuring for GitHub and Travis CI

1. Generate a new _debug.keystore_ for each app, since GitHub only
   allows a deploy key to be used on a single repo.  Keep that file
   safe, since it is the signing key for your nightly build.
```
keytool -genkey -v -keystore im.zom.messenger-debug.keystore \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias androiddebugkey -storepass android -keypass android \
  -dname "CN=Android Debug,O=Android,C=US"
```
2. Set a GitHub Deploy Key for
  `https://github.com/zom/zom-android-nightly` by going to
  `https://github.com/zom/zom-android-nightly/settings/keys`.  The
  public SSH key is printed out by running:
```
fdroid nightly --keystore im.zom.messenger-debug.keystore
```
3. check _Allow write access_ in the GitHub Deploy Key settings
4. To print out the secret variable contents, use `--show-secret-var`.
   Careful!  That text is the entire _debug.keystore_, so protect it
   accordingly!  This prints out base64 text to be pasted into a
   Travis CI "Environment Variable" in
   `https://travis-ci.org/zom/Zom-Android/settings`. Call the variable
   `DEBUG_KEYSTORE` and make sure "Display value in build log" is
   __OFF__.
```
fdroid nightly --keystore im.zom.messenger-debug.keystore --show-secret-var
```

And here's a simple example of how to add _fdroidserver_ to your
Travis CI setup to make it deploy the APK after a successful test:

```yaml
sudo: required
language: android

addons:
  apt:
    sources:
      - sourceline: 'ppa:fdroid/fdroidserver'
    packages:
      - fdroidserver
      - openssh-client

android:
  components:
    - tools
    - platform-tools
    - build-tools-26.0.2
    - android-25
  licenses:
    - 'android-sdk-license-.+'

script:
  - ./gradlew test

after_success:
  - fdroid nightly -v
```

For a real world example, see _Zom_:
* <https://github.com/zom/Zom-Android-nightly>
* <https://github.com/zom/Zom-Android/blob/master/.travis.yml>
* <https://travis-ci.org/zom/Zom-Android>
