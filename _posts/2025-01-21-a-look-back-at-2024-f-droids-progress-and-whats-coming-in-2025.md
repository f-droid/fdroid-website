---
title: "A Look Back at 2024: F-Droid's Progress and What’s Coming in 2025"
layout: post
author: HStill
---

With 2024 now behind us, we wanted to take a moment to reflect on the growth and achievements we accomplished as a community last year, and celebrate the incredible support we received from the FOSS community throughout the journey.

This year has been a milestone for us, with significant strides in decentralizing app distribution, expanding the F-Droid ecosystem, and solidifying our infrastructure. All of these advancements were made possible thanks to donations, grants, our volunteers and regular contributors. So thank you again to everyone who helped make 2024 another great year for F-Droid. Now let's take a closer look at what we accomplished.

## A Review of Key Accomplishments in 2024

### Decentralizing App Distribution: A Core Focus

One of the most important initiatives we worked on in 2024 was the continued development of our app decentralization efforts. Our aim is to make F-Droid a more robust and accessible platform, making further in-roads into the hold Big Tech currently has on app distribution.  Building on the [work we started in 2022](https://f-droid.org/2022/02/05/decentralizing-distribution.html), as a part of the [Filecoin Foundation for the Decentralized Web grant](https://www.ffdweb.org/blog/guardian-project-annoucement/), we continued to make substantial progress this year in providing developers and end-users with more options to distribute their apps through a decentralized, equitable and privacy-oriented process. The goal for this project is to enable individuals and organizations to mirror and distribute F-Droid apps in a community-driven fashion, reducing reliance on centralized services. This work ties into a larger vision of creating a truly open-source ecosystem for Android apps that is not governed by proprietary companies. 

In 2024 we completed the following infrastructure upgrades:

* Broke out and overhauled core client logic around publishing and consuming repositories.

* Made client logic into [libraries](https://f-droid.org/2023/05/02/three-client-libraries.html) to make it easy to embed repositories in any app that needs it.

* Added support for mirroring repositories onto both IPFS and Filecoin.

* Added support in F-Droid client to use mirrors and repositories hosted on IPFS and Filecoin.

* Improved F-Droid client “[whitelabel builds](https://f-droid.org/docs/Whitelabel_Builds/)”.

* Enhanced F-Droid client’s existing “nearby” and “app swap” capabilities.

* Updated F-Droid’s Repomaker tool (for easy “point and click” curation and publishing of app repos) and add support for IPFS publishing.

* Supported iOS apps and progressive web apps (PWA) as packages that can be shipped via repositories.

2024 marked the end of this grant period, however the tools, features and policies established within the scope of the grant, will continue to be developed thanks to donations and other funders who are committed to further decentralizing app distribution.

## Expanding the F-Droid Ecosystem: Repomaker and Mobifree

Another key project we [started](https://f-droid.org/2024/05/24/mobifree.html) in 2024 was the further exploration and expansion of tools within the F-Droid ecosystem. Thanks to a major grant from [EU Horizon Europe](https://cordis.europa.eu/project/id/101135795), we were able to deepen our focus on tools like [Repomaker](https://f-droid.org/repomaker/), which helps developers create their own F-Droid-compatible repositories. This tool is crucial for maintaining and growing the diverse range of apps available on F-Droid, and its expansion will support more developers who wish to contribute to the platform.

[Mobifree](https://mobifree.org/) is an initiative that aims to provide a free, open-source, and decentralized alternative to traditional mobile app stores. It focuses on the freedom of choice, privacy, and user empowerment. Our contributions to this project will help strengthen the ties between F-Droid and other decentralized app distribution systems, ensuring that we remain a key player in the future of open-source mobile software.

Do you have your own project ideas for Mobifree?  You can apply for up to 50,000€ from [NLnet NGI Mobifree](https://nlnet.nl/mobifree/).  We can help you apply, just reach out via the [regular F-Droid channels](https://f-droid.org/about/#contact).

Key Contributions in 2024:

* User research to understand app developer distribution workflows, compensation models, index preferences and APK metadata.
* Built on existing Fastlane tooling to further automate the app package and upload the process to F-Droid.
* Repomaker feature development made the repo creation and distribution process easier for non-tech users, non-profit and humanitarian organizations.
* Created a central registry of all DAPPER compatible repos and API for app stores like Murena's [App Lounge](https://doc.e.foundation/app-lounge-main) to pull in compatible repos and further decentralize app distribution process.

In 2025, we continue to contribute to the Mobifree project, getting our tools, apps and software ready for pilot testing this spring. From there, we will continue to improve the software based on user-testing feedback, ultimately making the tools available for the general public to use and enjoy.

### F-Droid Community Engagement

None of this would be possible without the incredible contributions from the FOSS community. In 2024, we saw a substantial increase in the number of contributions to F-Droid. From bug fixes and app updates to new apps being added to the store, our community of developers, testers, and contributors have been pivotal in keeping F-Droid running smoothly.

Here are some statistics that highlight the community’s impact this year:

* App Updates: Over 7205 app updates were made, keeping the app catalog fresh and secure.
* New Apps Added: We welcomed over 402 new apps to the F-Droid repository, further expanding the variety of open-source apps available to users.
* Archived Apps: 939 Apps were successfully archived.
* Packages per Hour: Approximately 2-3 packages were created every hour, without interruption. Between updated and new apps, F-Droid built apps over 7600 times. Since most modern apps are split per device architecture, this  means that each app version required multiple packages to be built, sometimes up to 4 packages for each app version. This increases the real number of builds by 2.5-3x. Putting it all together, that would equal between 2-3 packages created per hour, without interruption in 2024.

These numbers are a reflection of the dedication and passion of the F-Droid community. We are immensely grateful for each and every contributor who made these achievements possible.

## Looking Ahead in 2025

### New Team Members and Big Plans for 2025

As we look forward to 2025, we are excited to announce two key additions to the F-Droid team who will help us scale our efforts in the coming year. Hailey Still has joined us as a new project manager and UX designer. Hailey brings a diverse background of experience in managing complex projects and designing user-friendly and intuitive interfaces. Her expertise will continue to be instrumental in helping us secure new grant opportunities, streamline our operations and improve the user experience tools we work on.

We are also pleased to welcome Nzambi Kakusu as our new grant administrator. Nzambi will play a crucial role in helping us secure and manage funding for F-Droid's continued development. With her experience in grant management, Nzambi will help ensure that we can continue to sustain and grow the project in a way that aligns with our mission and values.

### OTF Grant and Infrastructure Work

In 2025 we are thrilled to begin working on a grant funded by the [Open Technology Fund](https://www.opentech.fund/funds/free-and-open-source-software-sustainability-fund/). This grant will help us maintain F-Droid and focus on critical infrastructure work that was often overlooked, due to lack of consistent funding in the past. We’ll be working on improving the resilience and security of our systems, ensuring that F-Droid continues to serve as a reliable, open-source app distribution platform for years to come. There will be an official announcement article coming soon.

## To Wrap it Up

As we continue to grow and evolve, we are committed to our mission of decentralizing app distribution, expanding the F-Droid ecosystem, and empowering users with open-source alternatives to proprietary software. With the support of our community, our volunteers, and our new team members, we are excited for what 2025 will bring.

Thank you for being part of the F-Droid journey!

We look forward to an exciting year ahead, and we invite you to continue supporting F-Droid through [contributions](https://f-droid.org/contribute/), [donations](https://f-droid.org/donate/), and [spreading the word](https://floss.social/@fdroidorg) about our mission. Let’s make 2025 another year of progress for the open-source community!
