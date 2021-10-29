---
layout: page
title: Installing the Server and Repo Tools

---

The [fdroidserver](https://gitlab.com/fdroid/fdroidserver) tools provide
everything you need to set up and maintain your own repos, run an fdroid
build server, and even host your own website like f-droid.org. The
F-Droid developers mostly work on Debian, Arch, and Ubuntu, so those are
currently the best supported platforms.

To setup and maintain your own collection of apps and media from the
command line, setup an F-Droid repository using the tools from
_fdroidserver_.  To run the full F-Droid build server setup, see
[Build Server Setup](../Build_Server_Setup).

* Do not remove this line (it will not be displayed)
{:toc}


## Debian/Ubuntu/Mint/etc

The F-Droid tools, also known as _fdroidserver_, may be installed
from the standard OS package repository.  On Debian-based OS's,
this should be enough to install the basic F-Droid setup:

```bash
sudo apt-get install fdroidserver
```

However, it is common to find that the version of _fdroidserver_ available
in the standard OS package repository is out of date.

### Getting a newer version

A newer version of _fdroidserver_ may be found in the F-Droid PPA or your OS's _backports_ repository.

-   Ubuntu/Mint: use the
    [F-Droid PPA](https://launchpad.net/~fdroid/+archive/fdroidserver/+packages)
    (fingerprint: `9AAC 2531 93B6 5D4D F1D0 A13E EC46 32C7 9C5E 0151`):

    ```bash
    sudo add-apt-repository ppa:fdroid/fdroidserver
    sudo apt-get update
    sudo apt-get install fdroidserver
    ```

-   Debian: first [setup backports](http://backports.debian.org/Instructions/#index2h2),
    then, substituting your Debian release for 'buster':
    ```bash
    apt-get install fdroidserver/buster-backports
    ```

## Fedora/Archlinux

Since packages in these distros could be newer than the official ones on pypi, installing the dependencies in a separate virtual environment workarounds dependency resolving failures:

```bash
python3 -m venv env
source env/bin/activate
pip install -e .
```

## Guix
The tools are also available in the main Guix channel. To install:  
```
guix install fdroidserver
```


## macOS

You can install `fdroidserver` directly using Homebrew, or `easy_install` as a last resort:

### Homebrew:

1. Preparation: Check [the Homebrew formula](https://formulae.brew.sh/formula/fdroidserver) for instructions. Example:

```bash
brew install android-sdk
android update sdk --no-ui --all --filter tools,platform-tools,build-tools-25.0.0
```

2. Install _fdroidserver_:
```bash
brew install fdroidserver
```

### With only `easy_install`:

```
sudo easy_install fdroidserver
```


## Windows

### Windows 10 Subsystem for Linux

Starting with the Windows 10 "Anniversary Update", you can [enable an
Ubuntu environment](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)
that runs in Windows, known has "Bash on Windows", "Ubuntu on Windows",
or "Windows Subsystem for Linux".

1.  [setup Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)
2.  install *fdroidserver* from the
    [F-Droid PPA](https://launchpad.net/~fdroid/+archive/fdroidserver/+packages)
    (fingerprint: `9AAC 2531 93B6 5D4D F1D0 A13E EC46 32C7 9C5E 0151`)
    by running this in the Bash shell window:
```bash
sudo add-apt-repository ppa:fdroid/fdroidserver
sudo apt-get update
sudo apt-get install fdroidserver
```


### Cygwin

1.  add Java to your PATH:
    <http://www.kingluddite.com/tools/how-do-i-add-java-to-my-windows-path>
2.  Install Cygwin <https://www.sourceware.org/cygwin/>
3.  in Cygwin, install these packages: *gcc-core git openssh python3
    python3-pyasn1 python3-imaging python3-paramiko python3-requests
    python3-setuptools rsync wget*
4.  open a Cygwin bash shell and run: `easy_install fdroidserver`

Then here's the repo setup:

```bash
export ANDROID_HOME=/cygdrive/c/path/to/android-sdk
fdroid init   # the keystore gen will fail
```

After running `fdroid init`, you need to set the Windows path to your
keystore in _config.yml_.  It is also possible to install
_fdroidserver_ in a virtual environment using _virtualenv_ and _pip_.


## Docker Executable Image (any platform)

If you are already running Docker "Executable Images", then the
easiest way to run _fdroidserver_ is to use our
[executable image](https://gitlab.com/fdroid/docker-executable-fdroidserver)


## Installing the latest code (any platform)

The easiest way to install the fdroidserver tools from source is to use
virtualenv and pip. First, make sure you have the Python3 version of
_virtualenv_ or _pyvenv_ installed, it
should be included in your OS's Python distribution or via other
mechanisms like dnf/yum/pacman/emerge/Fink/MacPorts/Brew. Then here's
how to install _fdroidserver_ into a Python "virtual
env":

```bash
pyvenv fdroidserver-env
. fdroidserver-env/bin/activate
pip3 install fdroidserver
```

You can find variations on this used in the CI tests:
https://gitlab.com/fdroid/fdroidserver/blob/master/.gitlab-ci.yml


## Building apps

To build apps using F-Droid, Java and the whole Android SDK must be
installed.  This process is currently only developed on GNU/Linux, but
we'd love patches getting it working on macOS and Windows. If you only
want to make F-Droid repositories of APK files that you already have
or don't know what this means, then you can skip this section.

In order to build Android apps with the _fdroidserver_ toolchain,
Java, the Android SDK, and some other essential tools must be
installed.  Only
[parts of the Android SDK](https://qa.debian.org/developer.php?email=android-tools-devel%40lists.alioth.debian.org)
are available in Debian, so the Android SDK must be installed
manually, as well as the packages that it requires (_the Android SDK
tools include some 32-bit binaries, so even 64-bit systems need these
i386 library packages_). The F-Droid tools use the Android SDK to
build and inspect apps, so you must have the Android SDK installed and
setup before using _fdroidserver_.

[Install the Android SDK](https://developer.android.com/sdk/index.html#downloads)
and make sure the `ANDROID_HOME` environment variable is properly
set. Be sure to verify the file you downloaded, you can double-check
the SHA-1 Checksum on Google's download page.

```bash
$ sudo apt-get install fdroidserver
$ mkdir ~/android-sdk-linux
$ cd ~/android-sdk-linux
$ wget https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
$ echo "87f6dcf41d4e642e37ba03cb2e387a542aa0bd73cb689a9e7152aad40a6e7a08  commandlinetools-linux-6858069_latest.zip" | sha256sum -c
commandlinetools-linux-6858069_latest.zip: OK
$ unzip commandlinetools-linux-6858069_latest.zip
$ export ANDROID_HOME="$HOME/android-sdk-linux"
$ ./cmdline-tools/bin/sdkmanager --sdk_root="$ANDROID_HOME" platform-tools "build-tools;30.0.3"
```

Note: If you have Android Studio installed, you have the Android SDK installed.
It should be located at `~/Android/Sdk` instead of `~/android-sdk-linux`.
You can find the location in Android Studio when you open the
Tools→SDK Manager menu.

To add these settings permanently to your shell:

```bash
$ echo export ANDROID_HOME=$ANDROID_HOME >> .bashrc
```

## Building all apps from f-droid.org

In order to build all apps that are included in f-droid.org, then a
lot more software packages are required:

- all SDK platforms requested by the apps you want to build
- all Debian packages required by every app build process (maven, ant, etc)
- every source code management tool (git, subversion, mercurial, etc)
- every version of the Android NDK that apps use

On top of that, to build apps like they are built on f-droid.org, then
the whole [Build Server Setup](../Build_Server_Setup) is required.
That is a more secure, production-ready setup that requires quite a
bit more setup and resources.  The
[build server provisioning scripts](https://gitlab.com/fdroid/fdroidserver/tree/master/buildserver/)
provide a useful reference for all the needed bits.

If you want to make your own official releases with the F-Droid tools,
then you'll also need to set up the
[Signing Process](../Signing_Process).


## Proprietary, Non-Free libraries

The Android SDK is made available by Google under a proprietary
license. Within that, the essential build tools, SDK platforms,
support library and some other components are under the Apache license
and source code is provided.

Google APIs, used for building apps using Google Maps, are free to the
extent that the library comes pre-installed on the device.  Google
Play Services, Google Admob, GCM, and many other third party libraries
are proprietary and cannot be included in the main F-Droid repository.
The [MicroG project](https://microg.org) is developing free software
replacements for some of the most used proprietary Google libraries
