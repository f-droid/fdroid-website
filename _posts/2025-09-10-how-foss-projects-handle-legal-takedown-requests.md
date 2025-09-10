---
title: How FOSS Projects Handle Legal Takedown Requests
author: F-Droid
layout: post
---

When a legal takedown request arrives, whether it’s about copyright, censorship, privacy, or something more vague, how a Free and Open Source Software (FOSS) project responds can make all the difference.

Handled well, a takedown request can be a manageable administrative step. Handled poorly, it can cause panic, disrupt infrastructure, or even put contributors at legal risk.

As part of our legal resilience research, we spoke with a range of legal experts, software freedom advocates, and maintainers of mature FOSS infrastructure to understand how others manage these moments. In this article, we share what we learned, and how F-Droid is incorporating these lessons into its own approach.

## A Pattern Emerges

Despite differences in jurisdiction, size, and mission, a few common themes from our research appeared in how other projects handle takedown requests:

### 1. Don’t Be a Soft Target

Legal threats often follow the path of least resistance. FOSS projects that publish a formal takedown policy, require legal submissions through specific channels, and insist on a valid legal basis are much less likely to receive, or comply with, vague or harassing demands. 

One FOSS organization, for example, requires all legal correspondence to be submitted by postal mail in the national language and citing local law. Most complaints evaporate once asked to comply.

### 2. Creating a transparent and documented process

Several digital rights organizations advised setting up structured response steps:

* Require submissions to a dedicated legal@ or abuse@ email.
* Insist on full documentation: legal basis, jurisdiction, evidence of the infringement and identity of the complainant.
* Review for sufficiency, proportionality, and standing before acting.

This creates proper documentation to process valid claims, while protecting projects from illegitimate or unfounded requests. 

### 3. Use Jurisdiction Strategically

Projects based in civil law jurisdictions, particularly in Europe, are often better positioned to deflect legal demands from foreign entities. Several organizations emphasized that complying with vague or extrajudicial requests, especially those originating outside your jurisdiction, can increase risk unnecessarily. Instead, they recommended requiring a valid legal basis grounded in the project's home country. Formal legal processes, such as court orders or official government channels, were seen as the appropriate threshold, not informal emails or unverifiable demands.

## Notification and Appeals: Fairness and Transparency

All of the projects we consulted emphasized the importance of notifying developers whose apps are being targeted, informing them (if possible) of the seriousness of the claim, and the proposed strategy F-Droid is taking to handle the claim. 

If a threat is deemed to be valid and a developer’s content is flagged for takedown:

* The developer or maintainer is informed, unless prohibited by law (gag orders).
* A window for response (commonly 14 days) is offered, unless unfeasible due to seriousness and time restraints of the request itself
* If the developer disputes the claim and provides supporting information (e.g. license, public domain status, fair use justification), the claim is reviewed.
* If the claim is upheld, the content is removed, but always with an internal record and opportunity to appeal.

This mirrors principles embedded in international norms (like the [Manila Principles](https://manilaprinciples.org/principles.html) and [GitHub’s DMCA takedown policy](https://docs.github.com/en/site-policy/content-removal-policies/dmca-takedown-policy)) and avoids overcompliance with weak or abusive claims.

## Transparency, Censorship, and What You Can (Legally) Publish

Takedown requests occupy a complex space between legal enforcement and censorship. While some are legitimate claims, like copyright violations or privacy breaches, others are vague, politically motivated, or intended to silence dissent. For FOSS projects that have a global user base, it’s not always obvious how to respond. Complying too quickly can reinforce censorship practices; resisting without process can lead to full website shut downs, [domain names being taken away](https://dn.org/government-influence-on-dns-through-domain-seizures-and-takedowns/) (as in the US) or [large and costly legal battles](https://calyxinstitute.org/about/press/2010-merrill-speaks-at-27th-CCC-berlin).

One strategy that helps balance this tension is radical transparency. Several projects we spoke with emphasized the importance of documenting what actions were taken and why, not just for accountability, but as a form of resistance. A well-known example is GitHub’s DMCA takedown policy (as of July 2025), which mandates compliance with valid takedown requests, but also posts each one publicly in their [github/dmca repository](https://github.com/github/dmca). The result: potential abusers know their requests will face public scrutiny, which acts as a deterrent.

However, not all jurisdictions allow this kind of transparency. In India, for example, we were informed that it is often illegal to disclose that you have received a government request, even to the developer of the affected app. In contrast, in Russia, takedown requests can often be [legally posted](https://reestr.rublacklist.net/en/), though by doing so you may be putting yourself at risk for retaliation, additional takedown requests and legal troubles.

With that in mind, some best practices for FOSS projects include:

* Publishing biannual transparency reports, even if redacted or aggregated.
* Maintaining an internal log of all takedown activity, with public disclosure where legally possible.
* Explaining the general reasons for content removals, who made the request, under what law, and what action was taken, unless legally prohibited.
* Being explicit about what cannot be shared, and why.

Transparency won’t prevent all forms of censorship, but it can slow them down, raise awareness, and provide a record that strengthens the broader FOSS ecosystem.

## What We're Doing at F-Droid

F-Droid is revising its own takedown policy, informed by:

* Dutch law and EU regulations
* The structural support provided by The Commons Conservancy
* Practical lessons from long-standing FOSS organizations

Our draft process includes:

1.	Written takedown submission request to legal@f-droid.org including the required information.:

*	Identify the specific material in question (e.g. app name)
*	Include valid legal basis under applicable jurisdiction (e.g. copyright law, court order statutory basis)
*	Indicate jurisdiction in which the legal basis is claimed to apply
*	Include sufficient evidence of the alleged infringement (e.g. copyright certificate, ownership declaration)
*	Clearly state that the complaintant is authorized to act on behalf of the rights holder
*	Include full contact details and a verifiable identity (subject to exceptions, such as gag orders or whistleblower protection)

2.	Verification of jurisdiction and legal basis, including evidence
3.	Developer notification and appeal procedures
4.	Rejection of requests lacking documentation or legal authority may be rejected or ignored
5.	Biannual transparency reports and public tracking of takedown requests

We're also working to improve contributor education about potential exposure when contributing to F-Droid, document internal escalation paths, and ensure consistent handling of international claims.

## Final Thoughts

Takedown requests are not going away in fact, they're becoming more frequent and more complex. But FOSS projects don’t have to face them unprepared.

By building processes, establishing clear jurisdiction, and protecting individuals through structure and policy, we can handle these challenges with the seriousness they deserve without letting them derail our mission.

## Legal Disclaimer

The content provided in this article is for informational purposes only and does not constitute legal advice. While we strive to provide accurate and up-to-date information, F-Droid makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, or suitability of the information contained herein.

F-Droid is not a law firm and does not offer legal services. Any reliance you place on the information provided is strictly at your own risk. If you have questions about legal obligations, rights, or compliance, we strongly recommend consulting a qualified legal professional familiar with your jurisdiction.

F-Droid and its contributors disclaim all liability for any loss or damage arising from the use or misuse of this content.
