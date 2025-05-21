---
layout: page
title: Verification Server

---

The idea of a [verification server](https://verification.f-droid.org)
is to automatically reproduce official releases published by
f-droid.org (or any other server).  Another name for this is a [rebuilder](https://reproducible-builds.org/tools/#rebuilder-backends).
This process ensures that everything in
the release APK came from the source code, and nothing was inserted or
included during the build process.  This is also useful for verifying
that the build process is not including proprietary libraries.

The ultimate goal is a simple installation that any third
party can make, that will continuously check for new published packages,
make its own builds, and confirm that the binaries match exactly. There
are many issues to resolve to get to this final destination, but the
basic concept is already tested and working. (see the 'fdroid verify'
command).

The output of multiple verification servers would then be available to
the F-Droid client. The idea would be to configure the client such that
it does not trust a binary until multiple verification servers are in
agreement that it correct.


## Verification based on APK signature

The verification process [currently works](https://gitlab.com/fdroid/buildbot/-/blob/988fc009/master/master.cfg#L155)
by building a new unsigned
APK, then [copying](https://gitlab.com/fdroid/fdroidserver/-/blob/2.4.0/fdroidserver/common.py#L3773)
the APK signature from the existing APK into the
newly built unsigned APK.  If the APK signature verifies, then the APK
has been reproduced, and is marked as verified.  If not, a
[diffoscope](https://diffoscope.org) log is generated to show what the
differences are between the two builds. The verification server needs
no signing capability, just building.


## Setting one up

The verification server is managed via an [Ansible Playbook](https://gitlab.com/fdroid/fdroid-verification-server) which is installed on a server running Debian/stable that is configured to run containers with rootless Podman. This is what runs <https://verification.f-droid.org>, but it is still pretty raw, so expect some tinkering.  We welcome contributions.  It is a goal that this setup become generic enough that the maintainer of any F-Droid compatible repository can use this setup as a rebuilder.
