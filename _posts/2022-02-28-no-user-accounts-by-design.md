---
layout: post
title: No user accounts, by design
author: "eighthave"
---

Ethics has been central to the F-Droid community from the beginning, with a
[focus](https://www.ethicsinapps.eu/) on free software, privacy and user
control. A key part of F-Droid's design is the lack of user accounts.  There are
no user accounts used, ever, in the process of delivering apps to users.  This
is by design.  F-Droid has never had a method to identify or track users in the
Android client app, and getting information from _f-droid.org_ has also never
required any kind of identity information.

Having user accounts makes some problems much easier to solve: it makes it easy
to include ratings and reviews and to manage editing of documentation.  However,
having user accounts makes other problems much more difficult to solve.  User
accounts inevitably mean that personally identifiable information
([PII](https://en.wikipedia.org/wiki/Personal_data)) will be collected and
stored. User accounts also require passwords, and often phone numbers or email
addresses. All that data needs to be defended.  One of our core goals is to
eliminate the possibility of tracking our users. Having user accounts would make
that goal nearly impossible.

It turns out that user accounts are rarely a requirement for building a service,
even though many services make it seem that way.  User accounts are a great way
to [gather data](https://www.theguardian.com/commentisfree/2018/mar/28/all-the-data-facebook-google-has-on-you-privacy)
and link it all together to create very detailed profiles.  This is central to
tracking users in order to commodify them and
[sell](https://themarkup.org/ask-the-markup/2022/02/03/is-momentum-shifting-toward-a-ban-on-behavioral-advertising)
their attention to the highest bidder.

User accounts are also used to control access to information and data.  They are
used to "region lock" videos and [selectively block](https://www.bbc.com/news/technology-58921230)
access to apps.  There are of course valuable use cases for restricting access,
like ensuring small children can only access age appropriate content.  But there
are other ways of doing that, like curating repositories so that adult material
is delivered via separate, opt-in repositories.


## User accounts are central to tracking people

User accounts and IDs are a key part of tracking users and building long lasting
profiles. If a service requires an account to access it, that service is likely
tracking its users. When a user logs in, they are clearly telling the service
who they are.  And that service can then easily ascribe actions to that account
to [build up](https://segment.com/docs/guides/how-to-guides/cross-channel-tracking/)
the [profile](https://web.archive.org/web/20210509110405/https://amplitude.com/user-analysis).
This is not to say that there are no valid reasons to track users.  As mentioned
earlier, Wikipedia editors are an example of an essential service built on user
accounts.  What we are saying is if privacy is important to you, then login
requirements should make you stop and think.

Google provides us with an ugly example.  It puts a lot of effort into getting
people to log in as much as possible, and most of their services require users
to be logged in with an account.  And those that don't nag you to login.  The
Chrome browser even [has logins](https://blog.cryptographyengineering.com/2018/09/23/why-im-leaving-chrome/),
which are linked to Google accounts. They often
[justify this requirement](https://mashable.com/article/google-chrome-69-forced-login)
by saying it makes services easier to use.  While it is true that tracking users
can make certain things serve the user better, Google consistently seems to
apply these cases to situations where it means they get more tracking data.
With Google Meet, they still require logins to create a meeting, even though
they support joining meetings via a URL without an account.  Jitsi Meet's user
experience is much easier and has no accounts.  Or consider the Google issue
tracker: it currently requires both Javascript and an active Google account to
use the service in any way, even if you just want to read existing posts.  It
worked for years without Javascript or user accounts, so it is clear that the
service does not need them to run.


## What works without user accounts?

It turns out that F-Droid is not alone in delivering key services without user
accounts or profiles.  There are browsers, wikis, shared notepads, video
conferencing, and even messaging and analytics.  Many systems that use accounts
also allow reading and even editing without logging in.

The first question to answer is: does this service need to know who the users
are in order to function?  Can that information remain only on the users device?
For example, an email or messaging service needs to know enough about its users
to be able to direct data from a user sending a message to the intended
recipient.  This has mostly meant that the server relies on each user having an
account with the server.  This is a common way to implement such a system, but
it is not the only way.  [Tor Onion Services](https://community.torproject.org/onion-services/)
opens up a different approach. They are designed for routing data without any
part of the system being able to see who is sending data to whom, and who is
making the request.  [Briar](https://briarproject.org/how-it-works/) builds upon
this to make messaging work without anyone knowing who is sending messages to
whom, outside of those involved in the conversation.  With Briar, the user
contact information is only ever on the users' devices.

Video conferencing was built around user IDs like accounts and phone numbers.
Services like [Jitsi Meet](https://jitsi.org/jitsi-meet/) pioneered a new way:
each conference room is represented by a name in a URL,
e.g. _https://meet.jit.si/**ThisIsAConferenceRoomName**_.  Anyone who has that
URL can open it in a browser and join the room.  Jitsi Meet works very well, and
demonstrated that online meetings actually work better without user accounts:
they are much easier to setup and manage.  Currently, no online meeting platform
would be taken seriously if it does not support joining meetings with a URL
only, in other words, with no user account at all.

Wikipedia is a great hybrid example. It is possible to edit most pages without
an account at all, just by clicking edit and making the changes.  User generated
content inevitably needs controls to tame edit wars and abusive behavior.  So
user accounts are still a key part of how Wikipedia works.  However, in this
case, it stems from the Wikimedia editors' need to deliver essential services to
their users rather than manufactured reasons to track and hook ever more people.

Mozilla has taken this idea a step further with
[Firefox Klar](https://support.mozilla.org/en-US/kb/what-firefox-klar-android)
(also known as [Firefox Focus](https://www.mozilla.org/firefox/browsers/mobile/focus/)
similar to Firefox Klar but with less private default settings).  This web
browser makes it easy to use the web without keeping any state at all. The
browser version for mobiles follows the same basic idea: tracking people is not
necessary to provide a good user experience. I personally prefer using Firefox
Focus on my phone because I specifically want to avoid thinking about managing
accounts, cookie preference screens, history, etc.  I just use it to look up
information, and when I'm done and click the notification, its all wiped clean.
(_Unfortunately, Focus and Klar both contain Google Play Services proprietary
libraries, e.g. com.google.android.gms, so they are not currently distributed
on f-droid.org. We welcome contributions to remove the proprietary bits so we
can distribute them again_).

Guardian Project is developing [Clean Insights](https://cleaninsights.org/) to
promote the idea that usage analytics can provide useful insights that only
benefit the end users. For this to happen, there must be absolutely no way to
track users: no tracking IDs, no user accounts, no nothing.  F-Droid has done
[some]({% post_url 2019-04-15-privacy-preserving-analytics %})
[experiments]({% post_url 2021-03-01-fdroid-metrics-and-clean-insights %})
with Clean Insights, and the approach looks quite promising.  Any kind of
analytics needs to go beyond concerns of privacy in order to serve users.  We
also need to consider that digital media has the power to
[manipulate](https://guardianproject.info/2021/02/18/usability-the-wonderful-powerful-idea-that-betrayed-us/)
and [addict](https://www.wired.com/story/phone-addiction-formula/)
[us](https://sitn.hms.harvard.edu/flash/2018/dopamine-smartphones-battle-time/).

Since the F-Droid ecosystem works on
[hashes](https://en.wikipedia.org/wiki/Cryptographic_hash_function) of static
files without access controls, it unlocks all sorts of flexibility.  Mirrors of
the _f-droid.org/repo_ repository can be safely delivered via services around
the world, [local Raspberry Pis](https://gitlab.com/guardianproject/wind-offline-fdroid-repo-on-rpi),
or even a USB thumb drive.  Any content can be archived by anyone
[without permission or centralized services]({% post_url 2022-02-05-decentralizing-distribution %})
using [IPFS](https://en.wikipedia.org/wiki/InterPlanetary_File_System).


## Accounts used when making F-Droid

We can also announce that the _f-droid.org_ website has no user accounts at all
in any part of it.  The final piece was the old MediaWiki instance that was at
_https://f-droid.org/wiki_.  This has been replaced by
<https://monitor.f-droid.org> and <https://gitlab.com/fdroid/wiki>.  The
[forum](https://forum.f-droid.org) is built with Discourse, which is built
around user accounts.  Still, our forum can be read without logging in or using
Javascript.  User accounts are a well known tool for managing spam and abusive
behavior on public forums, and that is how they are used in our forum.  We are
open to proven alternatives that can operate more privately.

With the right setup, it is possible to send contributions via git with only minimal
traces of the original author.  This now also applies to our wiki.  Where
appropriate, we also allow contributions to come in via the `@fdroid-anyone`
account, which anyone can use by finding the password on the wiki.

Working on F-Droid itself does require user accounts.  We know of no
other proven method of access control for building trusted systems
that millions can rely on.  Core contributors are willing to give up
some privacy in order to ensure that users can have real privacy.
