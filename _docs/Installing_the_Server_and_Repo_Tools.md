---
layout: page
title: Installing the Server and Repo Tools
redirect_from:
 - /wiki/page/Installing_the_Server/Repo_Tools

---

The [fdroidserver](https://gitlab.com/fdroid/fdroidserver) tools provide
everything you need to set up and maintain your own repos, run an fdroid
build server, and even host your own website like f-droid.org. The
F-Droid developers mostly work on Debian, Arch, and Ubuntu, so those are
currently the best supported platforms.

In order to setup and maintain your own collection of apps and media,
you need to setup an F-Droid repository using the tools from
*fdroidserver*.


## Debian/Ubuntu/Mint/etc

The F-Droid tools, also known as _fdroidserver_, are
included in recent releases (Debian/jessie, Ubuntu/utopic, and newer).
This should be enough to install the basic F-Droid setup:

    sudo apt-get install fdroidserver


### Older releases

For installing on older releases, there are a couple more simple steps:

-   Ubuntu/Mint: use the [Guardian Project
    PPA](https://launchpad.net/~guardianproject/+archive/ppa/+packages)
    (fingerprint: `6B80 A842 07B3 0AC9 DEE2 35FE F50E ADDD
    2234 F563`):

    sudo add-apt-repository ppa:guardianproject/ppa
    sudo apt-get update
    sudo apt-get install fdroidserver

-   Debian/wheezy: [setup wheezy-backports](http://backports.debian.org/Instructions/#index2h2),
    then:

    apt-get install fdroidserver/wheezy-backports


## Apple OSX

You can install `fdroidserver` directly using [MacPorts](https://www.macports.org/ports.php?by=name&substr=fdroidserver), [Homebrew](http://brewformulas.org/Fdroidserver), or `easy_install` as a last resort:

or MacPorts:

    port install fdroidserver

or Homebrew:

    brew install android-sdk
    android update sdk --no-ui --filter platform-tools,build-tools-22.0.1
    brew install fdroidserver

With only `easy_install`:

    sudo easy_install fdroidserver


## Windows

### Windows 10 Subsystem for Linux

Starting with the Windows 10 "Anniversary Update", you can [enable an
Ubuntu environment](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)
that runs in Windows, known has "Bash on Windows", "Ubuntu on Windows",
or "Windows Subsystem for Linux".

1.  [setup Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide)
2.  install *fdroidserver* from the [Guardian Project PPA](https://launchpad.net/~guardianproject/+archive/fdroidserver/+packages)
    (fingerprint: `6B80 A842 07B3 0AC9 DEE2 35FE F50E ADDD
    2234 F563`) by running this in the Bash shell window:

``` 
sudo add-apt-repository ppa:guardianproject/fdroidserver
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

` export ANDROID_HOME=/cygdrive/c/path/to/android-sdk`\
` fdroid init   # the keystore gen will fail`

After running `fdroid init`, you need to set the
Windows path to your keystore in `config.py`.

It is also possible to install *fdroidserver* in a virtual environment
using *virtualenv* and *pip*.

1.  `easy_install pip`
2.  `easy_install virtualenv`

Now follow the *virtualenv+pip* instructions above, then you should be
able to run the `fdroid` command as long as you
are in the Python "virtualenv".


## Installing the latest code on all platforms

The easiest way to install the fdroidserver tools from source is to use
virtualenv and pip. First, make sure you have the Python3 version of
_virtualenv_ or _pyvenv_ installed, it
should be included in your OS's Python distribution or via other
mechanisms like dnf/yum/pacman/emerge/Fink/MacPorts/Brew. Then here's
how to install _fdroidserver_ into a Python "virtual
env":

    git clone https://gitlab.com/fdroid/fdroidserver.git
    cd fdroidserver
    virtualenv env/  # pyvenv also works
    . env/bin/activate
    pip3 install -e .
    python3 setup.py install


## Buildserver Setup


If you want to build apps using F-Droid, then you will have to install
the whole Android SDK. This process is currently only developed on
GNU/Linux, but we'd be happy to accept patches getting it working on
MacOS and Windows. If you only want to make F-Droid repositories of APK
files that you already have or don't know what this means, then you can
skip this section.

The F-Droid tools depend on the Android SDK and Java, but only parts of
the Android SDK are available in Debian. So the Android ADK must be
installed manually, as well as the packages that it requires (_the
Android SDK tools include some 32-bit binaries, so even 64-bit systems
need these i386 library packages_). The F-Droid tools use the Android
SDK to build and inspect apps, so you must have the Android SDK
installed and setup before using fdroidserver.

Install the Android SDK and make sure `ANDROID_HOME` is
properly set. Be sure to verify the file you downloaded, you can
[double-check the SHA-1Checksum](https://developer.android.com/sdk/index.html#Other_double-check_the_SHA-1_Checksum)
on Google's download page.

    $ sudo apt-get install openjdk-8-jdk lib32stdc++6 lib32gcc1 lib32z1 lib32ncurses5 ...
    $ cd ~
    $ wget https://dl.google.com/android/android-sdk_r24.3.4-linux.tgz
    $ echo "fb293d7bca42e05580be56b1adc22055d46603dd  android-sdk_r24.3.4-linux.tgz" | sha1sum -c
    android-sdk_r24.3.4-linux.tgz: OK
    $ tar xzf android-sdk_r24.3.4-linux.tgz
    $ export ANDROID_HOME=~/android-sdk-linux_86
    $ export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
    $ android update sdk --no-ui --filter platform-tools,tools,build-tools-22.0.1,android-22

To add these settings permanently to your shell:

    $ echo export ANDROID_HOME=$ANDROID_HOME >> .bashrc
    $ echo 'export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools' >> .bashrc


### TODO

-   fix `fdroid init --keystore` with Microsoft Windows paths...
