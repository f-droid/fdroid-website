---
layout: page
title: Hide F-Droid
---

Sometimes you may want to hide F-Droid app for some reasons. F-Droid 1.x version has a function to change the app icon in the launcher to a calculator. A real calculator is opened from the icon and you can input a secret code to get F-Droid back. Sounds interesting, right? But if you long press on the calculator icon and open the app info, you can see the app name and the icon which are not changed. There is not too much an app can do to hide itself. But there are some alternative approaches which work better. Do note that these tricks can't trick a professional checker. If you really want to hide something, just destroy your device completely. Always choose the approach based on the threat mode, there is no perfect approach for everyone.

## Hide the icon from the launcher

Many launchers support hiding apps from the drawer. It's likely the stock launcher supports it. If it's not supported in the stock launcher, you can get one from F-Droid, e.g., the Kiss Launcher. In different launchers the UI is different. Generally you can choose some apps in the settings of the launcher and they won't show in the drawer. You can still add them to the home screen and remove them quickly. If the checker only checks the app list in the launcher, this approach works. But if the checker checks the app list in system settings, then they can still find all the installed apps.

## Install the app in Private Space

Private Space is a new feature added in Android 15. You can install F-Droid in Private Space and it won't shown in the launcher nor the app list in the system settings when Private Space is locked. But the check can still force you to open Privacy Space though - if they can force you to open the phone, they can force you do open Privacy Space. You can even hide the Private Space entry from the launcher so that it's not shown unless you input a keyword in the search bar. However, the current implement in AOSP doesn't support custom keyword so if the checker know this function, they can open Privacy Space. Some custom system support similar but more powerful functions, e.g., in some systems, you can set a different pin or fingerprint to open the private space from the lock screen directly. If your system support such functions, you can have a try.
