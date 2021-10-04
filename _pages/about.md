---
layout: page
title: About
permalink: /about/
---

F-Droid is a robot with a passion for Free and Open Source Software (FOSS) on the Android platform. On this site you’ll find a repository of FOSS apps, along with an Android client to perform installations and updates, news, reviews, and other features covering all things Android and software-freedom related.

Donations for F-Droid development are handled via our [OpenCollective](https://opencollective.com/F-Droid/).


### Contact

You can discuss F-Droid or get help on the
[forum](https://forum.f-droid.org) and F-Droid's user chat.

To chat with others about F-Droid, either join via IRC in the
[#fdroid channel](https://webchat.oftc.net/?randomnick=1&channels=fdroid&prompt=1) on
OFTC or join [#fdroid:f-droid.org](https://matrix.to/#/#fdroid:f-droid.org) on Matrix.
The discussions are logged on
[matrix.f-droid.org](https://matrix.f-droid.org/alias/%23fdroid:f-droid.org).

There are also bridges to Telegram and Jabber/XMPP (experimental).
To join via Telegram, click [this link](https://matrix.f-droid.org/fdroid/telegram/).
For Jabber/XMPP,
join [#fdroid#matrix.org@bridge.xmpp.matrix.org](xmpp:#fdroid#matrix.org@bridge.xmpp.matrix.org?join).

F-Droid contributors also run a social-media account on the Fediverse. You can
interact with us or follow us on [@fdroidorg@mastodon.technology](https://mastodon.technology/@fdroidorg).

You can send email at
[team@f-droid.org](mailto:team@f-droid.org), but messages are much
more likely to be answered on the forum or #fdroid channel. If you
want to help, you can [join us]({{ "/contribute/" | prepend:
site.baseurl }}).

### Consulting / Commercial Support

If you're running an organisation that uses F-Droid or would like to use F-Droid, you will sometimes want to have an expert. For this, we have a list of companies and developers who have contributed to F-Droid in one way or another and are available for consulting:

[Find an F-Droid Consultant]({{ "/consulting/" | prepend: site.baseurl }})


### License

* The source code for this site and the content produced by the F-Droid community are available under the [GNU Affero General Public License version 3 or later (AGPLv3+)](https://www.gnu.org/licenses/agpl-3.0.html).
* The content of the news section and the F-Droid logo are also available under [Creative Commons Attribution-ShareAlike 3.0 License (CC-BY-SA-3.0)](http://creativecommons.org/licenses/by-sa/3.0/) or [GNU General Public License version 3 or later (GPLv3+)](https://www.gnu.org/licenses/gpl-3.0.html).
* The descriptive text and graphics for each app have a specific license from that project.  Free software should also have free descriptions and graphics.
* The F-Droid logo was created by William Theaker. Updates to that, and additional artwork, are by Robert Martinez.


### Terms, etc.

F-Droid is a non-profit [volunteer]({{ "/contribute/" | prepend: site.baseurl }}) project. Although every effort is made to ensure that everything in the repository is safe to install, you use it AT YOUR OWN RISK. Wherever possible, applications in the repository are built from source, and that source code is checked for potential security or privacy issues. This checking is far from exhaustive and there are no guarantees.

F-Droid respects your privacy. We don’t track you, or your device. We don’t track what you install. You don’t need an account to use the client, and it sends no additional identifying data when communicating with our web servers, other than its version number. We don’t even allow you to install other applications from the repository that track you, unless you first enable ‘Tracking’ in the `AntiFeatures` section of preferences. Any personal data you decide to give us (e.g. your email address when registering for an account to post on the forum) goes no further than us, and will not be used for anything other than allowing you to maintain your account.


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

The original F-Droid client app was based on the Aptoide app developed by Roberto Jacinto.
