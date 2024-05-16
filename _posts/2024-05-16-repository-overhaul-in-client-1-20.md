---
layout: post
title: "Repository Overhaul in new Client 1.20"
author: "grote"
authorWebsite: "https://blog.grobox.de"
---

Since [the early days of 2010](https://f-droid.org/2010/10/20/f-droid-repository-alpha.html),
F-Droid is a *repository* of apps (not an app store).
Its client app [always allowed to add third-party repositories](https://gitlab.com/fdroid/fdroidclient/-/blob/0b71cb7e7331fb73ee762225d0225fd92ce99010/src/org/fdroid/fdroid/ManageRepo.java).
Today, there are [hundreds of repositories](https://forum.f-droid.org/t/known-repositories/721)
and [we are improving](https://gitlab.com/fdroid/wiki/-/wikis/Repository-Management-Overhaul)
how the client app is handling those:

* the official repository is preferred by default
* the repository an app comes from is prominently shown
* if an app is available from more than one repository, you can choose where to get it from
* power users can change global repository priorities
* archives are part of their main repository and not listed separately
 
Previously, if you added a new repository,
it would get added with a higher priority than the pre-added official F-Droid repository.
This allowed the newly added repository to *override* apps built by F-Droid.
They could alter the app description and offer their own versions of the app for installation.
With the new 1.20 release of the official F-Droid client app,
newly added repositories get added with a lower priority,
so that the apps from the F-Droid repository take precedence by default.

Furthermore, when tapping an app, the user sees the app details screen as usual.
However, now a new box at the top clearly shows the repository the app comes from.

<img src="{% asset posts/2024-05-20-repository-overhaul-in-client-1-20/repo-box.png %}" />

All information on that page including the versions of the app that are considered for installation
are provided by the repository that is shown in the box at the top.
This was only implicit and hard to discover before.

If the app is available from more than one repository,
the box in the app details screen becomes a drop-down
where the user can see all repositories
and choose which one should be used for installation, updates and app information.

<img src="{% asset posts/2024-05-20-repository-overhaul-in-client-1-20/repo-change.webp %}" />

The list of repositories available in the settings now has a defined order.
Before, repositories at the bottom implicitly had a higher priority than those at the top.
This was counter-intuitive and thus changed.
Since version 1.20, the repository at the top has the highest priority
while the repo at the bottom has the lowest priority.
Users that upgrade from old versions may find that the order of their repositories has reversed.
This is to not force the new behavior upon them,
but to keep priorities how they were before.
Note that the position or priority of a repository only matters
if an app is available from more than one repo.

It is now also possible to re-order the position of repositories in the list.
For example, if NewPipe's repo was added and the user always wants to prefer apps from that repo,
they can move it to the top.

<img src="{% asset posts/2024-05-20-repository-overhaul-in-client-1-20/repo-reorder.webp %}" />

Repositories can have an *archive* where old apps or old versions of apps that are no longer relevant get moved to.
Historically, these archives were shown as regular repositories to the user.
Now, they are no longer shown in the list, but have moved to the details screen of each repository.

<img src="{% asset posts/2024-05-20-repository-overhaul-in-client-1-20/repo-archive.png %}" />

If, for some reason, you want to check the archive, you can enable it here.
For repositories that do not have an archive, enabling this will simply fail.

All these changes are new in version 1.20 which goes through alpha and beta stages before published for everyone.
We encourage users to opt-in to beta testing of F-Droid by visiting the app details screen of F-Droid itself,
then at the top right corner select the three dot menu and select "Allow Beta Updates".
The final version 1.20 is already live, but will undergo more testing until deemed _suggested_.
