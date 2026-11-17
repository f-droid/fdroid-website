---
layout: page
title: Translation and Localization

---

Every piece of F-Droid can be localized, including the Android app,
the entire website, and the tools.  That means that all of the texts
can be translated into any language supported by Android.  F-Droid
will also use localized formats for numbers, currency, dates,
etc. which happens automatically based on the language and country
specified in the device's settings.  All of the F-Droid resources are
available for translation on
[Weblate "components"](https://hosted.weblate.org/projects/f-droid/)
that are each managed separately, based on technical requirements.

If an app's source code repo includes app descriptions, then those
will be automatically included as long as they use the
[supported layouts](../All_About_Descriptions_Graphics_and_Screenshots).
If there are any issues with missing translations or broken localized
formats, please
[file an issue](https://gitlab.com/fdroid/fdroid-website/-/issues)
so it can be fixed.


## Contributing

Is F-Droid not in your language, or the translation is incorrect or
incomplete?  Get involved in the translations on
[our Weblate](https://hosted.weblate.org/projects/f-droid/).

All translation work is done in Weblate to keep the workflow easy.  We
recommend that translators use a [GitLab](https://gitlab.com) account
for logging into Weblate since that same account can be used on all of
the F-Droid projects on GitLab. you can find other translators on the
[forum](https://forum.f-droid.org/c/translation).

<a name="contact"/>

Translators also coordinate via the dedicated chat room, which is available
on Matrix at [#fdroid-translators:f-droid.org](https://matrix.to/#/#fdroid-translators:f-droid.org),
by clicking [this link](https://t.me/fdroid_translators) for Telegram, IRC at
[#fdroid-translators](https://webchat.oftc.net/?randomnick=1&channels=fdroid-translators&prompt=1)
on OFTC, or these bridges `#fdroid-translators%irc.oftc.net@irc.jabberfr.org` / 
`#fdroid-translators%irc.oftc.net@irc.hmm.st` for XMPP.

### How to add translations to an existing language

Once logged into the [F-Droid Weblate](https://hosted.weblate.org/projects/f-droid/),
contributors will see the page below.

![F-Droid weblate homepage for contributors]({% asset docs/translation-and-localization/F-Droid-weblate-homepage.png %})

It lists all the available languages that F-Droid and F-Droid projects are
available in. These are  the languages you can translate F-Droid to.

To translate F-Droid to a specific language, look for the language you are
interested in. Once you find it, click on the language. The page will redirect to
the translation overview of the selected language. Click the "Translate" button
to contribute translations.

![Weblate translations getting started]({% asset docs/translation-and-localization/webalte-translation-get-started.gif %})

Contributions to untranslated strings are preferred. Once on the translations
page, Click on the "Filters" and select "Untranslated strings; state empty "
from the drop-down menu. Add the translation to the textbox of your language.
Click on the "Save and Continue" button to move to the next entry.

![Weblate translate untranslated string]({% asset docs/translation-and-localization/weblate-translation-of-untranslated-string.gif %})

In the event you come across a word whose translation you don't know.
Skip the translation and move to another entry by clicking on the "Skip" button.

![Weblate skip translation]({% asset docs/translation-and-localization/weblate-skip-translation.gif %})

In case you made an error and would like to rectify a translation. You can go back
to the entry with the error and correct it.Click on the "Save and Continue" button
to save the translation. This is the same action taken to a string which has a translation
already and you'd like to edit the current translation.

![Weblate correct translation]({% asset docs/translation-and-localization/correct-incorrect-translation.gif %})

### Review of already added translations

Once a translation has been added, the translation can only appear on the
component once it has been reviewed and accepted by the reviewers of the
said language. These reviewers have the capacity to either approve a translation
or state that it needs editing.

The state of a translation can be seen in the "Review State" section in Weblate.

![Weblate review state]({% asset docs/translation-and-localization/weblate-review-state.png %})

Once a translation is added to a string,the "Review State"
radio button automatically switches to "Waiting for review".

For the translation to be accepted. The reviewer has to click the "Approved" radio
button. That is how a translation is accepted.

![Weblate approve translation]({% asset docs/translation-and-localization/weblate-save-and-accept-review.gif %})

In case a translation is not clear enough. The reviewer can suggest
a new translation.

![Weblate suggest translation]({% asset docs/translation-and-localization/suggest-edit.gif %})


### Adding a new language

First and foremost, Android must
[already support](https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/values/locale_config.xml)
the specific language and locale you want to add.  We cannot work with
languages that Android and the SDK do not support, the tools simply
break down.  Next, if you are considering adding a country-specific
variant of a language (e.g. _de-AT_), first make sure that the main
language is well maintained (e.g. _de_). Your contribution might be
useful to more people if you contribute to the existing version of
your language rather than the country-specific variant.

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
There are varying conditions for when the translations are included,
based on the limitations of each platform.


#### Android app

As a general rule, a translation must be at least 70% complete for it
to be included in a final release.  For alpha releases, we try to
include all translations, no matter how incomplete.


#### App summaries

_f-droid.org_ makes the one line summaries for many apps [available
for translation](https://hosted.weblate.org/projects/f-droid/fdroiddata/).
The goal is to make it possible to have sections where only a single
language is show, like the Latest Tab or the website sidebar.  These
are imported on a rolling basis, at least once a month.


#### f-droid.org website

For the f-droid.org website, it is a much more complicated system.  Each time
the website is updated, thousands of pages must be regenerated per-locale.
Since this setup [cannot](https://gitlab.com/groups/fdroid/-/milestones/6)
support lots of languages, we have to put stricter requirements on it.
The core strings must be fully translated to be included.  They also
must be maintained in order to stay included.  The documentation and
tutorials are very useful to have translated.  The blog posts are the
least important.  Each page must be fully translated before the
translated version will be shown, otherwise, the site will show the
original English.

In order for a new language to be added to f-droid.org, it must have:

* [Website](https://hosted.weblate.org/projects/f-droid/website) component: 100% translated
* [Website Pages](https://hosted.weblate.org/projects/f-droid/website-pages/) component: 100% translated
* [Data](https://hosted.weblate.org/projects/f-droid/fdroiddata) component: at least 10% translated
* A blog post announcing support for the new language with an explanation the translation team.

There is a [nightly build of the website](https://staging.f-droid.org)
that includes all translations on Weblate, no matter how complete they
are. This lets everyone see the progress, and means we can get new
languages working well before launching them.


## The old "Languages" preference

There are cases where having English as the fallback language is not
helpful.  For example, much of the world would prefer to fall back to
Chinese, Spanish, or Russian instead of English.  On Android 6.0 and
older, F-Droid provides a "Languages" setting inside the app so that
users can switch F-Droid to a different language.  Note that this
might not handle localized format properly, just the
language. Android 7.0 fixed this by allowing users to specify a list
of language+country "locales", ordered by importance to the user.
