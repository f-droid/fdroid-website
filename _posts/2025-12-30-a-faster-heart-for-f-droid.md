---
title: A faster heart for F-Droid. Our new server is here!
author: F-Droid
layout: post
---

Donations are a key part of what keeps F-Droid independent and reliable and our latest hardware update is a direct result of your support. Thanks to donations from our incredible community, F-Droid has replaced one of its most critical pieces of infrastructure, our core server hardware. It was overdue for a refresh, and now we are happy to give you an update on the new server and how it impacts the project.

This upgrade touches a core part of the infrastructure that builds and publishes apps for the main F-Droid repository. If the server is slow, everything downstream gets slower too. If it is healthy, the entire ecosystem benefits.

## Why did we wait?

This server replacement took a bit longer than we would have liked. The biggest reason is that sourcing reliable parts right now is genuinely hard. Ongoing global trade tensions have made supply chains unpredictable, and that hit the specific components we needed. We had to wait for quotes, review, replan, and wait again when quotes turned out to have unexpected long waits, before we finally managed to receive hardware that met our requirements.

Even with the delays, the priority never changed. We were looking for the right server set up for F-Droid, built to last for the long haul.

## A note about the host

Another important part of this story is where the server lives and how it is managed. F-Droid is not hosted in just any data center where commodity hardware is managed by some unknown staff. We worked out a special arrangement so that this server is physically held by a long time contributor with a proven track record of securely hosting services. We can control it remotely, we know exactly where it is, and we know who has access. That level of transparency and trust is not common in infrastructure, but it is central to how we think about resilience and stewardship.

This was not the easiest path, and it required careful coordination and negotiation. But we are glad we did it this way. It fits our values and our threat model, and it keeps the project grounded in real people rather than anonymous systems.

## Old hardware, new momentum

The previous server was 12 year old hardware and had been running for about five years. In infrastructure terms, that is a lifetime. It served F-Droid well, but it was reaching the point where speed and maintenance overhead were becoming a daily burden.

The new system is already showing a huge improvement. Stats of the running cycles from the last two months suggest it can handle the full build and publish actions much faster than before. E.g. this year, between January and September, we published updates once every 3 or 4 days, that got down to once every 2 days in October, to every day in November and it's reaching twice a day in December. _(You can see this in the frequency of index publishing after October 18, 2025 in our [f-droid.org transparency log](https://gitlab.com/fdroid/f-droid.org-transparency-log/-/commits/master))_. That extra capacity gives us more breathing room and helps shorten the gap between when apps are updated and when those updates reach users. We can now build all the [auto-updated apps](https://gitlab.com/fdroid/wiki/-/wikis/FAQ#finding-updates) in the _(UTC)_ morning in one cycle, and all the newly included apps, fixed apps and manually updated apps, through the day, in the evening cycle.

We are being careful here, because real world infrastructure always comes with surprises. But the performance gains are real, and they are exciting.

## What donations make possible

This upgrade exists because of community support, pooled over time, turned into real infrastructure, benefiting everyone who relies on F-Droid.

A faster server does not just make our lives easier. It helps developers get timely builds. It reduces maintenance risk. It strengthens the health of the entire repository.

So thank you. Every [donation](https://f-droid.org/donate/), whether large or small, is part of how this project stays reliable, independent, and aligned with free software values. 
