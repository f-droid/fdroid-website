---
title: Understanding GDPR in a Privacy-First Project
author: F-Droid
layout: post
---

## Introduction

In our last article, we explored how laws like the UK’s Online Safety Act, the EU’s Digital Services Act and Digital Markets Act affect small, non-commercial platforms like F-Droid. This week, we’re turning our attention to another major legal framework that governs how digital services operate in the EU: the General Data Protection Regulation (GDPR).
The [GDPR](https://gdpr.eu/what-is-gdpr/) is one of the world’s most far-reaching data protection laws. It applies to any project or organisation that collects or processes personal data from people in the EU, [regardless of where the project is based](https://gdpr.eu/companies-outside-of-europe/). That makes it highly relevant to open source projects like F-Droid, even if we don’t think of ourselves as processing personal data in the traditional sense.

The GDPR grants individuals rights over their personal data, including the right to access, correct, delete and restrict processing. Organisations must process personal data lawfully, transparently, and for specific purposes. These organisations must implement appropriate security measures to protect personal data and report data breaches within 72 hours. Also worth mentioning are the fines for violating GDPR regulations, which can be [very high](https://gdpr.eu/fines/).

The GDPR operates under 7 core data protection principles which are worth noting because in doing so, it becomes clear that F-Droid’s policies and infrastructure are very much in line with the GDPR principles. Here are the principles according to their website:

“Lawfulness, fairness and transparency — Processing must be lawful, fair, and transparent to the data subject.

Purpose limitation — You must process data for the legitimate purposes specified explicitly to the data subject when you collected it.

Data minimisation — You should collect and process only as much data as absolutely necessary for the purposes specified.

Accuracy — You must keep personal data accurate and up to date.

Storage limitation — You may only store personally identifying data for as long as necessary for the specified purpose.

Integrity and confidentiality — Processing must be done in such a way as to ensure appropriate security, integrity, and confidentiality (e.g. by using encryption).

Accountability — The data controller is responsible for being able to demonstrate GDPR compliance with all of these principles.”

Here is a [link](https://gdpr.eu/tag/gdpr/) to the original regulation in case you are curious. 

Ok, now that we have had a quick crash course in GDPR, the rest of the article will explore how GDPR applies to us, where we have responsibilities, and why F-Droid’s minimal-data, privacy-first approach keeps us in strong alignment with the regulation’s intent.

## Does GDPR even apply to us?

Since we have European users and contributors, GDPR would apply in our case. However if you look under the hood at how GDPR instructs us to process personal data, you quickly see that many aspects of the regulations don’t in fact apply due to the nature of our privacy-focused, security-first practices. 

**We don’t have accounts.** To access our website, download the main F-Droid client or to download apps within the main repo, there is no user account.

**We don’t ask people to provide their data.** The only kind of identifying data we do have access to is IP addresses of all requests to the server, which are deleted within 90 days. And then for registered users in the forum, we retain IP addresses associated with their posts for no more than 5 years.

**We don’t serve ads.** Since our mission is not to make profit, but rather to provide people with access to FOSS tools and apps, we don’t use any ads or ad tracking in our platform or tools, and we do not monitor or track users for the purpose of selling data or generating profit. If an app in our repo does contain ads or tracking features, we label it with the applicable [anti-feature](https://f-droid.org/docs/Anti-Features/), informing users of how their data is being used.

Most of the time, we don’t even know who our users or even our contributors are. That’s [by design](https://f-droid.org/2022/02/28/no-user-accounts-by-design.html) and it puts us in a much stronger position than most projects when it comes to compliance.
But the GDPR doesn’t only apply to companies that want your data. It applies to any platform that handles personal data, even IP addresses, device logs, or contact forms. So while our [overall exposure is low](https://f-droid.org/2024/03/08/privacy-design-of-fdroid.org-webservers.html), we still need to examine a few specific areas to make sure we’re compliant and prepared.

## Where GDPR Might Apply to F-Droid

While F-Droid does not directly collect personal data through user accounts or telemetry, there are a few edge cases where GDPR considerations arise:
* **Web logs**: Our web servers may log user IP addresses for short periods as part of standard server operations. While these logs are not stored long-term or used to profile users, IP addresses are still considered personal data under GDPR.
* **Issue trackers**: Contributors who open issues or submit merge requests on GitLab may include personally identifiable information (names, emails, etc.). We don’t require this, but it does make us accountable, see section below.
* **Crash reports and external apps**: Some apps distributed via F-Droid (though not built by us) may collect personal data. While this puts the onus on app maintainers, as a distributor, we need to ensure (to the best of our ability) that apps comply with our anti-feature policies and flag trackers when we detect them.
* **Legal requests**: In the unlikely event we receive a lawful data request (for instance, tied to server logs), we must be able to evaluate it under GDPR, including user rights like notification and appeal, unless blocked by other legal regimes (such as gag orders).
* **F-Droid Forum**: To participate in our forum, you need an account with email verification. However this is done via our hosted Discourse instance which is GDPR compliant

## Gitlab, GitHub and F-Droid

Like many open source projects, we coordinate our development on platforms like GitHub and GitLab. While F-Droid does not operate these services, we do use them as part of our contributor workflow, and that brings a few [GDPR considerations into scope](https://www.gdpr-advisor.com/how-gdpr-impacts-data-sharing-in-open-source-software-communities/).

These platforms store public contributor data, including:

* Names and email addresses included in Git commits
* Comments and metadata from issues and merge requests
* Contributor usernames and activity logs

This information is visible by design and contributes to the transparency of free and open source development. However, under GDPR, it can also be considered personal data. GitHub and Gitlab are aware of GDPR and state how they comply with the regulation ([GitHub policy](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement#lawful-bases-for-processing-personal-data-applicable-to-eea-and-uk-end-users), [GitLab Policy](https://about.gitlab.com/privacy/).

**“But is F-Droid responsible for the contributor data stored in GitLab and GitHub?”**

Yes and no. It is important to keep two GDPR definitions in mind - controller and processor. 

Data Controller is the entity that determines the purpose and means of processing personal data.
Data Processor is the entity that processes personal data on behalf of the controller, under their instruction.

With that in mind, lets look at how F-Droid uses GitLab and GitHub in our contributor workflow. We use these platforms to:

* host code and issue trackers
* manage merge requests and CI
* collaborate with contributors

In this case, GitHub/GitLab are the controllers for the personal data they collect directly from users (account creation, IP logs, platform analytics, etc.). They determine how and why that data is collected and stored. Therefore they are responsible for GDPR compliance in that scope. F-Droid is not the controller or processor for that user data, since it does not control the infrastructure or determine how GitHub/GitLab handle user accounts.

However, when contributors interact with the F-Droid project itself, for example, submitting a merge request, posting a comment in F-Droid’s tracker, having their name appear in F-Droid’s published Git history, F-Droid could be seen as a joint controller for those specific public contributions, because we set project governance and contribution expectations, and decide whether and how those contributions are merged, published, or reused.

This means our GDPR obligations are light, but not zero. Here’s how we minimise our obligations and ensure compliance where required:

* We do not extract or reprocess Git contributor data for other uses (e.g., for analytics or marketing).
* We do not require users to disclose more than necessary, and we support pseudonymous contributions.
* In the rare case that a contributor requests removal of personal data, we will review the request carefully and explore options, though full deletion of Git history is often infeasible.

Ultimately, contributing to F-Droid means you are contributing to a FOSS project that operates in the open and in a transparent way. However, we believe our minimal data collection and privacy-focused infrastructure is consistent with both GDPR’s intent and open source values as long as it’s done transparently and responsibly.

## What We’re Doing Now

To ensure we stay aligned with GDPR principles, here are the practices and improvements we’ve implemented or are considering:

1. Data minimisation: We intentionally avoid collecting user data unless it’s strictly necessary. Our infrastructure is designed around this principle.
2. Server-side privacy: We’ve documented how our web infrastructure works and how logs are handled with user privacy in mind. Read more [here](https://f-droid.org/2024/03/08/privacy-design-of-fdroid.org-webservers.html).
3. App anti-features: We flag apps that include advertising or analytics libraries so users can make informed choices. This indirectly supports GDPR’s transparency goals even if the apps are made by third parties.
4. Contributor awareness: We are publishing this article to inform our contributors and community of their rights and create more transparency around the type of data we collect and what it means to contribute to F-Droid via GitHub or GitLab.
5. Privacy policy: While F-Droid itself doesn’t collect much, we’re working to clarify our public-facing privacy statement both for transparency and to help users understand the scope and limits of our responsibilities.

## What GDPR Doesn’t Require of Us

Unlike commercial services, we believe F-Droid is not required to:

1. Appoint a Data Protection Officer (DPO). We are not a public authority (government organisation), we don’t systematically monitor subjects at large scale, we don't process data from categories in [Article 9](https://gdpr.eu/article-9-processing-special-categories-of-personal-data-prohibited/) or [10](https://gdpr.eu/article-10-personal-data-relating-to-criminal-convictions-and-offences/) of the GDPR.

2. Run formal [Data Protection Impact Assessments (DPIAs)](https://gdpr.eu/article-35-impact-assessment/). We are not required to run a formal DPIA because the type of data we collect is not considered high risk to the freedoms of our data subjects. Although it is something we are exploring, just for transparency sake and will publish when it has been conducted. Spoiler alert, we are already compliant.

3. Maintain detailed processing registers. We are exempt from the requirements of Article 30(1) and 30(2) of the GDPR due to the conditions outlined in [Article 30(5)](https://gdpr.eu/article-30-records-of-processing-activities/). This exemption applies because F-Droid operates with a relatively small number of core contributors, and the limited data we do collect such as short-lived IP logs does not pose a risk to individuals’ rights or freedoms, nor does it involve any special categories of sensitive personal data, such as religious beliefs or health information.

4. Offer account-based access to personal data. Because we don’t ask users to sign up to view the website or download the F-Droid main repository, there is no information a data subject could request from us. We simply don’t process data in a way that allows for identification because we don’t retail long-term IP logs, we don’t track user activity across sessions or devices and the data we may temporarily see, such as an IP address in a server long, is not associated with a known user ([Article 11(1)](https://gdpr.eu/article-11-what-personal-data-can-a-controller-process-without-identification/)). The exception here is the F-Droid forum, which, as we have already stated, is GDPR compliant.

We could go on, and more in depth on each article in the regulation, however we can wrap it up here for the sake of the article by saying we are generally not required to comply with these GDPR requirements because we don’t operate at the scale, structure, or data collection level that those obligations target.

However even without these requirements, we follow GDPR’s core principle, especially data minimisation, purpose limitation, and security by design.

## Final Thoughts

The GDPR was built to rein in surveillance capitalism and restore control over personal data. While F-Droid was never in that game to begin with, it still benefits from understanding the law and showing how we align with it.
By keeping our data collection low, being transparent about what we do and don’t log, and empowering users to choose privacy-respecting apps, we believe F-Droid is not only compliant, we’re helping prove that privacy-first platforms can thrive.

## Legal Disclaimer

The content provided in this article is for informational purposes only and does not constitute legal advice. While we strive to provide accurate and up-to-date information, F-Droid makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, or suitability of the information contained herein.

F-Droid is not a law firm and does not offer legal services. Any reliance you place on the information provided is strictly at your own risk. If you have questions about legal obligations, rights, or compliance, we strongly recommend consulting a qualified legal professional familiar with your jurisdiction.
