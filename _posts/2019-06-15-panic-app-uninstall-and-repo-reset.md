---
layout: post
title: Panic app uninstall and repo reset
author: "eighthave"

---

Sometimes we have things on our devices that are very sensitive, so
much so that we need to completely hide or delete them in emergencies.
F-Droid already supports receiving
[PanicKit](https://guardianproject.info/code/panickit) triggers to
make F-Droid hide itself.  F-Droid v1.7 adds more alpha features to
expand the range of options of what F-Droid can do in response to
panic situations.  We think these can be very valuable for many users,
but keep in mind, these features are alpha.  They are functionally
complete, but they need to be widely tested before we can call them
stable.  Specifically, the user experience should clearly communicate
what kinds of data will be permanently deleted, and what kinds of data
might still be left around afterwards.

<p align="center">
<img width="200" src="{% asset posts/2019-06-15-panic-app-uninstall-and-repo-reset/screenshot_ripple.png %}" />
<img width="200" src="{% asset posts/2019-06-15-panic-app-uninstall-and-repo-reset/screenshot_fdroid_destructive0.png %}" />
<img width="200" src="{% asset posts/2019-06-15-panic-app-uninstall-and-repo-reset/screenshot_fdroid_destructive1.png %}" />
</p>


## Full wipes of selected apps

F-Droid now allows the user to choose any installed app to be
uninstalled in response to a panic trigger.  Uninstalling will wipe
that app's internal data, permanently deleting it.  It might not wipe
data that apps store on external storage, like images, videos,
downloaded documents, etc.  To ensure those are wiped, a separate
panic response app is required. It is essential to have a complete,
tested backup before trying this new feature.

Any app that F-Droid can uninstall can be included, including 
[Ripple]({{  site.baseurl }}/packages/info.guardianproject.ripple)
and F-Droid itself.  So the whole panic setup could be wiped as part
of the response.  This requires [F-Droid Privileged
Extension](https://f-droid.org/packages/org.fdroid.fdroid.privileged.ota/)
be installed on the device, in order to uninstall apps without a
prompt for each app.  Android ROMs like
[CalyxOS](https://calyxos.org/), CopperheadOS,
[Fairphone Open](https://code.fairphone.com/projects/fp-osos/),
[Replicant](https://replicant.us/), and [LineageOS for microG](https://lineage.microg.org/)
all include F-Droid Privileged Extension.


## Reset repos to default

The repo configuration can also contain sensitive information.  For
example, there might be a custom repo on a private server, or a
specific app repo, like Briar or Tor, that is included to ensure the
quickest updates.  Therefore, there is now also an option to reset the
repo configuration to defaults.  Remember to backup your repo
configuration before trying this.  The repo URLs can be individually
shared from the "Repo Details" view, or they are included if you share
the install history, after enabling that option in "Expert Mode" in
Settings.


## Built-in panic button

This round of work includes a new prototype for embedding _PanicKit_
directly into Android.  Android 9.0 Pie introduced a new "lockdown"
mode which follows some of the patterns laid out by _PanicKit_.  There
is an _Enter lockdown_ button available on the power button menu, so
it is rapidly available.  This is a great panic trigger button, and
there is a prototype of a "System Settings" app that lets users connect
the full flexibility of _PanicKit_ responses to this _Enter lockdown_
button.  The functionality that Google links to this new button is
extremely limited, it seems to be a [one time restriction on how you
login](https://www.androidpolice.com/2018/03/08/android-p-feature-spotlight-new-lockdown-option-power-menu-turns-off-fingerprint-unlocking-something-called-extended-access/).
The _PanicKit_ responses are in addition to what Google
included. CalyxOS is
[working](https://gitlab.com/calyxos/calyxos/issues/72) to integrate
this, look for test releases soon!

<p align="center">
<img width="250" src="{% asset posts/2019-06-15-panic-app-uninstall-and-repo-reset/Screenshot_1559551039.png %}" />
<img width="250" src="{% asset posts/2019-06-15-panic-app-uninstall-and-repo-reset/Screenshot_1559551407.png %}" />
</p>
