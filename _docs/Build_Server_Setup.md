---
layout: page
title: Build Server Setup

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

Through complete isolation, the repercussions are at least limited to
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

```bash
root:~# apt-get install vagrant virtualbox git python3-certifi \
        python3-libvirt python3-requestbuilder python3-yaml \
        python3-clint python3-vagrant python3-paramiko python3-pyasn1 \
        python3-pyasn1-modules python3-requests python3-git
root:~# adduser --disabled-password fdroid
root:~# su fdroid
```

Clone source code and configure the buildserver settings, running
as _fdroid_ user:

```bash
fdroid:~$ cd ~
fdroid:~$ git clone https://gitlab.com/fdroid/fdroidserver.git
fdroid:~$ cp fdroidserver/examples/makebuildserver.config.py fdroidserver/
```

You also have to make sure your `ANDROID_HOME` environment variable is
[set up](../Installing_the_Server_and_Repo_Tools#building-apps) correctly.

For your convenience you optionally may add the fdroid executable to your path:

```bash
fdroid:~$ echo "PATH=\$PATH:$HOME/fdroidserver" >> ~/.bashrc
```

Create the base buildserver image... (downloading the basebox and all the sdk platforms can take long time).

```bash
fdroid:~$ cd fdroidserver
fdroid:~/fdroidserver$ ./makebuildserver
```

Get all of the app build metadata from the fdroiddata repo...

```bash
fdroid:~/fdroidserver$ cd ~
fdroid:~$ git clone https://gitlab.com/fdroid/fdroiddata.git
fdroid:~$ cp fdroidserver/examples/config.yml fdroiddata/
fdroid:~$ sed -i "s@^[# ]*build_server_always.*@build_server_always: true@" fdroiddata/config.yml
```

## Setting up a build server

In addition to the basic setup previously described, we ship
a Vagrant-compatible Debian/stretch base box called ’fdroid/basebox-stretch64’.

We are bootstrapping the Debian Vagrant boxes for our buildserver
from scratch. Fetching and verifying our pre-build Vagrant boxes
is fully automated. (If you are interested in this process or
want to bootstrap those by yourself you should look at:
[F-Droid Base Box](https://gitlab.com/fdroid/basebox#fdroid_basebox))


### Creating the F-Droid buildserver box


Navigate to your clone of
[F-Droid Server git](https://gitlab.com/fdroid/fdroidserver) and start by
creating `makebuildserver.config.py`, using
`./examples/makebuildserver.config.py` as a reference - look at the
settings and documentation there to decide if any need changing to suit
your environment. There is a path for retrieving the base box if it
doesn’t exist, and an apt proxy definition, both of which may need
customising for your environment. You can then go to the `fdroidserver`
directory and run `makebuildserver`.


```bash
# navigate to your clone of F-Droid Server
cd .../fdroidserver

# copy example config file
cp examples/makebuildserver.config.py makebuildserver.config.py

# start building the your basebox image
./makebuildserver
```

This will take a long time, use a lot of bandwidth and disk space -
most of it spent installing the necessary parts of the Android SDK
for all the various platforms. Luckily you only need to do it
occasionally. Once you have a working build server image, if the
recipes change (e.g. when packages need to be added) you can just
run that script again and the existing one will be updated in place.

Once it’s complete you’ll have a new base box called ’buildserver’ which
is what’s used for your App build runs. Now you can build packages as
as you used to, but when you run `fdroid build --server ...` App build
runs will be isolated inside a virtual machine.

The first time a build is done, a new virtual machine is created using
the ’buildserver’ box as a base. A snapshot of this clean machine state
is saved for use in future builds, to improve performance. You can force
discarding of this snapshot and rebuilding from scratch using a switch:
`fdroid build --resetserver ...`.

### makebuildserver caching tweaks (optional)

The main SDK/NDK downloads will automatically be cached to speed things
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

```bash
cd /path/to/android-sdk/platforms
tar czf android-19.tar.gz android-19
mv android-19.tar.gz /path/to/buildserver/addons/cache/platforms/
```

If you have already built a buildserver it is also possible to get this
files directly from the buildserver:

```bash
vagrant ssh -- -C 'tar -C ~/android-sdk/platforms czf android-19.tar.gz android-19'
vagrant ssh -- -C 'cat ~/android-sdk/platforms/android-19.tar.gz' > /path/to/fdroidserver/buildserver/cache/platforms/android19.tar.gz
```

## Running builds

When using the buildserver, running `fdroid` directly from a git checkout of _fdroidserver_ will be the easiest.  If you don't already have the _fdroidserver_ tools installed and setup, you will need to do that next: [Installing the Server and Repo Tools](../Installing_the_Server_and_Repo_Tools).  That provides all of the dependencies needed to run _fdroidserver_ from git.

Now you are ready to run builds. Test by building the latest fdroid version:

```bash
fdroid:~/fdroidserver$ cd ~/fdroiddata
fdroid:~/fdroiddata$ ~/fdroidserver/fdroid build org.fdroid.fdroid -l --server
```

## Optionally using QEMU/KVM/libvirt instead of VirtualBox

It is also possible to QEMU/KVM guest VMs via libvirt instead of the
default VirtualBox.  VirtualBox is still the recommended setup since
that is what is used by f-droid.org, but there are cases where it is
not possible to run VirtualBox, like on a machine that is already
running QEMU/KVM guests.  In order to make the libvirt image files
directly readable by `vagrant package`, _libvirt_'s QEMU needs to be
configured to always set the ownership to `libvirt.libvirt`.

```console
root:~# apt-get install vagrant vagrant-mutate vagrant-libvirt ebtables dnsmasq-base \
        python3-libvirt libvirt-clients libvirt-daemon-system qemu-kvm qemu-utils git \
        python3-yaml python3-clint python3-vagrant python3-pyasn1 python3-pyasn1-modules \
        python3-requests python3-git
root:~# cat << EOF >> /etc/libvirt/qemu.conf
user = "libvirt"
group = "libvirt"
dynamic_ownership = 1
EOF
root:~# service libvirtd restart
```

Then create a _makebuildserver.config.py_ next to _makebuildserver_
and add:

```python
vm_provider = 'libvirt'
```

##### Debian/stretch and Ubuntu/xenial

```console
root:~# adduser fdroid libvirt
root:~# adduser fdroid libvirt-qemu
```

##### older Debian and Ubuntu

```console
root:~# adduser fdroid libvirtd
root:~# adduser fdroid kvm
```

### Advanced nested KVM Setup:

This section is not relevant for using F-Droid in a normal setup. If you
want to run `fdroid build --server` flag inside a KVM, this chaper will
help you getting started.

Consider following basic nesting setup:

```
bare metal host (l0)
\- F-Droid VM (l1)
   \- F-Droid builder VM (l2)
```

The steps above describe how to setup (l1) and _makebuildserver_ sets up (l2).

First of all you'll have to check if you cpu support the _vmx_
(or _svm_ on amd) instruction set. You can use this command to list
details about your cpu:

```bash
root:~# cat /proc/cpuinfo
```

On (l0) you have to check that nesting is enabled:

```bash
root:~# cat /sys/module/kvm_intel/parameters/nested
```

If it's not enabled you can turn it on by running:

```bash
echo "options kvm-intel nested=Y" > /etc/modprobe.d/kvm-intel.conf
```

You'll need to reboot to for this to take effect.

Next you'll need to make sure that your (l1) vm configuration forwards
cpu features required for nesting. So open up your configuration for the
VM _/etc/libvirt/qemu/my-vm.xml_ and insert a cpu block inside your domain-tag. (_virt-manager_ also provides a user-interface for this operation.)

```xml
<cpu mode='custom' match='exact'>
    <model fallback='allow'>SandyBridge</model>
    <vendor>Intel</vendor>
    <feature policy='require' name='vmx'/>
</cpu>
```

The actually required configuration here depends on your cpu. You
can find details in [libvirts manual](https://libvirt.org/formatdomain.html#elementsCPU).
The important part is that you forward _vmx_ (or _svm_ on amd) to
the guest system.



This is the setup that is used in the Continuous Integration builds as part of the [reproducible builds](https://reproducible-builds.org) effort.  You can see this in action on the Debian Project's jenkins setup:

- <https://jenkins.debian.net/job/reproducible_setup_fdroid_build_environment_profitbricks7/>
