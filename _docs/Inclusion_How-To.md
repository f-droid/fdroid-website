---
layout: page
title: Inclusion How-To

---

This page documents how a new application gets included in the main
F-Droid repository in technical details, from submitter's perspective.

Application Inclusion Proposal
------------------------------

To propose inclusion of new application to the main F-Droid repository,
one could post application's relevant information to the Submission
Queue. The more advanced alternative is writing a complete metadata file
yourself, test, and propose inclusion (merge request) directly into
fdroiddata Git repository; speeding up the process. Both ways will be
described below in details.

Note that you can propose inclusion even you are not a developer or
maintainer of the proposed application itself. See [Inclusion
Policy](../Inclusion_Policy) and [Repository Style
Guide](../Repository_Style_Guide) for the policy aspect of this
section.

### Proposal by Submission Queue

This is the simplest way to get the application included. But due to an
amount of reviewer labor required for each application, this is the
slowest method.

One do this by creating a new ticket at the [F-Droid Submission Queue on
GitLab](https://gitlab.com/fdroid/rfp/issues), add all details required
by minimal template; and wait for people in F-Droid team to review the
application and do all necessary steps for you.

### Proposal by Metadata Merge Request

A more advanced alternative for application inclusion proposal is to
write F-Droid metadata file for the application yourself, and propose
inclusion by filing git merge request on F-Droid application metadata
repository ([fdroiddata GitLab
repository](https://gitlab.com/fdroid/fdroidata/)). This will lead to
much quicker inclusion as the already-available metadata file will limit
the scope of what reviewers have to do on each inspection; the submitter
assumes responsibility of providing a correct metadata file.

When proposing inclusion this way, it is assumed that:

-   You have a good understanding what [Free
    Software](https://www.gnu.org/philosophy/free-sw.html) means, and
    what F-Droid is for.
-   You already read and understand the [Inclusion
    Policy](../Inclusion_Policy).
-   You already read and understand the [Repository Style
    Guide](../Repository_Style_Guide).
-   You already read and understand [the relevant parts of F-Droid
    server manual](https://f-droid.org/manual/html_node/Metadata.html).
-   You know how to use [Git VCS](https://git-scm.com/), and know how
    merge request (a.k.a. "pull request" in
    GitHub term) works in general.
-   You have an account on [GitLab](https://gitlab.com/).
-   You have a local instance of F-Droid server software, and you know
    what you are doing.

Recommended steps to propose inclusion this way is written on F-Droid
application metadata repository itself, which you could [read them
there](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md).

Application Review Process
--------------------------

Once the inclusion proposal is filed, the application will enter a
reviewing process which F-Droid staffs look into application's source
code and determine whether the it fits for inclusion. (And when it's
not, determine all necessary steps to make it so)

As F-Droid is a software repository which promises user on software
freedom, a review process is for ensuring that all applications
distributed from F-Droid main repository are Free Software.

This is a nonexhaustive list of what reviewer would do:

-   They will go to your source code repository, and look for copyright
    notices in license files, including README, to check that the
    proposed application is released under [recognized Free
    Software license(s)](https://www.gnu.org/licenses/license-list.html).
-   They will look at your build script to see which build system you
    use, and whether F-Droid build server can handle it (Ant and Gradle
    are the most common and easiest ones).
-   They will try to download a copy of your source code.
-   They will look in all source code files to verify that their
    licenses are consistent with corresponding license/README files.
-   They will check if your application uses pre-compiled library or
    binary blobs.
-   They will look at your non-source code files to identify [non-free
    resources](https://f-droid.org/wiki/page/Antifeature:NonFreeAssets) used in
    your application.
-   They will skim through the source code to see if your application
    uses non-Free dependencies, show advertisements, track users,
    promotes non-Free services/applications, or do anything that is
    harmful or otherwise undesirable for users.
-   They will list summary of [AntiFeatures](https://f-droid.org/wiki/page/Antifeatures) in
    your application.
-   They will try patching your application to remove usage of
    third-party proprietary software (if there is any).
-   They will try to determine a suitable update process for your
    application (e.g. by looking at how your releases relate to VCS tags
    and/or version information
    in `AndroidManifest.xml`).
-   They will try writing a suitable metadata file for your application,
    and add it to local F-Droid build server instance.
    (`fdroid rewritemeta`, `fdroid
    lint` are used to ensure that metadata is well-formed)
-   They will try to build your application in isolated environment to
    see if the process succeeds and yield a functional APK.
-   If all went smoothly, they will add a new metadata file to their
    local fdroiddata git repository and synchronizes the change
    to GitLab.

In case that the application failed some steps in the review, feedback
will be given in the original submission queue thread that the proposal
was posted.

Once fdroiddata repository is updated on GitLab, it's mostly just a
matter of time before F-Droid's official build server would fetch, build
your application, and publish it on the main F-Droid repository.

You can confirm the inclusion of your application by looking at [GitLab
fdroidata revision
history](https://gitlab.com/fdroid/fdroiddata/commits/master).

### Special Consideration of Metadata Merge Request

In case the inclusion is from GitLab merge request, review process is
theoretically the same, although they are done mostly to confirm that
the proposed metadata is consistent with what are really in the
application source code; and steps about writing and committing metadata
are omitted, as they will use the original metadata file you proprosed.
Feedbacks will be given on the original merge request thread that the
application was proposed; and once the process is completed, the request
will be merged to `master` branch of fdroiddata
GitLab repository.

In an attempt to optimize the process, when you proposed inclusion via
metadata merge request, F-Droid staffs relies on several assumption
([lined above](#Proposal_by_Metadata_Merge_Request)); so the
reviewing process in several aspect will be much less intensive, and
consumes much less time. Policy-violating applications that somehow
sneaked in this way will be dealt with after the fact.

Build Process
-------------

After the application metadata is added to fdroiddata GitLab repository,
the next step is a duty of main F-Droid build server to fetch
application's source code and related components, build the application,
and publish it on the main F-Droid repository.

The build process here is done **daily**, and applications are processed
in batch. As steps are done behind the scene and are mostly automatic;
all the submitter needs to do is to wait until it finish.

Record of build process for each application is provided on wiki, as a
subpage `lastbuild` of application's information
page (e.g. [this one](https://f-droid.org/wiki/page/org.fdroid.fdroid/lastbuild) is for
F-Droid client); to aid diagnostic in case the build was unexpectedly
failed.

### Metadata Refreshing Process

When the scheduled building time arrived, F-Droid build server will
fetch changes from fdroiddata GitLab repository and merge it to local
repository. Then, update checks will be performed for all
applications, including new ones; their metadata files will be
updated, and committed accordingly to the repository with `F-Droid
Builder <admin@f-droid.org>` as author name and email.

Once metadata files are updated, F-Droid Server will check them against a
list of released APKs to constuct a bill of new applications and/or
versions that are needed to be built, then enter application
preprocessing process, followed by build process for each of them.

### Application Preprocessing

### Application Build Process

### APK Signing Process

### Wiki Page Generation Process

### Repository Publishing Process

What to Expect
--------------

When your application metadata is approved and accepted into fdroiddata
git repository on GitLab, **it won't immediately appear** in the main
F-Droid repository.

Provided that your application does not have any build problem, it would
takes somewhere **around 24 hours to 48 hours** from fdroiddata merge
for the application to appear in the main
repository.[1](https://f-droid.org/forums/topic/how-fast-the-main-f-droid-repository-updates/)
This timing limitation is due to APK signing part of the build process,
which requires human intervention on keystore access
step.[2](https://f-droid.org/forums/topic/encouraging-f-droid-participation-by-developers/#post-17868)

Nevertheless, your application will not appear in f-droid.org's Lastest
Apps list just yet, even though people can now already search and
download it: Once the application appeared in the main F-Droid
repository, it would take another day before appearing on [Latest Apps
list](https://f-droid.org/).

External Links
--------------

-   [F-Droid application submission queue on
    GitLab](https://gitlab.com/fdroid/rfp/issues) (for new submissions)
-   [F-Droid application submission queue on
    forum](https://f-droid.org/forums/forum/submission-queue/) (for
    following-up old submissions)
-   [fdroiddata GitLab repository](https://gitlab.com/fdroid/fdroidata/)
-   [fdroiddata revision
    history](https://gitlab.com/fdroid/fdroiddata/commits/master)
