---
layout: page
title: Verification Server

---

The idea of a verification server is to reproduce builds and verify that
those published by f-droid.org (or any other server) are exactly as they
should be. The ultimate goal is a simple installation that any third
party can make, that will continuously check for new published packages,
make its own builds, and confirm that the binaries match exactly. There
are many issues to resolve to get to this final destination, but the
basic concept is already tested and working. (see the 'fdroid verify'
command).

The output of multiple verification servers would then be available to
the F-Droid client. The idea would be to configure the client such that
it does not trust a binary until multiple verification servers are in
agreement that it correct.

## Signing

Obviously we verify the unsigned binaries. Once signed, all the unsigned
components in the APK are the same - the signature is additional data.
So we just unpack and check everything but that. The verification server
needs no signing capability.


## Reproducible Builds

An awful lot of builds already verify with no extra effort. Generally
these are the ones where only Java is involved. Because the NDK has
changed more frequently, those builds don't verify so easily. We will
also have to deal with different C compiler versions, and other external
tools. Most of this is covered by [Build Server IDs](#Build-Server-IDs).

Additionally, we'll have to look out for anything that includes
timestamping information in the binary. I haven't encountered anything
like this *yet*.

## Build Server IDs<a name="Build-Server-IDs"></a>

To ensure an identical environment for all external tools, etc, we will
use the exact same revision of the build server. A build server VM is
already stamped with a unique ID on creation, and this ID happens to be
the fdroidserver repo's sha1 commit hash, so the same VM can (in theory)
be re-created.

Yet to be done is adding the used build server ID to the built apk's
metadata. To retrospectively add it to existing built packages, we need
to implement
[this](https://f-droid.org/repository/issues/?do=view_issue&issue=420).

## Setting one up

This is still pretty raw, so expect some tinkering. The first step is
getting the fdroidserver tools from git:

- `git clone https://gitlab.com/fdroid/fdroidserver.git`

Run the tools directly out of git, that's going to be the easiest for
now since the verification server stuff is a moving target. The base
server needs to be at minimum Debian/jessie, or there will need to be
some heavy tweaking. If you run Ubuntu or deriv, you can use this PPA to
get related packages like vagrant-cachier:
<https://launchpad.net/~guardianproject/+archive/ubuntu/fdroidserver/+packages>

The host box will need a bunch of dependencies:

-   `apt-get install python-paramiko python-imaging
    python-magic python-libcloud python-git default-jdk git vagrant
    virtualbox`

Then you can find more on the process here:

-   <https://f-droid.org/manual/fdroid.html#Build-Server>

You can also see the Continuous Integration script for this process to
see how the whole thing can work:

-   <https://gitlab.com/fdroid/fdroidserver/blob/master/jenkins-build-makebuildserver>

### Dealing with missing git repos

From time to time, app authors delete or move their git repos. With
github and other services, running `git clone` on
a URL that does not exist will prompt you for a username and password
(ostensibly to check if it is an existing private repo). In order to
prevent the prompt from stalling the build jobs forever, set a fake
username and password as part of the git URL. One way to do that is to
add this to <em>\~/.gitconfig</em>:

```
[url "https://fakeusername:fakepassword@github.com"]
    insteadOf = https://github.com
[url "https://fakeusername:fakepassword@gitlab.com"]
    insteadOf = https://gitlab.com
[url "https://fakeusername:fakepassword@bitbucket.org"]
    insteadOf = https://bitbucket.org

```
