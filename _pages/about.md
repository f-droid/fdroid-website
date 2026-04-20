---
layout: page
title: About
permalink: /about/
---

For 15 years, F-Droid has been more than an app store: It's been a community.

Apps on F-Droid are free and open source (FOSS), they respect your privacy and they are available for anyone to see the source code, build on and improve.

We have shown that app distribution can be transparent, privacy-respecting, and accountable, setting a standard that challenges the mobile ecosystem to do better.

Our impact is measured not just in apps published, but in the freedom, trust, and digital rights we’ve helped protect.

Help us protect community-powered innovation and continue our mission of openness, privacy, and user empowerment.

### Our Mission

Provide a trusted way to find and share FOSS apps for Android. We protect privacy, put users in control, and build everything through an open, community-driven ecosystem.

### Why Use F-Droid?

* Privacy Friendly: No accounts needed to download apps. We don't track what you install and our app selection focuses on privacy and user freedom.
* Safe and Trusted: Apps are checked for security problems before they are added.
* F-Droid is Free for Everyone: You don’t have to pay to use F-Droid and we don’t show ads.
* Your Freedom Comes First: F-Droid apps are all free software. You can see, modify, inspect and build on the code. No black boxes. No lock-ins.

### How Does it Work?

You download the F-Droid app first. Then, you can browse or search for apps inside it and install the ones you like. When apps are updated, F-Droid helps keep them up to date on your device.

### Who Runs F-Droid?

F-Droid is made by volunteers who care about free and open software. They work together to keep F-Droid safe and easy to use. If you want to follow along or participate, check out our [<u>GitLab</u>](https://gitlab.com/fdroid).

F-Droid is legally represented by our [Commons Conservancy Programme](https://commonsconservancy.org/programmes/#F-Droid) which is regulated by our [statutes](https://dracc.commonsconservancy.org/0039/).

### Get Started

Ready to try F-Droid? [Get the app]({{ site.baseurl }}/docs/Get_F-Droid/) and discover thousands of free and safe apps for your device.

Are you a developer? Check out F-Droid on [GitLab](https://gitlab.com/fdroid) or [submit]({{ site.baseurl }}/docs/Submitting_to_F-Droid_Quick_Start_Guide/) your app to get started.

### Get in Touch

<a name="contact"/>

Connect with the team, other members and the community to ask questions and share your expertise:

<p>

<details><summary>Fediverse: <a href="https://floss.social/@fdroidorg">@fdroidorg@floss.social</a></summary>Follow us on our Mastodon and join the conversation.</details>

<details><summary>Matrix: <a href="https://matrix.to/#/#fdroid:f-droid.org">#fdroid:f-droid.org</a>&#8230;</summary>To see all of the F-Droid Matrix rooms, join the "space" that groups all F-Droid related rooms together at <a href="https://matrix.to/#/#fdroid-space:f-droid.org">#fdroid-space:f-droid.org</a>.</details>

<details><summary>Forum: <a href="https://forum.f-droid.org/">forum.f-droid.org</a></summary>Join our free software conversations and get support on Discourse.</details>

<details><summary>Telegram&#8230;</summary>There is also a Matrix bridge to Telegram, to join it click <a href="https://matrix.f-droid.org/fdroid/telegram/">this link</a>.</details>

<details><summary>XMPP&#8230;</summary>XMPP users can join via a <a href="https://codeberg.org/poezio/biboumi#readme">Biboumi</a> gateway that connects to IRC. The easiest way is to ask your XMPP server admin to host one, but if not possible, try one of the public ones. Copy and paste the address in your XMPP clients channel input field <tt>#fdroid%irc.oftc.net@irc.jabberfr.org</tt> <i>(hosted by <a href="https://jabberfr.org/">JabberFR</a>)</i> or <tt>#fdroid%irc.oftc.net@irc.hmm.st</tt> <i>(hosted by <a href="https://hmm.st/">hmm.st</a>)</i>.</details>

<details><summary>IRC: #fdroid on OFTC&#8230;</summary>Join the <a href="ircs://irc.oftc.net:6697/fdroid">#fdroid</a> channel on <a href="https://oftc.net/">OFTC</a>. Or click <a href="https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1">here</a> to join the web chat but set a proper nickname, not <tt>qwebirc*</tt>.</details>

<details><summary>Email: team@f-droid.org&#8230;</summary>You can reach the team via email at <a href="mailto:team@f-droid.org">team@f-droid.org</a>. Support questions are much more likely to be answered on the forum or #fdroid channel.</details>

</p>

### Learn more about the F-Droid Ecosystem

* [F-Droid Client](https://gitlab.com/fdroid/fdroidclient) - the android app store
* [fdroidserver](https://gitlab.com/fdroid/fdroidserver#f-droid-server) - for developers to prepare apps for distribution
* [F-Droid Data](https://gitlab.com/fdroid/fdroiddata) - where the apps are maintained
* [Repomaker]({{ site.baseurl }}/repomaker/) - create your own mini app store
* [F-Droid forum](https://forum.f-droid.org/) - community discussions on F-Droid
* [F-Droid on GitLab](https://gitlab.com/fdroid) - where developers and contributors work on the ecosystem
* [F-Droid Monitor](https://monitor.f-droid.org) - transparent overview and reporting on the ecosystem


### Consulting / Commercial Support

Using F-Droid in your organization and want to have an expert on board? We have a list of F-Droid contributors that offer consulting services. We can help you whitelabel F-Droid, integrate our tech stack into your project and create project specific features to suit your unique needs.

[Find an F-Droid Consultant]({{ site.baseurl }}/consulting/)


### Contributors

The F-Droid project was founded in 2010 by Ciaran Gultnieks,
and is brought to you by at least the following people:

<ul>
{%- for contributor in site.data.contributors -%}
<li>
{%- if contributor.gitlab -%}
<a href="https://gitlab.com/{{ contributor.gitlab }}" target="_blank">
{%- elsif contributor.weblate -%}
<a href="https://hosted.weblate.org/user/{{ contributor.weblate }}" target="_blank">
{%- endif -%}
{%- if contributor.Arab and site.data.scripts[site.active_lang] == "Arab" -%}
{{ contributor.Arab }}
{%- elsif contributor.Cyrl and site.data.scripts[site.active_lang] == "Cyrl" -%}
{{ contributor.Cyrl }}
{%- elsif contributor.Jpan and site.data.scripts[site.active_lang] == "Jpan" -%}
{{ contributor.Jpan }}
{%- elsif contributor.Kore and site.data.scripts[site.active_lang] == "Kore" -%}
{{ contributor.Kore }}
{%- elsif contributor.Hans and site.data.scripts[site.active_lang] == "Hans" -%}
{{ contributor.Hans }}
{%- elsif contributor.Hant and site.data.scripts[site.active_lang] == "Hant" -%}
{{ contributor.Hant }}
{%- else -%}
{{ contributor.name }}
{%- endif -%}
{%- if contributor.gitlab or contributor.weblate -%}
</a>
{%- endif -%}
</li>
{%- endfor -%}
</ul>

If you have contributed to F-Droid and your name is missing, it’s a mistake and you should
[add yourself to the list](https://gitlab.com/fdroid/fdroid-website/blob/master/_data/contributors.yaml)!
Please include your Weblate username if you are a translator.  Keep it sorted by first name, please.
