---
layout: page
title: Setup an F-Droid App Repo
permalink: /docs/Setup_an_F-Droid_App_Repo
---

F-Droid.org is the default package repository (repo) in the FDroid
client, but it is not the only possibility. Anyone can create their own
repo, and users can control which repos their client is using, including
even disabling the default f-droid.org repo. This model is modeled
somewhat after the [Debian GNU/Linux](https://www.debian.org) distro.
Like Debian and Ubuntu, you can also setup your own repos for anyone to
use.

This is a quick HOWTO to setup your own repository wherever you want
to host it. It is somewhat technical, you will use the terminal, but
you don't need to be a terminal expert to follow along. First, this
HOWTO will walk through setting up a test repo that is not very
secure. Then it will walk through setting up a repo for real world
use, with the signing key on a separate machine from the public
webserver. Before you start, you need to get
[the `fdroidserver` tools](https://f-droid.org/wiki/page/Installing_the_Server/Repo_Tools)
and a webserver. For the webserver, this HOWTO will use _nginx_ since
its lightweight, but any will do if you already have one running.

<pre> sudo apt-get install nginx ```

In the case of this HOWTO, we're going to setup a
"[Simple Binary Repository](https://f-droid.org/manual/fdroid.html#Simple-Binary-Repository)"
to host a collection of APKs. The repo will be set up in the
recommended _fdroid/_ subdirectory. This gives the `fdroid` tool its
own directory to work in, and makes the repo URL clearly marked as an
FDroid repo. Also, the F-Droid client will automatically search for a
repository at the _/fdroid/repo_ path if the user only the server
(e.g. "<https://f-droid.org>"). Let's give our normal user control
over this subdirectory in the web root so that we don't need to run
the F-Droid tools as root (with _nginx_, the webroot is
_/usr/share/nginx/www_, it is different for other webservers):

```
$ sudo mkdir /usr/share/nginx/www/fdroid
$ sudo chown -R $USER /usr/share/nginx/www/fdroid
$ cd /usr/share/nginx/www/fdroid
$ fdroid init
```

Now put your APK files into _/usr/share/nginx/www/fdroid/repo_ and you
are ready to run the commands to build the repo (if `fdroid init`
cannot find your Android SDK in _/opt/android-sdk_ or `$ANDROID_HOME`,
it will prompt you for the path):

```
$ cd /usr/share/nginx/www/fdroid
$ cp /path/to/\*.apk /usr/share/nginx/www/fdroid/repo/
$ fdroid update --create-metadata
```

Voila! Now you have a working F-Droid Repo! Remember, this is \*\*just a
test\*\* setup, remember to move on to the [Real World
Setup](https://f-droid.org/wiki/page/Setup_an_FDroid_App_Repo#Real_World_Setup)
after this! Add your new repo to an F-Droid client on your Android
device to test it out. That is done in the <strong>Manage
Repos</strong> screen available from the menu. Your repo URL will
be the hostname or IP address of your machine with
`/fdroid/repo/` added to the end of it, i.e.
`<https://mysecureserver.com/fdroid/repo/%3C/code%3E> or
`<http://192.168.2.53/fdroid/repo/%3C/code%3E>. You can
temporarily uncheck the official repos to easily see what F-Droid found
in your new repo.

<h2>Customization</h2>

You can also customize your repo by editing the config file. Be sure to
use a programming text editor, like `editor
/usr/share/nginx/www/fdroid/config.py`. In the config file,
you can set the name of the repo, the description, the icon, paths to
specific versions of the build tools, links to a related wiki, and
whether to keep stats. Here's the basic repo description block:

``` repo\_url = "<http://guardianproject.info/fdroid/repo>"
repo\_name = "My Local Repo" repo\_icon = "GP\_Logo\_hires.png"
repo\_description = """ This is a local test repository of
Hans-Christoph Steiner <hans@guardianproject.info>. It is a
repository of Guardian Project apps. """ ```

To put your icon into your repo, choose a PNG image to put in your repo.
The PNG goes in `/usr/share/nginx/www/fdroid/`,
the file can be named whatever you want (by default its
`fdroid-icon.png`). If you change the name from
the default, be sure to update `repo\_icon` and
`archive\_icon` in
`/usr/share/nginx/www/fdroid/config.py`.

A final note about security: this setup is not a good setup for a real
public repo, instead it is a quick and easy way to test out FDroid. At
the very least, when generating the repo in place, make sure that
`config.py` is not accessible via the web, since
it contains passwords. If the file permissions are correct (e.g.
`chmod 0600 config.py`), then
`config.py` will not be readable by the
webserver.


### App Metadata

You can control lots of aspects of how an app is represented in your
repo by editing the app's metadata. Running `fdroid update
--create-metadata` creates stub files for you, in order to
have a working repo. Then you can edit those files to add a description,
donation links, bug tracker, license, home page, etc. See [the
manual](https://f-droid.org/manual/fdroid.html#Metadata) for more info
on what all the options are.

`Current Version Code` provides a handy way to
deploy beta releases in the same stream as your full releases. You can
set `Current Version Code` to your current stable
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
like your laptop, keeping `config.py` and the
keystore only on that machine (remember to make backups!). Then use
`fdroid server update` to publish the changes to
your repo on a separate server via ssh. So start a new repo from scratch
on your non-public machine:

```
$ mkdir ~/fdroid
$ cd ~/fdroid
$ fdroid init
$ cp /path/to/\*.apk ~/fdroid/repo/
$ fdroid update --create-metadata
$ emacs config.py # add the serverwebroot, etc.
$ fdroid server update -v
```

Now edit _config.py_ to set `serverwebroot`, it is in the form of a
standard SCP file destination. Then `fdroid server update` will do the
publishing via rsync over ssh. So both computers will have to have ssh
and rsync installed and setup. You can also use your own existing
signing key rather than the one generated by `fdroid init`, just edit
`repo_keyalias`, `keystore`, `keystorepass`, `keypass`, and
`keydname` in _~/fdroid/config.py_.
