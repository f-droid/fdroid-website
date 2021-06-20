---
layout: page
title: Setup an F-Droid App Repo

---

* Do not remove this line (it will not be displayed)
{:toc}

F-Droid.org is the default package repository (repo) in the F-Droid
client, but it is not the only possibility. Anyone can create their
own repo, and users can control which repos their client is using,
including even disabling the default f-droid.org repo. This model is
modeled somewhat after the [Debian GNU/Linux](https://www.debian.org)
distro.  Like Debian and Ubuntu, you can also setup your own repos for
anyone to use.  Custom repos do not even need to build the APKs, they
can just be "simple binary repos" of any APKs.


## Overview

If you want to maintain a simple binary repository of APKs and
packages obtained elsewhere, the process is quite simple:

1.  [Set up the server tools](../Installing_the_Server_and_Repo_Tools)
2.  Create a directory called _fdroid_, then run `fdroid init` in that directory
    to generate the signing key that uniquely identifies your repo.
3.  Optionally edit the _config.yml_ file to your liking, detailed examples
    are in
    [examples/config.yml](https://gitlab.com/fdroid/fdroidserver/-/blob/master/examples/config.yml)
4.  Within _fdroid_, make a directory called _repo_ and put APK files in it.
5.  Run `fdroid update`.
6.  If it reports that any metadata files are missing, you can create
    them in the `metadata` directory and run it again.
7.  To ease creation of metadata files, run `fdroid update` with the
    `-c` option. It will create ’skeleton’ metadata files that are
    missing, and you can then just edit them and fill in the details.
8.  Then, if you’ve changed things, run `fdroid update` again.
9.  Running `fdroid update` adds an _icons_ directory into the repo
    directory, and also creates the repository index files
    (_index.xml_, _index.jar_, etc) __NOTE: To make this process
    secure, read [Real World Setup](#real-world-setup) below!__
0.  Publish the resulting contents of the _repo_ directory
    to your web server (or set `serverwebroot` in your _config.yml_
    then use `fdroid deploy`)

Following the above process will result in a _repo_ directory, which you
simply need to push to any HTTP (or preferably HTTPS) server to make it
accessible.

While some information about the applications (and versions thereof)
is retrieved directly from the APK files, most comes from the
corresponding file in the _metadata/_ directory. The
[metadata file](../Build_Metadata_Reference) covering ALL versions of
a particular application is named _package.id.yml_ where package.id is
the unique identifier for that package.  All build metadata fields are
relevant for binary APKs, except for `Builds:` entries, which should be
omitted.


## Local Demo Repo HOWTO

This is a full HOWTO to setup your own repository wherever you want
to host it. It is somewhat technical, you will use the terminal, but
you don't need to be a terminal expert to follow along. First, this
HOWTO will walk through setting up a test repo that is not very
secure. Then it will walk through setting up a repo for real world
use, with the signing key on a separate machine from the public
webserver. Before you start, you need to get
[the `fdroidserver` tools](../Installing_the_Server_and_Repo_Tools)
and a webserver. For the webserver, this HOWTO will use _nginx_ since
its lightweight, but any will do if you already have one running.

```bash
sudo apt-get install nginx
```

In the case of this HOWTO, we're going to setup a "simple binary
repository" to host a collection of APKs. The repo will be set up in
the recommended _fdroid/_ subdirectory. This gives the `fdroid` tool
its own directory to work in, and makes the repo URL clearly marked as
an F-Droid repo. Also, the F-Droid client will automatically search for
a repository at the _/fdroid/repo_ path if the user only enters the server
(e.g. "https://f-droid.org"). Let's give our normal user control
over this subdirectory in the web root so that we don't need to run
the F-Droid tools as root (with _nginx_, the webroot is
_/usr/share/nginx/www_, it is different for other webservers):

```bash
sudo mkdir /usr/share/nginx/www/fdroid
sudo chown -R $USER /usr/share/nginx/www/fdroid
cd /usr/share/nginx/www/fdroid
fdroid init
```

Now put your APK files into _/usr/share/nginx/www/fdroid/repo_ and you
are ready to run the commands to build the repo (if `fdroid init`
cannot find your Android SDK in _/opt/android-sdk_ or `$ANDROID_HOME`,
it will prompt you for the path):

```bash
cd /usr/share/nginx/www/fdroid
cp /path/to/\*.apk /usr/share/nginx/www/fdroid/repo/
fdroid update --create-metadata
```

Voila! Now you have a working F-Droid Repo! Remember, this is __just a
test__ setup, remember to move on to the
[Real World Setup](#real-world-setup) after this! Add your new repo to
an F-Droid client on your Android device to test it out. That is done
in the __Manage Repos__ screen available from the menu. Your repo URL
will be the hostname or IP address of your machine with
`/fdroid/repo/` added to the end of it, i.e.
`https://mysecureserver.com/fdroid/repo/` or
`http://192.168.2.53/fdroid/repo/`. You can temporarily uncheck the
official repos to easily see what F-Droid found in your new repo.

While you can serve the repository at an arbitrary URL, it is customary
to make it available at an URL ending with `/fdroid/repo/`.
A good reason to actually do this is that the F-Droid client sets up an
intent filter and registers itself for such URLs. As a result, a user
that has the F-Droid app installed and opens such a well-formed URL
will have their device open F-Droid and guide them directly to adding
the repository to it.

### Customization

You can also customize your repo by editing the config file. Be sure to
use a programming text editor, like `editor
/usr/share/nginx/www/fdroid/config.yml`. In the config file,
you can set the name of the repo, the description, the icon, paths to
specific versions of the build tools, links to a related wiki, and
whether to keep stats. Here's the basic repo description block:

```yaml
repo_url = "http://guardianproject.info/fdroid/repo"
repo_name = "My Local Repo"
repo_icon = "GP_Logo_hires.png"
repo_description = """
A local test repository of Hans-Christoph Steiner <hans@guardianproject.info>.
It is a repository of Guardian Project apps. """
```

To put your icon into your repo, choose a PNG image to put in your
repo.  The PNG goes in `/usr/share/nginx/www/fdroid/`, the file can be
named whatever you want (by default its `fdroid-icon.png`). If you
change the name from the default, be sure to update `repo_icon` and
`archive_icon` in `/usr/share/nginx/www/fdroid/config.yml`.

A final note about security: this setup is not a good setup for a real
public repo, instead it is a quick and easy way to test out F-Droid. At
the very least, when generating the repo in place, make sure that
_config.yml_ is not accessible via the web, since it contains
passwords. If the file permissions are correct (e.g.  `chmod 0600
config.yml`), then _config.yml_ will not be readable by the webserver.


### App Metadata

You can control lots of aspects of how an app is represented in your
repo by editing the app's metadata. Running `fdroid update
--create-metadata` creates stub files for you, in order to have a
working repo. Then you can edit those files to add a description,
donation links, bug tracker, license, home page, etc. See the
[Build Metadata Reference](../Build_Metadata_Reference) for more info
on what all the options are.

_CurrentVersionCode_ provides a handy way to
deploy beta releases in the same stream as your full releases. You can
set _CurrentVersionCode_ to your current stable
release, then add APKs to your repo. Users will only be updated
automatically to the version code you specify. Any APKs for a given app
in your repo that have a newer version code will not be automatically
installed. Instead, the user can see them in the app detail view in the
client, and can manually install them.


## Real World Setup

Now that you have a working repo, it is straightforward to create a real
world setup. Generating a repo in place like we did above is very easy,
that is why this HOWTO started there, but it is not as secure as it
should be if your repo is going to be your main distribution point. For
example, the repo signing keys should not ever be on a public server.

To improve this situation, generate the repo on a non-public machine
like your laptop, keeping _config.yml_ and the
keystore only on that machine (remember to make backups!). Then use
`fdroid deploy` to publish the changes to
your repo on a separate server via ssh. So start a new repo from scratch
on your non-public machine:

```bash
mkdir ~/fdroid
cd ~/fdroid
fdroid init
cp /path/to/\*.apk ~/fdroid/repo/
fdroid update --create-metadata
emacs config.yml # add the serverwebroot, etc.
fdroid deploy -v
```

Now edit _config.yml_ to set `serverwebroot`, it is in the form of a
standard SCP file destination. Then `fdroid deploy` will do the
publishing via rsync over ssh. So both computers will have to have ssh
and rsync installed and setup. You can also use your own existing
signing key rather than the one generated by `fdroid init`, just edit
`repo_keyalias`, `keystore`, `keystorepass`, `keypass`, and
`keydname` in _~/fdroid/config.yml_.


