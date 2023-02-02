---
layout: page
title: Verification Server

---

The idea of a [verification server](https://verification.f-droid.org)
is to automatically reproduce official releases published by
f-droid.org (or any other server).  This ensures that everything in
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

The verification process currently works by building a new unsigned
APK, then copying the APK signature from the existing APK into the
newly built unsigned APK.  If the APK signature verifies, then the APK
has been reproduced, and is marked as verified.  If not, a
[diffoscope](https://diffoscope.org) log is generated to show what the
differences are between the two builds. The verification server needs
no signing capability, just building.


## Setting one up

This is still pretty raw, so expect some tinkering.  It also will
likely only work on Debian, Ubuntu and other Debian-derivatives. The
first step is getting the
[_fdroidserver_ tools setup](../Installing_the_Server_and_Repo_Tools) and
working. Run the _fdroidserver_ tools directly out of git
(e.g. `~/code/fdroidserver/fdroid build org.adaway`), that's going to
be the easiest for now since the verification server stuff is a moving
target. The base server needs to be at minimum Debian/jessie, or there
will need to be some heavy tweaking. If you run Ubuntu or derivative
distro, you can get any packages missing from your version, like
_vagrant-cachier_, from this PPA:
<https://launchpad.net/~fdroid/+archive/ubuntu/buildserver/>

Then you can find more on the process by reading
[Build Server Setup](../Build_Server_Setup). You can also see the
Continuous Integration scripts for this process to see how the whole
thing can work:

* <https://gitlab.com/fdroid/fdroidserver/blob/master/jenkins-build-makebuildserver>
