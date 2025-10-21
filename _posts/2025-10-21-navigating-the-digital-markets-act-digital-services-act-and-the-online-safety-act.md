---
title: Navigating the Digital Markets Act, Digital Services Act and the Online Safety Act 
author: F-Droid
layout: post
---

## Introduction

In our previous article, we explored how Free and Open Source Software (FOSS) projects like F-Droid handle legal requests for user or developer data. In this post, we’re shifting focus to a broader and rapidly growing legal challenge: platform responsibility under laws like the [UK’s Online Safety Act (OSA)](https://www.gov.uk/government/publications/online-safety-act-explainer/online-safety-act-explainer), the [EU’s Digital Services Act (DSA)](https://commission.europa.eu/strategy-and-policy/priorities-2019-2024/europe-fit-digital-age/digital-services-act_en) and [Digital Markets Act (DMA)](https://commission.europa.eu/strategy-and-policy/priorities-2019-2024/europe-fit-digital-age/digital-markets-act-ensuring-fair-and-open-digital-markets_en). These frameworks redefine accountability for online platforms including FOSS ecosystems.

These laws govern how platforms handle content, transparency, and user protections. While they are designed primarily for large tech platforms, their broad definitions can sometimes pull in smaller FOSS projects, especially those that distribute software or host third-party content.

This article outlines how F-Droid fits into these legal frameworks, what our current obligations are, and how we’re reviewing our practices, to maintain legal resilience without compromising our core mission.

## Does This Even Matter?

When navigating laws like the UK’s Online Safety Act (OSA) and the EU’s Digital Services Act (DSA) and Digital Markets Act (DMA), one of the first and most important steps for any FOSS project is understanding: Does this apply to us? The OSA, DSA and DMA introduce complex requirements for content moderation, platform accountability, and user safety, but they are not one-size-fits-all. 

For the F-Droid app store, the answer is nuanced and reassuring. We are not considered a “very large online platform” (VLOP), don’t run user-to-user services, and we don’t process payments or track users. This makes our legal exposure far lower than platforms like Google Play or Apple’s App Store. Additionally [our Inclusion Policy](https://f-droid.org/docs/Inclusion_Policy/) and [Code Of Conduct](https://f-droid.org/docs/Code_of_Conduct/) exclude illegal, explicit, age-restricted, or harmful apps, such as gambling apps. 
Still, we are not entirely outside the scope. There are some responsibilities that remain, particularly around transparency, documentation, and process. Now let’s take a closer look at some specific European regulations.

## Understanding the UK Online Safety Act

The UK’s Online Safety Act, passed in 2023, places obligations on services that either (1) host user-to-user content, or (2) function as general-purpose search engines. Its goal is to reduce online harm, particularly illegal or abusive content, guided by [Ofcom](https://www.ofcom.org.uk/) as the lead regulator.

The F-Droid client does not meet either of those criteria:

* We do not host user accounts
* We do not function as a general-purpose search engine.

Furthermore, we have very few users in the UK, our infrastructure is not hosted in the UK, and we are legally governed from the Netherlands.

According to a legal review by a UK-based lawyer, the F-Droid service is likely out of scope for most of the Act’s requirements. However, we’re still taking several precautionary steps:

* Documenting our legal position on non-applicability
* Completing Ofcom’s optional [risk assessment tool](https://www.ofcom.org.uk/online-safety/illegal-and-harmful-content/check-how-to-comply-with-the-illegal-content-rules)
* Adding a reporting button in the client that links to GitLab issues (this gives a way for users to report content to us more easily)
* Clarifying and updating our Code of Conduct and Inclusion Policy

It is important to note that the F-Droid forum is one exception to this rule as it could be interpreted as a user-to-user service, where we do require email verification in order for people to participate in the forum. That being said, we are complying with the intention of the act in that we do not discuss illegal, harmful, or mature topics in the forum that would potentially be considered inappropriate for minors or require age verification, and as we mentioned above, the act falls outside F-Droid’s jurisdiction. 

Now let’s take a look at some EU regulations.

## Understanding the EU Digital Services Act 

Unlike the UK’s OSA, the EU Digital Services Act (DSA) applies to a broader range of services, including app directories and repositories like F-Droid, if they are accessible within the EU. The DSA introduces tiers of responsibility based on the size and function of the platform.

The F-Droid client does not meet any of these requirements:

* A for-profit organization, but instead a community-run platform
* Monetizing user data
* Functioning as a social media service
* Having more than 45 million users

This means we have fewer obligations than large commercial services, but it doesn’t mean we’re entirely excluded.

Under the DSA we still need to:

* Provide a way for users to flag content, which they can do so [here](https://gitlab.com/fdroid/fdroiddata/-/issues)
* Review (within a reasonable extent) whether any content we host (e.g. app metadata) could violate EU law, which is taken into consideration during our review process and inclusion policy
* Respond to takedown orders or court requests, which we do via our official channels outlined in the previous articles
* Publish limited [usage reports](https://digital-strategy.ec.europa.eu/en/library/dsa-guidance-requirement-publish-user-numbers), which is a part of our updated policy

## Content Regulation

As we assessed our obligations under the Online Safety Act and the Digital Services Act, we need to revisit a more sensitive area of content policy: how we handle Not Safe For Work (NSFW) content. With regulations increasingly policing mature content online, including calls for age verification, we are carefully re-evaluating what the NSFW anti-feature label means within F-Droid, how and if it should continue to be applied and how it intersects with censorship, freedom of expression, and legal compliance.

F-Droid does not and cannot perform age verification. That alone means we must be cautious about distributing apps that contain harmful or sexually explicit material, particularly when hosting them could put our infrastructure or contributors at risk. Our mission is to provide a safe and privacy-respecting way for people to access FOSS.

While this means not every FOSS app can be hosted on the main F-Droid repo, the goal is not to censor, but to protect the long-term sustainability of the project and its contributors. The vast majority of the world, including where many F-Droid contributors and users live, have strict pornography and gambling laws, as well as regulations restricting mature content. Even if we don’t want to be, we are accountable to certain regulations that meet at the intersection between censorship and safety. We need to keep this in mind, even if Dutch law (where our infrastructure is based) is far more permissive on some of these topics.

These decisions are never easy. They often involve interpreting blurry boundaries and confronting values that differ dramatically around the globe. We acknowledge that our approach might not be perfect yet, but it is grounded in principle: safety for users, safety for contributors, and staying focused on our core mission.

Going forward, we’ll continue to refine our inclusion policy and how we communicate it.  We are also reviewing the purpose of the NSFW Anti-Feature tag. These are enforced to reflect the regulatory realities and our commitment to transparency and user freedom. At the same time, we [support decentralization](https://f-droid.org/2022/11/23/why-curation-and-decentralization-is-better-than-millions-of-apps.html) so outside of the main F-Droid repo, everyone has the freedom to host their own repos however they want, and users can add additional apps to their F-Droid client on their device on their own terms.

## Understanding the EU Digital Markets Act

In addition to the Online Safety Act and Digital Services Act, the EU has also enacted the Digital Markets Act (DMA), which is focused on addressing the market power of large digital platforms that act as 'gatekeepers'. The DMA introduces strict requirements for how these gatekeepers treat users, business partners, and competitors.

F-Droid, however, does not fall under the scope of the DMA due to our size and the not-for-profit nature of our project. The law applies to companies with significant market impact, typically those with:

* More than €7.5 billion in annual EU revenue or €75 billion in market capitalization
* At least 45 million monthly active EU users
* A dominant intermediation role (this would apply in our case, if we could be considered a “gatekeeper” which we are not)

F-Droid is a nonprofit, community-run platform that doesn’t monetize user interactions, track user behavior, or control developer access through payment models. It’s also a significantly smaller platform in terms of reach and infrastructure.

While we’re not subject to DMA rules, we remain informed about their implications on the broader app ecosystem. In fact, F-Droid representatives have presented a counterweight to the Big Tech representatives present during Digital Markets Act proceedings.  Although the Digital Markets Act (DMA) is a powerful legal framework designed to rein in gatekeepers like Google and Apple, enforcing it in practice is challenging. Its effectiveness hinges on the ability to scrutinize highly technical compliance claims, something that often requires deep technical expertise, which lawmakers and regulators may lack. Reach out to us via e-mail to <tt>team at f-droid.org</tt> to explore how you can help hold Big Tech accountable. If you have relevant experience or are interested in supporting this effort; we’d love to hear from you.

We believe many of the DMA’s goals, such as preventing forced bundling, ensuring fair competition, and increasing transparency, are aligned with FOSS values. The DMA also means that regulators are creating a path to help F-Droid compete based on trustworthiness, rather than sticking to the old standards that only consider how much money consumers are charged. That said, we do not currently meet any criteria that would trigger DMA compliance obligations.

## Final Thoughts

Laws like the Online Safety Act, the Digital Services Act and the Digital Markets Act are designed with big tech in mind but their language can still pull smaller projects into view. Fortunately, F-Droid’s small scale, privacy-first infrastructure, commitment to transparency and fairness and strict inclusion policy already reduces the legal risks. We hope our approach will be useful for other FOSS projects as we all interpret emerging regulation in real world contexts.

By documenting our legal position and taking proportionate steps, we can remain transparent, safe, and resilient without compromising our mission: promoting the safe and secure distribution of FOSS apps.

In our next post, we’ll attempt to tackle the complex GDPR topic facing European companies and organizations, within the scope of F-Droid.

## Legal Disclaimer

The content provided in this article is for informational purposes only and does not constitute legal advice. While we strive to provide accurate and up-to-date information, F-Droid makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, or suitability of the information contained herein.

F-Droid is not a law firm and does not offer legal services. Any reliance you place on the information provided is strictly at your own risk. If you have questions about legal obligations, rights, or compliance, we strongly recommend consulting a qualified legal professional familiar with your jurisdiction.

F-Droid and its contributors disclaim all liability for any loss or damage arising from the use or misuse of this content.
