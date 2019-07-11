---
layout: post
title: Improving our "bus factor"
author: "F-Droid"

---

"Bus factor" is an important measure of the health of a free software
project, even though the idea is quite morbid.  As F-Droid has
expanded from a project of one to a whole community effort. And there
is much more work than one person can do.  Essential infrastructure
needs to be maintained by separate people to make the whole project
resilient and owned by the community.

Towards that end, we have a new host for a key piece of
infrastructure.  The website build and deploy process is now hosted by
[Nick Merrill](https://en.wikipedia.org/wiki/Nicholas_Merrill) of
[Calyx Institute](https://www.calyxinstitute.org/) in Iceland.  It is
hard to find a better combination for a project that is concerned with
privacy.  Nick is an F-Droid user, and Calyx Institute is building the
most private internet services possible, with F-Droid as a key piece.
Nick also fought a secret order from the US government and [won in US
Federal Court](https://en.wikipedia.org/wiki/Doe_v._Ashcroft) after 11
years of arduous legal proceedings. Lastly, Iceland is one of the best
locations for hosting internet services that need strong privacy.

## Technical Details

A couple of years ago, we overhauled this website to let it be
translated into any language by F-Droid contributors. We now have 15
languages live and many more
[in progress](https://hosted.weblate.org/projects/f-droid/website/).

Though we did not realize it at the time, it looks like we have
created the largest website that is generated using a static site
generator (SSG).  There is currently about 30,000 pages,
([staging.f-droid.org](https://staging.f-droid.org) has 75,000
pages!), and we have not found a Jekyll website with more pages. All
this means the build and deploy process is resource intensive and can
take a while.  It has also proven a bit brittle, largely because the
process uses so much RAM and CPU.

The new deploy server setup is entirely scripted with Ansible, running
on a plain Debian box.  So if the current server fails for whatever
reason, we can easily recreate a new server.  This also is great for
bus factor since anyone can recreate the whole deploy setup if the
existing maintainers vanish entirely.

## Contributions Welcome!

One last thing: if you have ever asked why some aspect of F-Droid does
not work as well as it should, then the answer most likely is: F-Droid
needs more contributors!  This new deploy server is the perfect
example of something that anyone could have developed independently
from the current contributors.  The whole website is free software and
publicly available, so anyone can access all the pieces to build an
complete, working copy of the real site.
