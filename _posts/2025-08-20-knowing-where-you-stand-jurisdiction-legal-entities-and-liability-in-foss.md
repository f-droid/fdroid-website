---
title: Knowing Where You Stand - Jurisdiction, Legal Entities, and Liability in FOSS
author: F-Droid
layout: post
---

When we started this project, the first question we asked ourselves was, _“What laws apply to F-Droid?”_

It seems simple, but the answer is not always so obvious. Free and open source software (FOSS) projects are often global by nature. Our contributors and users span continents, our infrastructure is distributed, and the internet doesn’t stop at borders. But the law does, and understanding which borders matter to a project is key to protecting that project from legal pressure.

In this article, we’ll look at how different FOSS projects have approached this challenge, what we’ve learned from their experiences, and what it means for F-Droid going forward.

## F-Droid’s Jurisdiction

F-Droid operates under the umbrella of [The Commons Conservancy](https://commonsconservancy.org/), a nonprofit foundation based in the Netherlands. Since we are a constituent project of TCC, this provides us with a legal home, a jurisdiction where questions of liability, data processing, and takedown compliance can be clearly anchored. It also means we have a legal representative to some extent and we have a liability shield, in the sense that individual contributors and maintainers are not personally liable, assuming good faith participation.

That doesn’t mean we’re immune from pressure elsewhere. Unjust legal pressure can come from anywhere. Over the past few years, we’ve seen abusive copyright infringement complaints, illegitimate takedown demands, and data access requests from a mix of governments, policing authorities, law firms and organizations in Russia, India, Germany, Singapore, the UK, and the US. Some of these demands are abusive and serious. Many are vague or unsupported. But all require time, attention, and care to navigate.

At the same time, because we are part of a European legal entity, F-Droid is obligated to comply with applicable European laws such as the General Data Protection Regulation ([GDPR](https://gdpr.eu/what-is-gdpr/)) and assess whether other European legislation like the Digital Services Act ([DSA](https://commission.europa.eu/strategy-and-policy/priorities-2019-2024/europe-fit-digital-age/digital-services-act_en)) and the Digital Markets Act ([DMA](https://commission.europa.eu/strategy-and-policy/priorities-2019-2024/europe-fit-digital-age/digital-markets-act-ensuring-fair-and-open-digital-markets_en)) are applicable in our case.

Knowing our jurisdiction and having a nonprofit foundation that can serve as a legal entity gives us the grounding we need to respond consistently and safely.

## Why Jurisdiction Matters and When it Doesn’t

One of the most common pieces of advice we heard during our interviews was this: _Establish your legal jurisdiction early, and make it work for you._

Having a clear legal jurisdiction helps you determine what laws you must comply with and defines how others can take legal action against you.

But there is a catch. Even if your legal home, servers, and core contributors are based in one jurisdiction, that doesn’t mean other countries will stay out of your business. If your domain is registered through a provider in their region, or if users in their country can access your software, countries outside your jurisdiction may still treat your project as within reach and take action accordingly. For example, since if your project has no ties to the US, you might think that US-specific laws like the DMCA does not affect your project. However if your domain name is .com, .org, or .net, then the US Federal Government can take a domain if they feel the project is not complying with US law.

## Strategies from the FOSS Ecosystem

### Establishing proper channels

Once you know which jurisdiction you fall under, the next step is to establish appropriate channels for how to receive legal requests.

Here there are two things to consider, don’t make yourself an easy target, but do make it easy to receive legitimate legal requests (not abusive or misleading requests), so that you can respond efficiently.

What do we mean by this? It is often a requirement for organizations to have a designated channel to receive legal and governmental communication. Therefore the easiest way and lowest barrier to entry would simply be having a “contact us” section on your website with instructions to send an email to an legal@ or abuse@ account. This shifts the burden away from individuals, towards official channels.

However in our experience, this can be abused, by law firms and specialized companies hired to send mass copyright infringement letters and takedown requests to individual maintainers, with the purpose of intimidation. So to simplify the channels for handling these requests, you can request legitimate and binding legal requests to be sent per post. Requesting all legal requests to come via snail mail provides a single channel to monitor that covers all binding legal requests. 

This works insofar as it deters illegitimate threats such as AI generated bulk emails from law firms trying to intimidate overworked maintainers or policing authorities trying to extract user data without just cause. But what happens when you have a real threat that needs to be handled  “immediately” (by the way, “immediately” is sometimes a disputed amount of time ranging from hours to several days and is often not specified). Based on the interviews we conducted, many said having a legal email address as a first line of defense, followed up by a postal address, was a strong strategy. 

It is equally important to state your jurisdiction publicly. Ultimately it is up to you to decide how easy you want to make it for lawyers and law enforcement to submit requests, illegitimate or not.

### Protecting individual maintainers and contributors

One of the most important reasons for establishing a legal entity is to create a formal buffer between individual contributors and legal requests. 

Forming a nonprofit organization or affiliating with one, as F-Droid has through The Commons Conservancy helps shift that burden. When a project operates under a legal entity, that entity assumes the legal burden. It can be named in court filings, enter into contracts, and handle complaints allowing individual contributors to remain shielded, at least in most cases.

The key idea is this: legal systems are designed to look for someone to hold responsible. Without an entity, one or more individuals bear the legal and financial risks. With an entity, the legal and financial risk shifts and the project becomes more sustainable in the face of external pressure.

## Why having a board and statutes matter

Joining a nonprofit like The Commons Conservancy gives a project legal standing but that’s only the starting point. To make the most of that protection, the project needs internal structure: a clear process for governance, decision-making, and accountability. That’s why, after affiliating with The Commons Conservancy, F-Droid established a Board and formal [statutes](https://commonsconservancy.org/dracc/0039/).

Our statutes define how decisions are made, how people can join or leave the Board, how responsibilities are shared, and the principles that guide the project’s governance. This clarity is not just administrative it’s legal infrastructure. It shows that F-Droid isn’t just a loose collection of individuals; it’s an organized project with rules, processes, and accountability.

This matters because many legal protections including those offered by The Commons Conservancy depend on demonstrating that the project acts in good faith, follows its own rules, and operates under documented governance. If legal issues arise, the statutes become a reference point for who can speak for the project on how internal decisions are made, and how responsibility is distributed.

This insight was reinforced in our interviews with long-running FOSS organizations. Multiple groups explained how board structures and separate legal entities, allow them to distinguish between core contributors who are empowered to vote and guide the project, and external supporters or funders, who do not influence governance. They shared that having a clear, codified governance model helps reduce ambiguity and liability when sensitive decisions need to be made.

A defined board and statutes also provide continuity, reinforcing that F-Droid is about shared principles, first and foremost. They make it possible to handle sensitive matters like financial oversight, legal negotiations, and escalation processes even if individual contributors step back or rotate out. In short, they help F-Droid function more like a long-term institution - resilient, transparent, and trusted, rather than a collection of ad hoc volunteers.

## What We’re Doing at F-Droid

Thanks to The Commons Conservancy, F-Droid has an established legal base in the Netherlands. That gives us a clear jurisdiction for handling takedown and data requests, access to European legal protections and frameworks, and a legal barrier that helps protect volunteers and maintainers.

We know this isn’t a perfect shield so we’re working on several key areas to strengthen our legal framework including:

* Clarifying our public legal policies, including how requests must be submitted
* Creating internal response guidelines to avoid ad hoc decisions
* Building relationships with lawyers in key jurisdictions
* Educating our contributors about how our legal infrastructure protects them and where it doesn’t

## Other FOSS Projects

If you’re running a FOSS project, especially one that distributes software or runs infrastructure, here are a few considerations:

1. Establish a legal entity early, preferably in a jurisdiction with strong civil protections.
2. Separate communications: use project-wide emails (e.g., legal@) for legal matters.
3. Choose your domain, hosting and servers with jurisdiction in mind.
4. Publish a legal policy that outlines how requests must be submitted.
5. Train your contributors so they know what to do if contacted directly.

## Coming Up Next

In our next article, we’ll take a closer look at how FOSS projects handle takedown requests and how a strong jurisdictional strategy supports safe, consistent responses.

## Legal Disclaimer

The content provided in this article is for informational purposes only and does not constitute legal advice. While we strive to provide accurate and up-to-date information, F-Droid makes no representations or warranties of any kind, express or implied, about the completeness, accuracy, or suitability of the information contained herein.

F-Droid is not a law firm and does not offer legal services. Any reliance you place on the information provided is strictly at your own risk. If you have questions about legal obligations, rights, or compliance, we strongly recommend consulting a qualified legal professional familiar with your jurisdiction.

F-Droid and its contributors disclaim all liability for any loss or damage arising from the use or misuse of this content.
