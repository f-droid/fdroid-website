---
title: F-Droid in 2025 - Strengthening Our Foundations in a Changing Mobile Landscape
author: F-Droid
layout: post
---

2025 was a big year for F-Droid. Not only did we celebrate 15 years of
securely distributing FOSS apps to users around the world, we onboarded
new maintainers, board members and project collaborators, invested in
infrastructure upgrades, and played an active role in independent app
store and FOSS developer advocacy.

### Community, Contributions, and Shared Impact

F-Droid’s impact in 2025 was the result of many different kinds of
contributions. Developers publishing and maintaining free and open
source apps, contributors maintaining build infrastructure, reviewing
app submissions, improving tooling, and writing documentation,
translators expanding access across languages and regions, researchers
and advocates translating technical work in policy contexts, and donors
whose support keeps F-Droid independent and accountable to its
community.

Together, this work enables an app distribution ecosystem that is
transparent, privacy respecting, and governed in the open.

### Impact in Numbers

This year was another big year in terms of apps added, updated, built
and distributed. Here are some quick stats at the end of December 2025.

Total number of apps on the main repo: We currently have 4,061 apps on
the main repo, an increase of 547 apps since last year, ~21% are built
reproducibly, signed by the developers, further expanding the variety of
open-source apps available to users.

App Updates: Each of them were updated by the developer approximately
three times, making the number of updates 13,489, keeping the app catalogue
fresh and secure.

Cumulative App Updates and Downloads: In 2025 F-Droid users cumulatively updated
and downloaded apps over 18 million times. This number is extrapolated since
the infrastructure we have is meant to protect user privacy. We will be
publishing an F-Droid downloads post in the near future to further expand
on this topic.

Archived Apps: We parted with 1554 apps as tech moves on and devs do
too.

### Strengthening our Foundations in 2025

A large portion of our work this year focused on strengthening F-Droid’s
foundations.

#### F-Droid Client

In 2025, we began a major overhaul of the F-Droid client to make
finding, understanding, and managing apps easier without compromising
privacy or user control. To start, we completed work to move towards
[Material Design](https://f-droid.org/2025/04/23/md3.html), adopting
updated visuals, edge-to-edge layout and refined UI elements.

In addition to the Material Design upgrade, the official F-Droid client
is being
[overhauled](https://gitlab.com/fdroid/fdroidclient/-/milestones) using
modern Android tooling, with a focus on reducing technical debt and
making future development more approachable for contributors.

Key improvements include a complete UI rewrite using Kotlin Compose,
improved search that includes descriptions and translations, better
discovery of new and updated apps, installation approval before
downloads begin, support for multiple simultaneous downloads and
updates, clear notifications when app issues arise, such as signing key
changes, and optional Material You theming.

Alongside these user facing changes, we completed internal refactoring,
modernized libraries, improved testing workflows, and simplified
maintenance. This work directly supports contributor onboarding, reduces
long term risk, and makes it easier to respond to future platform changes.

#### Build Infrastructure and Maintenance

Behind the scenes, we continued improving the infrastructure that
builds, verifies, and publishes apps for the main F-Droid repository.

This included ongoing work on
[Buildbot](https://gitlab.com/fdroid/buildbot), [reproducible
builds](https://f-droid.org/2025/11/27/twif.html), [repository
tooling](https://gitlab.com/fdroid/fdroidserver), [metadata
cleanup](https://gitlab.com/fdroid/admin/-/issues/377), [translation
automation](https://gitlab.com/fdroid/fdroid-website/-/issues/886),
[library
maintenance](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1598),
and [compatibility
testing](https://gitlab.com/fdroid/fdroidclient/-/merge_requests/1586)
with upcoming Android versions. We also continued modernization efforts
working on [Nearby app
sharing](https://gitlab.com/fdroid/fdroidclient/-/issues/3010),
migrating Gradle build scripts from [Groovy to Kotlin
DSL](https://gitlab.com/fdroid/fdroidclient/-/issues/3117), and
[adapting upstream changes in Maven
Central](https://gitlab.com/fdroid/fdroidclient/-/issues/3098).

This kind of infrastructure work is rarely visible, but it is essential
to maintaining trust at scale.

#### Core Server Upgrade

One of the most tangible improvements in 2025 was the replacement of
F-Droid’s core build and publishing server.

The previous system’s hardware was over a decade old and it had been
running continuously for years. While it served the project well, it had
become a bottleneck and an increasing maintenance burden.

Thanks entirely to community donations, we were able to replace this
critical piece of infrastructure. The new server significantly improves
build performance, allowing us to run the full repository pipeline more
frequently and reduce the delay between developer updates and user
availability.

We were deliberate about how this server is hosted. It is physically
controlled in a data center by a long time contributor with a proven security track record. We
know exactly where it is, who has access, and how it is managed. This
level of transparency is rare in infrastructure, but it aligns with our
values and threat model. This upgrade exists because of community
support and it strengthens the entire ecosystem.

### Grant Funded Work in Service of Sustainability and Decentralization

While donations remain central to F-Droid’s independence, grants in 2025
allowed us to dedicate focused time to work that benefits both F-Droid
and the broader free software ecosystem.

#### OTF FOSS Sustainability Grant

The Open Technology Fund’s FOSS Sustainability
[grant](https://www.opentech.fund/funds/free-and-open-source-software-sustainability-fund/)
supports projects that provide critical digital infrastructure and need
time and space to strengthen internal sustainability.

For F-Droid, [this
grant](https://f-droid.org/2025/02/05/f-droid-awarded-otf-grant.html)
enabled work that is difficult to fund through feature driven
development alone.

In 2025, we completed three major objectives under this grant including
a substantial [refactor of the Android
client](https://gitlab.com/guardianproject/vienna/otf-foss-sustainability-grant/-/milestones/4)
to improve development and testing workflows, [modernization of internal
tooling and
libraries](https://gitlab.com/guardianproject/vienna/otf-foss-sustainability-grant/-/milestones/3),
and concrete progress on governance, [establishing policies and legal
strategies](https://gitlab.com/guardianproject/vienna/otf-foss-sustainability-grant/-/milestones/2)
to make F-Droid more resilient. This work is ongoing as the landscape
evolves and it is necessary to respond to new challenges.

Beyond these deliverables, we continued work on additional objectives
focused on understanding [how FOSS projects manage
donations](https://gitlab.com/guardianproject/vienna/otf-foss-sustainability-grant/-/milestones/6#tab-issues),
how communities perceive funding practices, and what sustainable, value
aligned funding can look like in practice.

This research is not only inward facing. We published an [extensive blog
series](https://f-droid.org/2025/08/04/strengthening-f-droids-legal-resilience-introducing-the-research-series.html)
detailing our legal resilience research and we are preparing to share
our FOSS donations campaigns findings openly with other projects via
blog articles and [hosting a workshop at FOSDEM
2026](https://gitlab.com/guardianproject/vienna/otf-foss-sustainability-grant/-/milestones/8).
If you are planning on attending FOSDEM, we look forward to seeing you
there!

#### Mobifree: Decentralized App Distribution in Practice

[Mobifree](https://mobifree.org/) is an EU funded research and
development project focused on giving European citizens and
organizations more choice in, and access to, human-centered and ethical
mobile software. The project supports independence from gatekeeper
platforms, closed-source software and harvesting user data.

The [core idea behind
Mobifree](https://f-droid.org/2024/05/24/mobifree.html) is that
competition, user choice, and digital sovereignty require real
alternatives that work within existing developer workflows while
offering users meaningful freedom.

F-Droid played a central role in Mobifree, contributing across research,
software development, and ecosystem building, specifically in the area
of FOSS app distribution.

Our work included improving
[Repomaker](https://f-droid.org/repomaker/), a tool that allows users
and organizations to create and share their own app repositories,
building and expanding [Appiverse](https://appiverse.io/fdroid/), a
catalogue of known F-Droid compatible repositories designed to improve
interoperability between app stores, creating an API that allows
alternative distributors to discover, verify, and reuse repositories,
expanding Fastlane tooling so developers can integrate F-Droid
distribution into their existing release workflows and integrating
results from user research directly into our software design updates.

We worked closely with partners including [Waag](https://waag.org/en/),
[BioSense](https://biosens.rs/), [University of
Amsterdam](https://www.ivir.nl/), [Murena](https://murena.com/), and [e
Foundation](https://e.foundation/), supporting in the user testing and
workshops and have already begun analysing and mapping out how to
implement the user feedback.

In 2025, we presented our work to the European Commission during the
Mobifree 18 month review. This was an important moment to demonstrate
that decentralized, privacy respecting app distribution is not
theoretical. It is already being built, tested, and improved in the
open.

In 2026, we will [continue Mobifree
work](https://gitlab.com/groups/fdroid/-/issues/?sort=updated_desc&state=all&label_name%5B%5D=Mobifree&last_page_size=20)
by implementing user test feedback across the F-Droid website, client,
Appiverse and Repomaker, further improving usability and clarity.

#### Policy Engagement and Legal Resilience

As F-Droid entered its 15th year, policy and legal work became
increasingly important.

In 2025, we published an extensive research driven [blog
series](https://f-droid.org/2025/08/04/strengthening-f-droids-legal-resilience-introducing-the-research-series.html)
addressing issues many FOSS projects quietly struggle with, including
how to handle [legal takedown
requests](https://f-droid.org/2025/09/10/how-foss-projects-handle-legal-takedown-requests.html),
how to respond when authorities [request user or project
information](https://f-droid.org/2025/10/07/when-authorities-come-knocking-how-to-handle-requests-for-information.html),
[jurisdiction, liability, and legal entity
considerations](https://f-droid.org/2025/08/20/knowing-where-you-stand-jurisdiction-legal-entities-and-liability-in-foss.html)  
and how regulatory frameworks like the [Digital Markets Act, Digital
Services Act, Online Safety
Act,](https://f-droid.org/2025/10/21/navigating-the-digital-markets-act-digital-services-act-and-the-online-safety-act.html)
and Google’s developer verification requirements affect independent app
distribution.

Our
[work](https://f-droid.org/2025/09/29/google-developer-registration-decree.html)
on Google’s developer verification
[requirements](https://developer.android.com/developer-verification)
highlighted how policy and platform changes can create new barriers for
developers and app stores. We [engaged
publicly](https://f-droid.org/2025/09/22/google-developer-verification-policy-and-the-dma.html)
and [constructively](https://f-droid.org/2025/10/28/sideloading.html)
on this issue, helping surface concerns around access, proportionality,
and unintended consequences. We will continue to address this issue
during a main track presentation at FOSDEM in 2026.

We also participated in [DMA related workshops and
events](https://f-droid.org/2025/09/18/ec-dma-compliance-workshops.html),
contributing the perspective of a long running, community governed app
distribution platform. Our goal is not simply compliance, but ensuring
regulation does not reinforce gatekeeping or undermine independent,
privacy respecting alternatives.

This work matters because policy decisions made today shape the
ecosystem for years to come.

#### FLOSS Fund Recognition and Community Sustainability

In 2025, F-Droid was [honoured to be
selected](https://floss.fund/blog/second-tranche-2025-anniversary/) as a
FLOSS/fund recipient. [FLOSS/fund](https://floss.fund/) recognizes that
much of the modern technological landscape and even the internet itself
is built by individuals and communities in the form of free and open
source software.

They do this not only by pledging $1 million a year to FOSS projects,
but by creating a [donation
registry](https://dir.floss.fund/browse/projects) called
[funding.json](https://fundingjson.org/) where FOSS projects can easily
communicate their projects and financial needs, making it easier for
donors to find the projects they love and show support.

We will be using the funds we received to embed the funding.json into
the F-Droid app submission process, so new apps will have the option to
be featured in the FLOSS Fund directory. Funding will also be used to
improve our donation campaign and fundraising efforts in general, making
F-Droid more financially sustainable long term.

### Looking Ahead to 2026

Plans include participating in FOSDEM in Brussels, hosting a booth there
to engage with participants, co-organizing the FOSS on Mobile developer
room, [presenting](https://fosdem.org/2026/schedule/event/YRVGCK-the_funding_gap_in_foss_what_we_learned_and_how_to_close_it/) at the Funding FOSS developer room and presenting our
[main track presentation](https://fosdem.org/2026/schedule/event/TYZH97-fear-loathing-app-stores/) on Google’s developer verification requirements,
We will continue to contribute to the Mobifree project, move our
deliverables outlined in the OTF FOSS sustainability fund forward, and
continue improving the client, website, server and other core
infrastructure, working to make F-Droid better and easier to onboard new
users.

To everyone who has donated to F-Droid over the years, and especially to
those who supported us in 2025: thank you. Your support keeps F-Droid
independent, privacy respecting, and accountable to its community.

F-Droid has shown for 15 years that app distribution can be transparent,
privacy respecting, and accountable. In 2025, we strengthened that
foundation. In 2026, we will continue to build for the future of FOSS.
