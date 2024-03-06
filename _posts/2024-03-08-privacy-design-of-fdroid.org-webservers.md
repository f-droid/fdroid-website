---
layout: post
title: Privacy design of f-droid.org webservers
author: "uniqx"
---

F-Droid is committed to upholding privacy-by-design principles.  This
commitment has significant architectural implications for all of our software
and systems. Here's what it means for our web servers.

At present, many websites rely on commercial content delivery network (CDN)
providers.  While this simplifies scaling out for website operators, it
centralizes the internet, which has some implications on user privacy. First
and foremost, CDN providers can see all user data.  This means that users need
to trust that none of their data is being stored and/or leaked. CDN providers
tend to have strong privacy policies.  However, users and website operators
cannot verify how these policies are enforced. Regulations such as GDPR have
reporting requirements that can help, but ultimately trust is required.

To scale out f-droid.org in a privacy-friendly manner, we rely on mirroring and
adding more servers under our control.

Mirroring has been a successful scaling strategy for many GNU/Linux
distributions. Anyone can host a mirror of our app repository by keeping an
[up-to-date copy on their web
server](https://f-droid.org/docs/Running_a_Mirror/). Traditionally,
Universities and ISPs provide mirroring to speed up their internet
infrastructure. Our app automatically selects a mirror for each download based
on connection performance. F-Droid carefully curates a list of official
mirrors. Our app gives users complete control over which mirrors they want to
use. We are also exploring ways to provide more information about mirrors to
assist users in making informed trust decisions.

As a side note, the popular proprietary CDN provider Cloudflare is sponsoring a
mirror of our [website](https://cloudflare.f-droid.org) and
[repository](https://cloudflare.f-droid.org/fdroid/repo).  If you trust them
you can add this repository as a mirror to your F-Droid App by going to
repository settings and adding the mirror as if you were adding a new
repository.  We are working with them to get TLS Encrypted Client Hello (ECH)
enabled on that site.  That is the upcoming IETF standard for protecting
metadata in TLS connections, including the domain name in the SNI field.

We've automated our webserver operations with `ansible` on top of Debian. This
gives us a lot of flexibility, such as the ability to implement privacy
enhancing network and logging configurations, as well as the freedom to easily
change server hosting providers.

Our web servers are protected by HTTPS transport encryption. Although we use a
state of the art implementation of this protocol, the domain name that users
are connecting to is typically transmitted in clear text during connection
establishment. This is because of a widely used technique called SNI. While SNI
is a fundamental requirement for building multi-tenant CDNs, we have configured
our servers to accept connections without SNI.  This allows clients to connect
to f-droid.org without having to include the SNI.  This provides the same kind
of protection as ECH, but is available right now for clients that implement it.

Based on research from Guardian Project's Clean Insights, we've configured our
web servers to log country codes instead of IP addresses.  This means that we
do not store any personally identifiable information.  Our servers also delete
log data after 14 days.  We've been running this configuration for over a year
now and it seems to be working pretty well.  Here's what our web server logs
look like:

```
0.0.0.0 - - [29/Feb/2024:00:00:00 +0000] "HEAD /repo/index-v1.jar HTTP/1.1" 200 0 "-" "-" DE
0.0.0.0 - - [29/Feb/2024:00:00:00 +0000] "GET /repo/entry.jar HTTP/2.0" 200 2574 "-" "-" US
0.0.0.0 - - [29/Feb/2024:00:00:00 +0000] "GET /repo/entry.jar HTTP/2.0" 200 2574 "-" "-" DE
0.0.0.0 - - [29/Feb/2024:00:00:00 +0000] "GET /repo/entry.jar HTTP/2.0" 200 2574 "-" "-" BE
0.0.0.0 - - [29/Feb/2024:00:00:00 +0000] "GET /F-Droid.apk HTTP/2.0" 206 1474560 "https://f-droid.org/" "-" NG
```

With fine-grained control over our web server logs and a significant amount of
traffic, F-Droid is in a great position to innovate on privacy metrics. We're
aggregating our logs and publish the resulting [raw metrics for
f-droid.org](https://fdroid.gitlab.io/metrics/) on a weekly basis. The numbers
we collect here don't include metrics from our mirrors, but they should be good
enough for statistical analysis.  No one on our team is currently working on
this analysis, so if this sounds interesting to you, this could be a great way
to make a valuable contribution to F-Droid.

If you're interested to learn more about privacy protections in F-Droid, here
is an article about why F-Droid doesn't have [user
accounts](https://f-droid.org/2022/02/28/no-user-accounts-by-design.html).

