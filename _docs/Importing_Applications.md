---
layout: page
title: Importing Applications
redirect_from:
 - /manual/html_node/Importing-Applications.html

---


To help with starting work on including a new application, use
`fdroid import` to set up a new template project. It has two modes of
operation, starting with a cloned git repo:

```
git clone https://gitlab.com/fdroid/fdroidclient
cd fdroidclient
fdroid import
```

Or starting with a URL to a project page:

```
fdroid import --url=http://address.of.project
```

When a URL is specified using the `--url=` flag, `fdroid import` will
use that URL to find out information about the project, and if it finds
a git repo, it will also clone that. For this to work, the URL must
point to a project format that the script understands. Currently this is
limited to one of the following:

1.  GitLab - `https://gitlab.com/PROJECTNAME/REPONAME`
2.  Gitorious - `https://gitorious.org/PROJECTNAME/REPONAME`
3.  Github - `https://github.com/USER/PROJECT`
4.  Google Code - `http://code.google.com/p/PROJECT/` Supports git, svn
    and hg repos.

    Some Google Code projects have multiple repositories, identified by
    a dropdown list on the `source/checkout` page. To access one other
    than the default, specify its name using the `--repo` switch.

5.  Bitbucket - `https://bitbucket.org/USER/PROJECT/`
6.  Git - `git://REPO`

Depending on the project type, more or less information may be gathered.
For example, the license will be retrieved from a Google Code project,
but not a GitHub one. A bare repo url, such as the git:// one, is the
least preferable optional of all, since you will have to enter much more
information manually.

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
