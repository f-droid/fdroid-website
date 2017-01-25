---
layout: page
title: Build Server Setup
redirect_from:
 - /wiki/page/Build_Server_Setup
 - /manual/html_node/Build-Server.html

---

* Do not remove this line (it will not be displayed)
{:toc}

The F-Droid build server isolates the builds for each package within a
clean, isolated and secure throwaway virtual machine
environment. Building thousands of apps, especially with automated
and/or unattended processes, could be considered a dangerous pastime
from a security perspective. This is even more the case when the
products of the build are also distributed widely and in a
semi-automated ("you have updates available") fashion.

Assume that an upstream source repository is compromised. A small
selection of things that an attacker could do in such a situation:

1.  Use custom build steps to execute virtually anything as the user
    doing the build.
2.  Access the keystore.
3.  Modify the built APK files or source tarballs for other applications
    in the repository.
4.  Modify the metadata (which includes build scripts, which again, also
    includes the ability to execute anything) for other applications in
    the repository.

Through complete isolation, the repurcussions are at least limited to
the application in question. Not only is the build environment fresh
for each build, and thrown away afterwards, but it is also totally
isolated from the signing environment.

Aside from security issues, there are some applications which have
strange requirements such as old versions of the NDK. It would be
impractical (or at least extremely messy) to start modifying and
restoring the SDK on a multi-purpose system, but within the confines of
a throwaway single-use virtual machine, anything is possible.

All this is in addition to the obvious advantage of having a
standardised and completely reproducible environment in which builds are
made. Additionally, it allows for specialised custom build environments
for particular applications.


## Overview of the setup

This is how to set up a working build server, starting from a
completely clean minimal Debian/stable install.  This HOWTO assumes
you have already
[setup _fdroidserver_](../Installing_the_Server_and_Repo_Tools). Running
the _fdroidserver_ tools directly out of
[git](https://gitlab.com/fdroid/fdroidserver)
(e.g. `~/fdroidserver/fdroid build org.adaway`), will likely be
the easiest for now since the build server setup scripts are not
really ready for proper packaging. Also, it will likely only work on
Debian, Ubuntu and other Debian-derivatives since F-Droid only uses
Debian in its infrastructure (we welcome porting contributions!).

The base server needs to be at minimum Debian/jessie, or there will
need to be some heavy tweaking. If you run Ubuntu or derivative
distro, you can get any packages missing from your version, like
_vagrant-cachier_, from this PPA:
<https://launchpad.net/~fdroid/+archive/ubuntu/buildserver/>

First, install the necessary packages and create a new user to run the
whole process here, e.g. _fdroid_. These are only the packages
required by all builds, you might need to install additional packages
to build apps, for example, _mercurial_ or _subversion_. Once the
packages are installed and the _fdroid_ user is created, nothing else
in this process should be run using root or _sudo_.

    root:~# apt-get install vagrant virtualbox git
    root:~# adduser --disabled-password fdroid
    root:~# su fdroid

Configure the buildserver settings, running as _fdroid_ user:

    fdroid:~$ cd ~
    fdroid:~$ git clone https://gitlab.com/fdroid/fdroidserver.git
    fdroid:~$ cp fdroidserver/examples/makebuildserver.config.py fdroidserver/
    root:~$ echo "PATH=\$PATH:$HOME/android-sdk-linux/tools:/home/fdroid/fdroidserver" >>.bashrc
    fdroid:~$ sed -i "s@^baseboxurl.*@baseboxurl = \"https://f-droid.org/jessie64.box\"@" fdroidserver/makebuildserver.config.py

Create the base buildserver image... (downloading the basebox and all the sdk platforms can take long time).

    fdroid:~$ cd fdroidserver
    fdroid:~/fdroidserver$ ./makebuildserver

Get all of the app build metadata from the fdroiddata repo...

    fdroid:~/fdroidserver$ cd ~
    fdroid:~$ git clone https://gitlab.com/fdroid/fdroiddata.git
    fdroid:~$ cp fdroidserver/examples/config.py fdroiddata/
    fdroid:~$ sed -i "s@^[# ]*build_server_always.*@build_server_always = True@" fdroiddata/config.py


## Setting up a build server

In addition to the basic setup previously described, you will also need
a Vagrant-compatible Debian/jessie base box called ’jessie64’.

You can use a different version or distro for the base box, so long as
you don’t expect any help making it work. One thing to be aware of is
that working copies of source trees are moved from the host to the
guest, so for example, having subversion v1.6 on the host and v1.7 on
the guest would fail.


### Creating the Debian base box

The output of this step is a minimal Debian VM that has support for
remote login and provisioning.

Unless you’re very trusting, you should create one of these for yourself
from verified standard Debian installation media. However, by popular
demand, the `./makebuildserver` script will automatically download a
prebuilt image unless instructed otherwise. If you choose to use the
prebuilt image, you may safely skip the rest of this section.

Documentation for creating a base box can be found at
<https://www.vagrantup.com/docs/boxes/base.html>.

In addition to carefully following the steps described there, you should
consider the following:

1.  It is advisable to disable udev network device persistence,
    otherwise any movement of the VM between machines, or
    reconfiguration, will result in broken networking.

    For a Debian/Ubuntu default install, just
    `touch /etc/udev/rules.d/75-persistent-net-generator.rules` to turn
    off rule generation, and at the same time, get rid of any rules it’s
    already created in `/etc/udev/rules.d/70-persistent-net.rules`.

2.  Unless you want the VM to become totally inaccessible following a
    failed boot, you need to set `GRUB_RECORDFAIL_TIMEOUT` to a value
    other than -1 in `/etc/grub/default` and then run `update-grub`.


### Creating the F-Droid base box

The next step in the process is to create `makebuildserver.config.py`, using
`./examples/makebuildserver.config.py` as a reference - look at the settings and
documentation there to decide if any need changing to suit your
environment. There is a path for retrieving the base box if it doesn’t
exist, and an apt proxy definition, both of which may need customising
for your environment. You can then go to the `fdroidserver` directory
and run this:

```
./makebuildserver
```

This will take a long time, and use a lot of bandwidth - most of it
spent installing the necessary parts of the Android SDK for all the
various platforms. Luckily you only need to do it occasionally. Once you
have a working build server image, if the recipes change (e.g. when
packages need to be added) you can just run that script again and the
existing one will be updated in place.

The main sdk/ndk downloads will automatically be cached to speed things
up the next time, but there’s no easy way of doing this for the longer
sections which use the SDK’s `android` tool to install platforms,
add-ons and tools. However, instead of allowing automatic caching, you
can supply a pre-populated cache directory which includes not only these
downloads, but also .tar.gz files for all the relevant additions. If the
provisioning scripts detect these, they will be used in preference to
running the android tools. For example, if you have
`buildserver/addons/cache/platforms/android-19.tar.gz` that will be used
when installing the android-19 platform, instead of re-downloading it
using `android update sdk --no-ui -t android-19`. It is possible to
create the cache files of this additions from a local installation of
the SDK including these:

```
cd /path/to/android-sdk/platforms
tar czf android-19.tar.gz android-19
mv android-19.tar.gz /path/to/buildserver/addons/cache/platforms/
```

If you have already built a buildserver it is also possible to get this
files directly from the buildserver:

```
vagrant ssh -- -C 'tar -C ~/android-sdk/platforms czf android-19.tar.gz android-19'
vagrant ssh -- -C 'cat ~/android-sdk/platforms/android-19.tar.gz' > /path/to/fdroidserver/buildserver/cache/platforms/android19.tar.gz
```

Once it’s complete you’ll have a new base box called ’buildserver’ which
is what’s used for the actual builds. You can then build packages as
normal, but with the addition of the `--server` flag to `fdroid build`
to instruct it to do all the hard work within the virtual machine.

The first time a build is done, a new virtual machine is created using
the ’buildserver’ box as a base. A snapshot of this clean machine state
is saved for use in future builds, to improve performance. You can force
discarding of this snapshot and rebuilding from scratch using the
`--resetserver` switch with `fdroid build`.


## Running builds

When using the buildserver, running `fdroid` directly from a git checkout of _fdroidserver_ will be the easiest.  If you don't already have the _fdroidserver_ tools installed and setup, you will need to do that next: [Installing the Server and Repo Tools](../Installing_the_Server_and_Repo_Tools).  That provides all of the dependencies needed to run _fdroidserver_ from git.

Now you are ready to run builds. Test by building the latest fdroid version:

    fdroid:~/fdroidserver$ cd ~/fdroiddata
    fdroid:~/fdroiddata$ ~/fdroidserver/fdroid build org.fdroid.fdroid -l --server


## Optionally using QEMU/KVM/libvirt instead of VirtualBox

It is also possible to QEMU/KVM guest VMs via libvirt instead of the default VirtualBox.  VirtualBox is still the recommended setup since that is what is used by f-droid.org, but there are cases where it is not possible to run VirtualBox, like on a machine that is already running QEMU/KVM guests.

    apt-get install vagrant vagrant-mutate vagrant-libvirt ebtables dnsmasq-base \
      libvirt-clients libvirt-daemon libvirt-daemon-system qemu-kvm qemu-utils git

Then create a _makebuildserver.config.py_ and add:

    vm_provider = 'libvirt'

This is the setup that is used in the Continuous Integration builds as part of the [reproducible builds](https://reproducible-builds.org) effort.  You can see this in action on the Debian Project's jenkins setup:

- <https://jenkins.debian.net/job/reproducible_setup_fdroid_build_environment_profitbricks7/>
