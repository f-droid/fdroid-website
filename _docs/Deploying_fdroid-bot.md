---
layout: page
title: Deploying <tt>fdroid-bot</tt>

---


<tt>fdroid-bot</tt> is the generic term for bots in F-Droid that review projects
and make merge requests.  For example,
[issuebot](https://gitlab.com/fdroid/issuebot) runs on [RFP
issues(https://gitlab.com/fdroid/rfp/issues) and [_fdroiddata_ merge
requests](https://gitlab.com/fdroid/fdroiddata/-/merge_requests).

It is important that any <tt>fdroid-bot</tt> setup is limited to only push to
GitLab projects under the [fdroid-bot group](https://gitlab.com/fdroid-bot).
<tt>fdroid-bot</tt> setups should never have push access to any other git
repositories.  This is a hard requirement to keep the security profile
manageable.

When <tt>fdroid-bot</tt> needs push access, it should be setup to use [Deploy
Key](https://docs.gitlab.com/ee/user/project/deploy_keys/) that is only used in
that one repo.  If <tt>fdroid-bot</tt> needs to interact with the GitLab API,
like to create merge requests, then it should use a [Personal Access
Token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) that
is assigned to a single project in GitLab.  This limits the access and makes it
easy to revoke specific tokens/keys as needed.


## Special case: binary transparency logs for external projects

There are binary transparency logs for the [Android SDK
components](https://gitlab.com/fdroid/android-sdk-transparency-log) and the
[gradle binaries](https://gitlab.com/fdroid/gradle-transparency-log).  These are
also automatic processes that push commits into dedicated git repositories where
the automatic process is the only committer.  These are not the same as
<tt>fdroid-bot</tt> because they are entirely self-contained in their own GitLab
projects.  These scripts are setup using GitLab Deploy Keys so that they only
can push commits to the same repository as they are running.
