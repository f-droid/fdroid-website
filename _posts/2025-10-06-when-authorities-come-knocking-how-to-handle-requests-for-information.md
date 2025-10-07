---
title: When Authorities Come Knocking - How to Handle Requests for Information
author: F-Droid
layout: post
---

## Introduction

In the previous article in this series, we examined how FOSS projects handle legal takedown requests. However another category of legal risk exists, one that’s often more sensitive and less visible: government requests for user or developer data.

These requests can take many forms, from formal court orders and subpoenas, to vague emails from law enforcement or regulatory bodies. For projects that host apps, distribute binaries, or maintain logs, the question becomes: What data do you have, and what will you do if someone asks for it?

## What Kind of Requests Are We Talking About?

Authority requests may include:

* Personal identifying information about app developers or maintainers
* Access to user metadata, such as IP logs, download histories, or credit card information
* Identification of people associated with specific content or behavior (e.g. contributors to controversial apps)
* Demands to preserve data for later collection

Many FOSS projects don’t consider themselves “platforms” and may not collect or store personal data at all. But that doesn’t always stop authorities from asking.

## Common Themes from the Interviews

Across the conversations we had with FOSS nonprofits, legal experts, and infrastructure maintainers, a few core principles emerged:

### 1. Minimize What You Store

Several interviewees emphasized that the best way to avoid compliance risk is [not to have the data in the first place](https://foundation.wikimedia.org/wiki/Legal:Wikimedia_Foundation_Requests_for_User_Information_Procedures_and_Guidelines). This includes:

* Not logging user activity unless necessary for security or performance
* Avoiding retaining of contributor IP addresses, registration data, or device identifiers
* Using privacy-first analytics tools or no analytics at all

Think of it this way: every field you store is a risk. Don’t collect it if you don’t want to hand it over.


### 2. Separate Infrastructure and Individuals

A number of organizations recommended limiting the exposure of individual contributors by:

* Using role accounts or pseudonyms for public-facing contributions
* Ensuring domain registrations and legal contacts are held by a legal entity not individuals
* Use a fiscal host like [Open Collective](https://opencollective.com/) or [LiberaPay](https://liberapay.com/) to accept donations
* Avoiding publishing contributor identities in places that can be scraped 

Additional precautions include having individual conversations even pseudonymously, with contributors who are operating in known high-risk regions, to explain potential risks.

## Transparency and Silence

Unlike takedown requests, authority demands for user or contributor data often come with [gag orders](https://calyxinstitute.org/about/press/2010-merrill-speaks-at-27th-CCC-berlin) or [implicit secrecy requirements](https://indiankanoon.org/doc/31135472/). In some countries, we were told it is even illegal to acknowledge receipt of a request. That makes transparency reporting difficult.

Still, some projects do what they can:

* Publishing [aggregate data](https://transparency-archive.wikimedia.org/content.html) about the number and type of requests received
* Stating publicly what kind of data they don’t retain
* Including legal process [guidelines](https://github.com/github/transparency/tree/main/data/requests_to_disclose_user_information) in published policies (e.g., “All requests must be submitted via court order in our jurisdiction”)

## What F-Droid Is Doing

As part of this project, F-Droid is:

* Reviewing all data collection and retention practices to ensure data minimization
* Updating contributor guidance to help reduce unnecessary exposure
* Working with pro bono experts to create jurisdiction-specific escalation paths
* Drafting a public-facing Legal Process Policy, outlining how requests must be submitted, who handles them, and what kinds of data are available (if any)

We’re seeking to align with best practices from the FOSS and digital rights community balancing security, privacy, and our commitment to transparency.

## Final Thoughts

Government requests for user or developer data reflect a growing trend of legal pressure on FOSS projects. And while these requests can’t always be avoided, proactive safeguards like strict data retention policies and transparency reporting can significantly mitigate risks.

Key takeaways? Don’t collect more than you need. Don’t handle requests informally. And don’t let individuals face the pressure alone.

In our next post, we’ll explore three regional-specific regulations, the EU’s Digital Markets Act and Digital Security Act and the UK’s Online Safety Act.

## Legal Disclaimer

The content provided in this article is for informational purposes only and does not constitute legal advice. While we strive to provide accurate and up-to-date information, F-Droid makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, or suitability of the information contained herein.

F-Droid is not a law firm and does not offer legal services. Any reliance you place on the information provided is strictly at your own risk. If you have questions about legal obligations, rights, or compliance, we strongly recommend consulting a qualified legal professional familiar with your jurisdiction.

F-Droid and its contributors disclaim all liability for any loss or damage arising from the use or misuse of this content.
