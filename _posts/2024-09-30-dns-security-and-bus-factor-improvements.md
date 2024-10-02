---
layout: post
title: 'DNS security and "bus factor" improvements'
author: "uniqx"
authorWebsite: "https://gitlab.com/uniqx"
---

Back in [2010](https://f-droid.org/2010/09/29/f-droid-is-here.html), Ciaran
Gultnieks created F-Droid to bring free software to Android.  It has since grown
to have many contributors from around the world, millions of users, and its own
legal entity with an esteemed [Board of
Directors](https://f-droid.org/2023/03/20/f-droid-board.html).  F-Droid has
become its own thing bigger than any one of the contributors.  We have just
taken of the last key steps to cementing that: the f-droid.org and related
domain names have been migrated to processes that are community-controlled with
oversight from the Board of Directors.  We thank CiaranG for all his work
maintaining the domains over the years.

This also eliminates a bottleneck of configuration changes.  We have a [Systems
Adminstration
Team](https://gitlab.com/fdroid/wiki/-/wikis/Systems-Adminstration-Team/) for
secure and shared maintenance of our key infrastructure.  Thanks to funding from
[Open Tech Fund](https://www.opentech.fund/) (OTF), the Systems Adminstration
Team set to work making the official F-Droid domains be as secure as possible.
We have moved our DNS servers for our official domain f-droid.org.  This change
helps improve our "[bus factor](https://en.wikipedia.org/wiki/Bus_factor)",
which means we are less dependent on a single person to keep the project running
smoothly.

We've used this opporunity to roll out additional DNS secuity measures. Since
the [jabber.ru incident](https://www.devever.net/~hl/xmpp-incident) happened,
it seems to us that both migrating to more trustworthy hosting providers and
increasing DNS security is more important than ever.

We started by adding a [Certification Authority
Authorization](https://wikipedia.org/wiki/DNS_Certification_Authority_Authorization)
DNS record. A CAA record is a way for website owners to specify which companies
may issue security certificates for their website. This should help us to
detect network attacks like the one against jabber.ru. Additionally we have
started monitoring [certificates of our domain
names](https://monitor.f-droid.org/services/tls-certs) in [certificate
transparency logs](https://wikipedia.org/wiki/Certificate_Transparency). This
will hopefully help us detect if someone tries to issue a malicious certificate
in our name. These measures should significantly raise the bar for man-in-the-middle
attacks on our transport encryption.

Over the years, we have received many requests to enable
[DNSSEC](https://wikipedia.org/wiki/Domain_Name_System_Security_Extensions) for
improved security. Rightfully so. Now that we have a new DNS provider, we have
successfully rolled it out.

We've also recently finished moving our email server, a task that was long
overdue. F-Droids new email provider now implements all the technical nitty
gritties like SPF, DKIM, DMARC, which are ever more important since big E-Mail
providers started blocking mails from E-Mail servers without those features.
