---
layout: post
title: Building trust through software rather than giving it
author: EBendinelli
---

## Security and privacy come from trust 

The experience we have with our devices usually feels private and secure. If no one else is looking at our screen, it seems like no one is watching. Unfortunately, this feeling is misplaced. Apps come bundled with trackers, websites seek to profile users to target them with ads and many apps and systems providers have full access to how users interact with their product. And that's before even talking about the malicious actors who want access to your credit card details.

Even if we are aware of this, we don't want to think about the privacy and security of our devices. What we want is to be able to trust that the systems we interact with protect us and our information. Just as we trust that the public bridges we walk on to support the weight of traffic, we should be able to trust the devices and software we use. Yet reality is different. Where public infrastructure relies on strict rules and regulations, technology is a patchwork of unequally adopted standards, connected blocks and proprietary solutions. This usually leaves us trusting those who *build* apps and devices. When Apple [informs iPhone users that they might have been targeted by a spyware](https://uk.pcmag.com/security/157847/apple-warns-iphone-users-about-mercenary-spyware-attack-what-to-do-if-notified), users trust that the company is telling the truth and sharing real information. When Google tells us that our account is secure and only we can access it, we trust them. How those companies actually implement privacy and security is unknown, we trust them to be doing it correctly. 

 But trust can be built through a lot more than a relation with a company. It can be cultivated with open source code, with the adoption of secure and well-known protocols, through reproducible build and deployment process, and through the infrastructure and hardware it runs on. 

Trusted protocols for example can participate in building trust. TLS, OAuth, The Signal protocol: those are all standards and protocols that have been adopted across industries  and that allow us to shop online safely, connect to our banks securely or message people privately and security. Fundamentally, they provide security in a way that doesn't require trusting intermediaries: an encrypted Signal message could go through a dozen servers, yet only the sender and the recipient can read it.

But protocols aren't sufficient, and the trust they provide can be weakened when implemented in a non-transparent manner. WhatsApp implementing the Signal Protocols means we still have to trust the company building the product when its history provides limited reasons to do so. 
 
 > To illustrate this: A range of recent, and [relatively questionable, lawsuits](https://storage.courtlistener.com/recap/gov.uscourts.cand.463150/gov.uscourts.cand.463150.1.0.pdf) against Meta alleged that WhatsApp did not, in fact, implement E2EE encryption and could access user messages. While there are strong reasons to think those are part of a smear campaign, with WhatsApp code being proprietary, there is no means to ensure that the Signal Protocol is indeed properly implemented, and has remained so with every update of the app since the work done between the Meta and Signal. 
   
Protocols are not silver bullets that, when deployed, simply create security and cannot be broken. In the same way that a spyware installed on a smartphone can access and siphon plain-text messages from any encrypted app like Signal, it is possible for an app developer to insert code to exfiltrate messages, or private keys for later decryption. Some of this can be audited by monitoring app traffic but there are limitations.

## What we need to build infrastructure trust

Completely avoiding the need to trust those who create and deployed software is hard, but reducing this trust to the bare minimum is feasible and desirable. It will always feel safer to trust a company saying "You don't have to trust us, you can trust our security and test it yourself" than one saying "Just trust us".

Whether in the context of discussion around digital sovereignty or pushing back against digital monopolies, creating systems that offer built-in trust rather than requiring trust in companies offers security and autonomy guarantees that are hard to overstate. For mobile app for example, this translates into:

- Open and trusted protocols: building on secure foundations that are battle tested, benefit from multiple implementations and supported by a community
- Free and open source software: providing transparency that allows code auditing
- [Reproducible builds](https://reproducible-builds.org/): providing certainty that what you are running is what the developer released and hasn't been altered
- Control over the infrastructure: access to the physical machine in charge of the actual computation is crucial in preventing manipulation and intrusion

F-Droid implements many of those things. [Reproducible builds](https://f-droid.org/docs/Reproducible_Builds/) have been a core part of making releases of Android apps in a fully automated way [since 2015](https://f-droid.org/en/2015/02/11/complete-reproducible-app-distribution-achieved.html). We have full control over [the server](https://f-droid.org/2025/12/30/a-faster-heart-for-f-droid.html) used to build and publish apps, along with a strict [security model](https://f-droid.org/docs/Security_Model/). Most of those things run on open source software, rely on open and trusted protocols and benefit from the active communities that develop and maintain them.

At a time where pressure is mounting with regards to who owns our infrastructure and systems, building and using tools that create trust enables us to limit our dependency on unreliable actors who can put [entire ecosystem in jeopardy on a whim](https://keepandroidopen.org/). 

Yet seeking autonomy does not need to mean isolation. Those steps might reduce our dependency on private actors, but they require a strong and healthy open source ecosystem to thrive. It switches our reliance from companies with private interests that might change to communities of actors that collaboratively build open tools. If this is something that resonates with you and you want to support F-Droid to continue in these efforts, consider [making a donation](https://f-droid.org/en/donate/).

