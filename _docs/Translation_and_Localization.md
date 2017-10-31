---
layout: page
title: Translation and Localization

---

As of release 0.103 of the F-Droid client app, there is now full
support for localization.  That means that all of the texts can be
translated into any language.  F-Droid will also use localized formats
for numbers, currency, dates, etc. which happens automatically based
on the language and country specified in the device's settings.

There are a number of separate sections that are each managed
separately, based on technical requirements:

* [F-Droid Android app strings](https://hosted.weblate.org/projects/f-droid/f-droid)
* [_fdroidserver_ command line tool](https://hosted.weblate.org/projects/f-droid/fdroidserver)
* [_Repomaker_ web tool](https://hosted.weblate.org/projects/f-droid/repomaker)
* [selected app descriptions](https://hosted.weblate.org/projects/f-droid/fdroiddata)
* [f-droid.org website "chrome" strings](https://hosted.weblate.org/projects/f-droid/website)
* [f-droid.org website blog posts](https://hosted.weblate.org/projects/f-droid/website-posts)
* [f-droid.org website docs and pages](https://hosted.weblate.org/projects/f-droid/website-docs)

If the upstream project's source repo includes app descriptions, then
those will be automatically included as long as they use the
[supported layouts](../All_About_Descriptions_Graphics_and_Screenshots).
If there are any issues with missing translations or broken localized
formats, please
[file an issue](https://gitlab.com/groups/fdroid/issues) so it can be
fixed.


## The "Languages" preference

There are cases where having English as the fallback language is not
helpful.  For example, much of the world would prefer to fall back to
Chinese, Spanish, or Russian instead of English.  On Android 6.0 and
older, F-Droid provides a "Languages" setting inside the app so that
users can switch F-Droid to a different language.  Note that this
might not handle localized format properly, just the
language. Android 7.0 fixed this by allowing users to specify a list
of language+country "locales", ordered by importance to the user.


## Contributing

Is F-Droid not in your language, or the translation is incorrect or
incomplete?  Get involved in the translations by signing up for
[our Weblate](https://hosted.weblate.org/projects/f-droid/).  You can
also find other translators on the
[F-Droid forum](https://forum.f-droid.org/t/about-the-translation-category/).


### Adding a new language

First and foremost, Android must already support the specific language
and locale you want to add.  We cannot work with languages that
Android and the SDK do not support, the tools simply break down.
Next, if you are considering adding a country-specific variant of a
language (e.g. _de-AT_), first make sure that the main language is
well maintained (e.g. _de_). Your contribution might be useful to more
people if you contribute to the main language rather than the
country-specific variant.

For
[_fdroidclient_](https://hosted.weblate.org/projects/f-droid/f-droid/),
[_fdroidserver_](https://hosted.weblate.org/projects/f-droid/fdroidserver/)
and
[_Repomaker_](https://hosted.weblate.org/projects/f-droid/repomaker),
anyone can create a new language via Weblate.  For the rest of the
translation "components" on Weblate, please
[file an admin issue](https://gitlab.com/fdroid/admin/issues) to
request a new language.


### When translations are included

The translation files are included from Weblate before each release.
As a general rule, a translation must be at least 70% complete for it
to be included in a final release.  For alpha releases, we try to
include all translations, no matter how incomplete.

For the f-droid.org website, it is a much more complicated
system. Since it cannot (yet?) support lots of languages, we have to
put stricter requirements on it.  In order for a new language to be
added to f-droid.org, it must have:

* ["chrome" strings](https://hosted.weblate.org/projects/f-droid/website) 100% translated
* About and Contribute pages in [website docs](https://hosted.weblate.org/projects/f-droid/website-docs) 100% translated
* 10 apps in [_fdroiddata_](https://hosted.weblate.org/projects/f-droid/fdroiddata) 100% translated

There is a [nightly build of the website](https://staging.f-droid.org)
that includes all translations on Weblate, no matter how complete they
are. This lets everyone see the progress, and means we can get new
languages working well before launching them.
