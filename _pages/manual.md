---
layout: page
permalink: /manual/
description: 'F-Droid Server Manual'
keywords: 'F-Droid Server Manual'
title: 'F-Droid Server Manual'
---


## 4 Simple Binary Repository<a name="Simple-Binary-Repository"></a>

If you want to maintain a simple repository hosting only binary APKs
obtained and compiled elsewhere, the process is quite simple:

1.  Set up the server tools, as described in Setup.
2.  Make a directory for your repository. This is the directory from
    which you will do all the work with your repository. Create a config
    file there, called `config.py`, by copying `./examples/config.py`
    from the server project and editing it.
3.  Within that, make a directory called `repo` and put APK files in it.
4.  Run `fdroid update`.
5.  If it reports that any metadata files are missing, you can create
    them in the `metadata` directory and run it again.
6.  To ease creation of metadata files, run `fdroid update` with the
    `-c` option. It will create ’skeleton’ metadata files that are
    missing, and you can then just edit them and fill in the details.
7.  Then, if you’ve changed things, run `fdroid update` again.
8.  Running `fdroid update` adds an Icons directory into the repo
    directory, and also creates the repository index (index.xml, and
    also index.jar if you’ve configured the system to use a
    signed index).
9.  Publish the resulting contents of the `repo` directory to your
    web server.

Following the above process will result in a `repo` directory, which you
simply need to push to any HTTP (or preferably HTTPS) server to make it
accessible.

While some information about the applications (and versions thereof) is
retrieved directly from the APK files, most comes from the corresponding
file in the `metadata` directory. The metadata file covering ALL
versions of a particular application is named `package.id.txt` where
package.id is the unique identifier for that package.

See the Metadata chapter for details of what goes in the metadata file.
All fields are relevant for binary APKs, EXCEPT for `Build:` entries,
which should be omitted.


