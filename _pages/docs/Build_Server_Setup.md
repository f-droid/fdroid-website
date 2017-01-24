---
layout: page
title: Build Server Setup
permalink: /docs/Build_Server_Setup/
---

This is how to set up a working build server, starting from a completely clean minimal Debian/stable install.  This HOWTO assumes you have already [setup _fdroidserver_](Installing_the_Server_and_Repo_Tools).

First, install the necessary packages and create a new user to run the whole process here, e.g. _fdroid_. These are only the packages required by all builds, you might need to install additional packages to build apps, for example, _mercurial_ or _subversion_. Once the packages are installed and the _fdroid_ user is created, nothing else in this process should be run using root or _sudo_. 

    root:~# apt-get install vagrant virtualbox git
    root:~# adduser --disabled-password fdroid
    root:~# su fdroid

Configure the buildserver settings, running as _fdroid_ user:

    fdroid:~$ cd ~
    fdroid:~$ git clone https://gitlab.com/fdroid/fdroidserver.git
    fdroid:~$ cp fdroidserver/examples/makebuildserver.config.py fdroidserver/
    root:~$ echo "PATH=\$PATH:$HOME/android-sdk-linux/tools:/home/fdroid/fdroidserver" >>.bashrc
    fdroid:~$ sed -i "s@^baseboxurl.*@baseboxurl = \"https://f-droid.org/jessie32.box\"@" fdroidserver/makebuildserver.config.py

Create the base buildserver image... (downloading the basebox and all the sdk platforms can take long time).

    fdroid:~$ cd fdroidserver
    fdroid:~/fdroidserver$ ./makebuildserver

Get all of the app build metadata from the fdroiddata repo...

    fdroid:~/fdroidserver$ cd ~
    fdroid:~$ git clone https://gitlab.com/fdroid/fdroiddata.git
    fdroid:~$ cp fdroidserver/examples/config.py fdroiddata/
    fdroid:~$ sed -i "s@^[# ]*build_server_always.*@build_server_always = True@" fdroiddata/config.py


## Running builds

Running builds on the buildserver is best supported when you run <code>fdroid</code> directly from a git checkout of _fdroidserver_.  If you don't already have the _fdroidserver_ tools installed and setup, you will need to do that next: [Installing the Server and Repo Tools](Installing_the_Server_and_Repo_Tools).  That provides all of the dependencies needed to run _fdroidserver_ from git.

Now you are ready to run builds. Test by building the latest fdroid version:

    fdroid:~/fdroidserver$ cd ~/fdroiddata
    fdroid:~/fdroiddata$ ~/fdroidserver/fdroid build org.fdroid.fdroid -l --server


## Optionally using QEMU/KVM/libvirt instead of VirtualBox

It is also possible to QEMU/KVM guest VMs via libvirt instead of the default VirtualBox.  VirtualBox is still the recommended setup since that is what is used by f-droid.org, but there are cases where it is not possible to run VirtualBox, like on a machine that is already running QEMU/KVM guests.

    apt-get install vagrant vagrant-mutate vagrant-libvirt ebtables dnsmasq-base \
      libvirt-clients libvirt-daemon libvirt-daemon-system qemu-kvm qemu-utils git

Then create a _makebuildserver.config.py_ and add:

    vm_provider = 'libvirt'

