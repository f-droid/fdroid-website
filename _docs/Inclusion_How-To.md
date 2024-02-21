---
layout: page
title: Inclusion How-To

---

This page documents how a new application gets included in the main
F-Droid repository. It includes the technical details that a submitter should be aware of.

## Application Inclusion Proposal

To propose inclusion of a new application to the main F-Droid repository,
one could post the applications relevant information to the Submission
Queue. The more advanced alternative is writing a complete metadata file
yourself, test, and propose inclusion (merge request) directly into
the fdroiddata Git repository; speeding up the process. Both ways will be
described below in detail.

Note that you can propose inclusion even you are not a developer or
maintainer of the proposed application itself. See [Inclusion
Policy](../Inclusion_Policy) and [Repository Style
Guide](../Repository_Style_Guide) for the policy aspect of this
section.

### Proposal by Submission Queue

This is the simplest way to get the application included. But due to an
amount of reviewer labor required for each application, this is the
slowest method.

Do this by creating a new ticket at the [F-Droid Submission Queue on
GitLab](https://gitlab.com/fdroid/rfp/issues), add all details required
by the minimal issue template; and wait for people in F-Droid team to review the
application and do all necessary steps for you.

### Proposal by Metadata Merge Request

A more advanced alternative for application inclusion is to
write an F-Droid metadata file for the application yourself, and propose
inclusion by filing a git merge request on the F-Droid application metadata
repository ([fdroiddata GitLab
repository](https://gitlab.com/fdroid/fdroiddata/)). This will lead to
much quicker inclusion as the already-available metadata file will reduce
the burden on reviewers when inspecting your proposed metadata; the submitter
assumes responsibility of providing a correct metadata file.

When proposing inclusion this way, it is assumed that:

-   You have a good understanding of what [Free
    Software](https://www.gnu.org/philosophy/free-sw.html) means, and
    what F-Droid is for.
-   You already read and understand the [Inclusion
    Policy](../Inclusion_Policy).
-   You already read and understand the [Repository Style
    Guide](../Repository_Style_Guide).
-   You already read and understand
    [the relevant parts of the F-Droid documentation](../Build_Metadata_Reference).
-   You know how to use [Git VCS](https://git-scm.com/), and know how
    a merge request (a.k.a. "pull request" in
    GitHub terminology) works in general.
-   You have an account on [GitLab](https://gitlab.com/).
-   You have a local instance of the F-Droid server software, and you know
    what you are doing.

Recommended steps to propose inclusion this way are written on the [F-Droid
application metadata repository](https://gitlab.com/fdroid/fdroiddata/blob/master/CONTRIBUTING.md).

## Application Review Process

Once the inclusion proposal is filed, the application will enter a
reviewing process where F-Droid staff look into the applications source
code and determine whether the it fits for inclusion (and when it's
not, determine all necessary steps to make it so).

As F-Droid is a software repository which promises users free software,
a review process is for ensuring that all applications
distributed from the F-Droid main repository are Free Software.

This is a nonexhaustive list of what a reviewer would do:

-   They will go to your source code repository, and look for copyright
    notices in license files, including README, to check that the
    proposed application is released under a [recognized Free
    Software and/or OSI license(s)](https://spdx.org/licenses/).
-   They will look at your build script to see which build system you
    use, and whether F-Droid build server can handle it (Ant and Gradle
    are the most common and easiest ones).
-   They will try to download a copy of your source code.
-   They will look in all source code files to verify that their
    licenses are consistent with corresponding license/README files.
-   They will check if your application uses any pre-compiled libraries or
    binary blobs.
-   They will look at your non-source code files to identify [Non-Free
    resources](https://monitor.f-droid.org/anti-feature/NonFreeAssets) used in
    your application.
-   They will skim through the source code to see if your application
    uses Non-Free dependencies, shows advertisements, tracks users,
    promotes or depends on Non-Free or non-changeable services/applications, or does
    anything that is harmful or otherwise undesirable for users.
-   They will list a summary of any [_AntiFeatures_](https://monitor.f-droid.org/anti-features) in
    your application.
-   They will try patching your application to remove usage of
    third-party proprietary software (if there is any).
-   They will try to determine a suitable update process for your
    application (e.g. by looking at how your releases relate to VCS tags
    and/or version information
    in _AndroidManifest.xml_).
-   They will try writing a suitable metadata file for your application,
    and add it to local F-Droid build server instance.
    (`fdroid rewritemeta`, `fdroid
    lint` are used to ensure that metadata is well-formed)
-   They will try to build your application in an isolated environment to
    see if the process succeeds and yield a functional APK.
-   If all went smoothly, they will add a new metadata file to their
    local fdroiddata git repository and synchronizes the change
    to GitLab.

In the case that the application failed some steps in the review, feedback
will be given in the original submission queue thread where the proposal
was posted.

Once the fdroiddata repository is updated on GitLab, it's mostly just a
matter of time before F-Droid's official build server will fetch, build,
and publish your application on the main F-Droid repository.

You can confirm the inclusion of your application by looking at the [GitLab
fdroiddata revision
history](https://gitlab.com/fdroid/fdroiddata/commits/master).

### Special Consideration of Metadata Merge Request

In case the inclusion is from a GitLab merge request, the review process is
theoretically the same. They are done mostly to confirm that
the proposed metadata is consistent with what is really in the
application source code. Steps about writing and committing metadata
are omitted, as they will use the original metadata file you proprosed.
Feedback will be given on the original merge request thread that the
application was proposed; and once the process is completed, the request
will be merged to the `master` branch of the fdroiddata
GitLab repository.

In an attempt to optimize the process, when you proposed inclusion via
metadata merge request, F-Droid staff rely on several assumptions
([outlined above](#Proposal_by_Metadata_Merge_Request)). As such, the
reviewing process will be much less intensive in several respects, and
consumes much less time. Policy-violating applications that somehow
sneaked in this way will be dealt with after the fact.

## Reproducible Builds

Reproducible builds are not a requirement for apps being on F-Droid. But we do
consider their use best practice. And unfortunately, one can't easily switch to
them later because Android doesn't allow updates with a different signing key,
meaning users would have to reinstall. So we mainly encourage their use for new
apps.

The point of reproducible builds is that the developer's signature (from the APK
they publish) guarantees that our build is identical to theirs (and thus doesn't
contain anything it shouldn't) and at the same time our build server verifies
that the developer's build matches the published source code (and thus doesn't
contain anything it shouldn't either).

This increases trust and makes supply-chain attacks harder. It also makes it
impossible for there to be a bug in the F-Droid version only (or vice versa).
Using the developer's key also means they have the option of providing updates
to users themselves if we for some reason (temporarily) cannot.

Some apps -- especially those without native code, using only Kotlin/Java -- are
very easy to make reproducible. Others may require more work. Sadly, some apps
cannot be made reproducible at all.

We hope that developers agree with us that it's at least worth attempting to
make their apps reproducible given the various benefits, but if they are unable
or unwilling to spend time/resources on this, we of course respect their
decision.

For more information, see:

* [Towards a reproducible F-Droid](https://f-droid.org/2023/01/15/towards-a-reproducible-fdroid.html)
* [F-Droid's Reproducible Builds documentation](../Reproducible_Builds)
* [Reproducible Builds project](https://reproducible-builds.org/)
* [HOWTO: diff & fix APKs for Reproducible Builds](https://gitlab.com/fdroid/wiki/-/wikis/HOWTO:-diff-&-fix-APKs-for-Reproducible-Builds)

## Build Process

After the application metadata is added to fdroiddata GitLab repository,
the next step is for the main F-Droid build server to fetch
the applications source code and related components, build the application,
and publish it on the main F-Droid repository.

This build process is done **daily**, and applications are processed
in batch. As steps are done behind the scene and are mostly automatic;
all the submitter needs to do is to wait for it to finish.

A record of a successful build process for one application is provided on the
F-Droid's website page for that specific app (e.g. [see the Build Log for the F-Droid
Client](https://f-droid.org/en/packages/org.fdroid.fdroid/#latest)).

Apps that fail will have the log available during the build cycle on the [F-Droid Monitor - Running](https://monitor.f-droid.org/builds/running) page or, if in the previous cycle, on the [Build](https://monitor.f-droid.org/builds/build) page.
This is useful to aid in diagnosing problems when the build unexpectedly failed.

### Metadata Refreshing Process

When the scheduled building time arrives, the F-Droid build server will
fetch changes from the fdroiddata GitLab repository and merge it to a local
repository. Then, update checks will be performed for all
applications. If a new version is found, their metadata files will be
updated and committed to the repository by the author `F-Droid checkupdates
(@fdroidci)`.

Once metadata files are updated, the F-Droid Server will check them against a
list of released APKs to construct a list of new applications and/or
versions that need to be built. It will then enter the application
preprocessing process, followed by the build process for each of them.

### Application Preprocessing

### Application Build Process

### APK Signing Process

### Repository Publishing Process

## What to Expect

When your application metadata is approved and accepted into the fdroiddata
git repository on GitLab, **it won't immediately appear** in the main
F-Droid repository.

Provided that your application does not have any build problems, it would
takes somewhere **around 24 to 48 hours** from fdroiddata merge
until the application to appears in the main
repository.[1](https://f-droid.org/forums/topic/how-fast-the-main-f-droid-repository-updates/)
This timing limitation is due to the APK signing part of the build process,
which requires human intervention on keystore access
step.[2](https://f-droid.org/forums/topic/encouraging-f-droid-participation-by-developers/#post-17868)

Nevertheless, your application will not appear in f-droid.org's Lastest
Apps list just yet, even though people can now already search and
download it: Once the application appeared in the main F-Droid
repository, it would take another day before appearing on [Latest Apps
list](https://f-droid.org/).

## External Links

-   [F-Droid application submission queue on
    GitLab](https://gitlab.com/fdroid/rfp/issues) (for new submissions)
-   [F-Droid application submission queue on
    forum](https://f-droid.org/forums/forum/submission-queue/) (for
    following-up old submissions)
-   [fdroiddata GitLab repository](https://gitlab.com/fdroid/fdroiddata/)
-   [fdroiddata revision
    history](https://gitlab.com/fdroid/fdroiddata/commits/master)
