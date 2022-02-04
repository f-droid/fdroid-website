---
layout: post
title: Decentralizing Distribution
author: eighthave
---

Guardian Project has been awarded a grant from the [Filecoin Foundation for the Decentralized Web (FFDW)](https://www.ffdweb.org/guardian-project-annoucement) to work on decentralizing veracity and distribution (DVD).  FFDW’s Mission is to “ensure the permanent preservation of humanity’s most important information by stewarding the development of open source software and open protocols for decentralized data storage and retrieval networks.”  Filecoin is built on top of IPFS, which is "[a distributed system for storing and accessing files](https://docs.ipfs.io/concepts/what-is-ipfs/)".  The distribution component of the FFTW-DVD project is focused on improving F-Droid's free, open, and decentralized mobile app ecosystem.  On top of the flagship unified experience offered by this website and the F-Droid official app, F-Droid provides all the pieces for anyone to create, build, remix, publish, reproduce, redistribute and review mobile apps.

This is important to F-Droid users because it means that they are not locked into F-Droid as the monopoly app provider.  The F-Droid community needs to stay responsive to its users because it is possible to fork all of F-Droid (okay, except for the signing keys 🚫Ψ📝🔑😉).  Decentralization is also important because each user has specific needs and wishes that potentially conflict with other users.  Many want only free software, but others are willing to compromise in key places, and still others have strong privacy needs that conflict with other users' favorite features.  Decentralized app repositories provide users that flexibility without having to move away from the main F-Droid infrastructure.

We share the concerns about the walled garden approach to app stores. While their design may have been driven out of concern for security and simplicity, they have become a source of unbridled control, censorship and surveillance.  Smartphones are the primary computer for most and apps are the central mobile tool.  Centralized, locked down phones keep the real power of modern computing needlessly out of reach of most of the world's population.  The FFDW-DVD project will push F-Droid forward towards realizing full support for customization, curation, mirroring, censorship circumvention, and peer-to-peer sharing.  We can provide a more free and less fragile solution for the sharing of capability and knowledge to all.  On top of that, this project will give us focused time to work on making our processes run more efficiently and reliably.

IPFS and Filecoin are central to this mission.  IPFS has the potential to provide the plumbing for the entire F-Droid ecosystem.  It is a decentralized filesystem where files are accessible by their [hash](https://docs.ipfs.io/concepts/hashing/) compiled into a [Content Identifier (CID)](https://docs.ipfs.io/concepts/content-addressing/).  That means the unique signature of each file can be used to fetch that file from IPFS, no matter where it is actually stored.  It can be stored on some server farm or the other smartphone next to you when on a mountain top.  If the IPFS storage is reachable and contains the CID you need, it can be retrieved.  Internet is not required.  Additionally, if a file is important to you, you can "[pin](https://docs.ipfs.io/how-to/pin-files/)" it in your own IPFS storage or pay someone else to do it using Filecoin.  As long as someone is interested in having a file publicly available, it can be maintained in IPFS, even if the original creator has taken it down.

IPFS is working now, and services are using it, including [archive.org](https://blog.archive.org/2021/04/01/filecoin-foundation-grants-50000-fil-to-the-internet-archive/).  But there is much work to be done before it really can replace current web hosting and file distribution methods.  That means we will integrate IPFS in a hybrid approach, and we are already reporting our experiences upstream to help improve IPFS.  F-Droid already supports repositories and mirrors, and IPFS will plug right into those channels.  This gives the F-Droid ecosystem another layer of resiliency and flexibility.

Since the "decentralized web" includes all sorts of things, it is important to also mention things that we will [not](https://www.theregister.com/2021/12/06/the_dark_equation_of_harm/) be doing with this grant.  We are not looking at NFTs, blockchain, DAOs, smart contracts or related aspects of "[Web3](https://en.wikipedia.org/wiki/Web3)".


## Funded work

This work is focused on strengthening F-Droid foundations while enabling repositories to be hosted on decentralized storage, while spreading our platform as a viable alternative for all kinds of users and organizations.

* Break out and overhaul core client logic around publishing and consuming repositories.
* Make client logic into libraries to make it easy to embed repositories in any app that needs it.
* Add support for mirroring repositories onto both IPFS and Filecoin.
* Add support in F-Droid client to use mirrors and repositories hosted on IPFS and Filecoin.
* Improve F-Droid “white labeling”.
* Enhance F-Droid client’s existing “nearby” and “app swap” capabilities, including utilizing libp2p-based communication.
* Improve the capability and usability of publishing and distributing multimedia content (documents, presentations, photos, videos, map files, and more).
* Update F-Droid’s RepoMaker tool (for easy “point and click” curation and publishing of app repos) and add support for IPFS publishing.
* Expand access to F-Droid repositories to non-Android devices and the mobile web (progressive web apps, content).
* Set up a full archive of the f-droid.org repository on IPFS.
* Expand outreach and assistance to software developers, media organization, tech companies and more to promote adoption of the F-Droid platform for their software, content and devices (example: Mozilla could easily run a Mozilla app store that includes all the Mozilla channels: releases, nightlies, etc.  They could also include a curated collection of reproducibly built apps that Mozilla approves of.  Someone who trusts Mozilla can then easily choose to only have access to the Mozilla-curated app store)


You can follow the work funded under this grant by checking the `FFDW-DVD` label on [issues](https://gitlab.com/groups/fdroid/-/issues?scope=all&state=opened&label_name[]=FFDW-DVD) and [merge requests](https://gitlab.com/groups/fdroid/-/merge_requests?scope=all&state=opened&label_name[]=FFDW-DVD) in GitLab.

Our first priority is splitting out the core client pieces as standalone
libraries. We will take this opportunity to modernize the index format and
ensure it works well with IPFS.  That effort is tracked using the `index-v2` label on [issues](https://gitlab.com/groups/fdroid/-/issues?scope=all&state=opened&label_name[]=index-v2) and [merge requests](https://gitlab.com/groups/fdroid/-/merge_requests?scope=all&state=opened&label_name[]=index-v2).
