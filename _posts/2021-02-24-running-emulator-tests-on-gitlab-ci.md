---
layout: post
title: "Running emulator tests on GitLab CI"
author: "eighthave"
---

GitLab CI (Continuous Integration) has become an essential part of the F-Droid community processes.  It is free software, built on open standards, and works well.  The last piece that is missing from our testing ecosystem is a reliable way to run tests in actual Android emulators.  Thanks to pushes from a number of people, Google now actually tests running the [Android emulators in Docker](https://github.com/google/android-emulator-container-scripts).  And recent releases of the _emulator_ SDK package actually works without [immediately crashing](https://github.com/google/android-emulator-container-scripts/issues/21)!  This is the most promising news regarding using free software emulators for Android testing in a long time.  Unfortunately, it is not smooth sailing yet, and getting the emulators to run in GitLab CI still requires some dancing around with magic incantations.  Our requirements are:

* Works on the default gitlab.com shared runners.
* Works without KVM or any extra privileges.
* Uses KVM when available.

What we have now gives us the foundation to build our standard [_fdroidclient_ CI setup](https://gitlab.com/fdroid/ci-images-client) upon. Before, we were limited to using old _armeabi-v7a_ emulators, which are run almost unimaginably slow.  Those were the only emulator system images that would run in Docker without KVM support.  Even with KVM support, the emulator seems to be quite flaky.  This has gotten better, but is still not where it should be.

The good news is that running the emulator in Docker is now stable enough that people are actually building things around it, like running emulators in [GitHub Actions](https://github.com/marketplace/actions/android-emulator-runner/).  As much people use the Google emulators, that should keep Google taking care of them.  The F-Droid emulator setup is free software: Debian base image running on GNU/Linux runners.  Any project using GitLab CI can use this setup to run emulators on merge request, etc.

It is important to use the `default` rather than `google_apis` system-images they do not contain the Google Play and apps binary blobs, and because the Google apps seem to slow down the boot process a lot.  Also, it seems the `android-22` through `android-27` system images seem to require less resources than the newer ones, so much so that they are unlikely to work at all for some projects.

The [microg system-image repository](https://github.com/microg/GmsCore/wiki/Development-Tools) is also [included](https://gitlab.com/fdroid/ci-images-client/-/commit/85ed9490) in the F-Droid setup.  There are currently two images:

* `system-images;android-29;microg;x86_64`
* `system-images;android-23;microg;x86` - requires emulator v28 or older because it lacks a "ranchu" kernel.

## Usage

The [_fdroiclient_ setup](https://gitlab.com/fdroid/fdroidclient/-/blob/8c2fa955/.gitlab-ci.yml) uses YAML templates to make it easy to choose specific emulator setups, specifically, the [`test-template`](https://gitlab.com/fdroid/fdroidclient/-/blob/8c2fa955/.gitlab-ci.yml#L24), the [`connected-template`](https://gitlab.com/fdroid/fdroidclient/-/blob/8c2fa955/.gitlab-ci.yml#L80), and the [`kvm-template`](https://gitlab.com/fdroid/fdroidclient/-/blob/8c2fa955/.gitlab-ci.yml#L109).

We use the microg image in _fdroidclient_ like this:

```yaml
kvm 29 microg x86_64:
  <<: *kvm-template

no-accel 29 microg x86_64:
  <<: *test-template
  <<: *connected-template
```

* To help debugging, the emulator kernel startup log can be found in the root of the project in _kernel.log_, and the full logcat output in _logcat.txt_.  These can be included in `artifacts:` for easy access.
* In order to run the jobs that use KVM, first you have to have a GitLab CI runner that supports KVM and is tagged with `fdroid` and `kvm`.  Then you need to set the variable `RUN_KVM_JOBS` in the CI/CD Settings to `true`.

To keep development on using emulator images in GitLab CI moving forward, there is a wiki page to document tips and tricks, gotchas, and new developments:

* <https://gitlab.com/fdroid/wiki/-/wikis/Running-emulators-in-GitLab-CI>
