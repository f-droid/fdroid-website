---
layout: page
title: Translation and Localization
redirect_from:
 - /translate

---

With release 0.103 of the F-Droid client app, there is now full
support for localization.  That means that all of the texts can be
translated into any language.  F-Droid will also use localized formats
for numbers, currency, dates, etc. which happens automatically based
on the language and country specified in the device's settings.

There are a number of separate sections that are each managed
separately, based on technical requirements:

* [F-Droid Android app strings](https://hosted.weblate.org/projects/f-droid/f-droid/)
* F-Droid Website pages and posts
* hand selected apps in [_fdroiddata_](https://gitlab.com/fdroid/fdroiddata)
* any app submitted to _fdroiddata_

As a general rule, a translation must be at least 70% complete for it
to be included in a final release.  For alpha releases, we try to
include all translations, no matter how incomplete.

If there are any issues with missing translations or broken localized
formats, please file an issue so it can be fixed:

https://gitlab.com/fdroid/fdroidclient/issues/new


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
