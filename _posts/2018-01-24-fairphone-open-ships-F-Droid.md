---
layout: post
title: "Fairphone Open ships F-Droid Privileged Extension!"
author: "eighthave"
authorWebsite: "https://forum.f-droid.org/u/hans"
---

Fairphone has taken a
[big step](https://www.fairphone.com/en/2018/01/23/f-droid-auto-updates/)
towards making a fully free Android phone!  They already have
[Fairphone Open](https://www.fairphone.com/en/2016/04/28/releasing-the-fairphone-2-open-operating-system-2/),
an alternate version of Android that does not include any proprietary
apps.  The built-in Fairphone Updater makes it really easy to switch a
Fairphone away from the Google Android version to Fairphone Open.  And
now, Fairphone Open includes F-Droid!  That means it is a fully
functional device, removing the requirement to flash extra packages to
get an app store.  It also means that F-Droid works without enabling
"Unknown Sources".  Then your Fairphone Open can automatically update
apps and it'll have a smoother install experience where you just need
to press install once, and the whole process will finish in the
background (when you are ready for background updates, go to F-Droid's
Settings to enable them).

F-Droid support in Fairphone Open is still beta, so for now, only
[Privileged Extension](https://gitlab.com/fdroid/privileged-extension/#f-droid-privileged-extension)
is built into Fairphone Open. So you will still have to download
F-Droid and install it as a regular app.  It will automatically find
and use the Privileged Extension built into Fairphone Open.  We are
working on an F-Droid installer as part of the Fairphone Updater to
make that process really easy.

For now, these are the steps you need to do to have the full F-Droid
experience with Fairphone Open:

1. download [F-Droid.apk](https://f-droid.org/F-Droid.apk) and [verify](https://f-droid.org/F-Droid.apk.asc) it
2. enable "Unknown Sources" in Settings -> Security
3. find _FDroid.apk_ in Downloads and click to install it
4. confirm the install on the system's install screen
5. disable "Unknown Sources"
