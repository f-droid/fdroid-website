---
layout: page
title: Importing Applications

---


To help with starting work on including a new application, use
`fdroid import` to set up a new template project. It has two modes of
operation, starting with a cloned git repo:

```bash
git clone https://gitlab.com/fdroid/fdroidclient
cd fdroidclient
fdroid import
```

Or starting with a URL to a project page:

```bash
fdroid import --url=http://address.of.project
```

When a URL is specified using the `--url=` flag, `fdroid import` will
use that URL to find out information about the project, and if it finds
a git repo, it will also clone that. For this to work, the URL must
point to a project format that the script understands. Currently this is
limited to one of the following:

1.  GitLab - `https://gitlab.com/<PROJECTNAME>/<REPONAME>`
3.  GitHub - `https://github.com/<USER>/<PROJECT>`
4.  Bitbucket - `https://bitbucket.org/<USER>/<PROJECT>/`
5.  NotABug - `https://notabug.org/<USER>/<PROJECT>`
6.  Git - `git://<REPO>` or `https://<REPO>`

Depending on the project type, more or less information may be gathered.
A bare repo url, such as the git:// one, is the least preferable option
of all, since you will have to enter much more information manually. While
_gradle_ based builds should be auto-detected for all types, links to issue
trackers can not be set for plain git projects. You can also use one of the
following arguments to pre-fill your metadata:

* `-u <URL>`, `--url=<URL>`: Project URL to import from.
* `-s <DIR>`, `--subdir=<DIR>`: Path to main android project subdirectory, if not in root.
* `-c <CATEGORIES>`, `--categories=<CATEGORIES>`: Comma separated list of categories.
* `-l <LICENSE>`, `--license=<LICENSE>`: Overall license of the project.
* `--revision <REV>`: Allows a different revision (or git branch) to be specified for the initial import

If the import is successful, a metadata file will be created. You will
need to edit this further to check the information, and fill in the
blanks.

If it fails, you’ll be told why. If it got as far as retrieving the
source code, you can inspect it further by looking in `tmp/importer`
where a full checkout will exist.

A frequent cause of initial failure is that the project directory is
actually a subdirectory in the repository. In this case, run the
importer again using the `--subdir` option to tell it where. It will not
attempt to determine this automatically, since there may be several
options.
