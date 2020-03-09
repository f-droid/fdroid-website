---
layout: page
title: Getting _logcat_ messages after crash

---

### What is _logcat_?

As an app runs, and particularly when it crashes, it sends some information to the Android system to help diagnose what caused the problem. If the F-Droid developers have access to this information, it provides lots of really good information to help find out what went wrong. This is in comparison to a generic error message such as "F-Droid crashed".

Many apps will automatically send crash report to the developer, but F-Droid does not. This is not a technical limitation, but rather a philosophical one. We try to connect to the internet only when necessary to perform what you asked us to: download and install apps. The downside of this is that we require a little bit of help from our users when they tell us about crashes. This article explains how to obtain _logcat_ files, which are the most important pieces of information you can provide to help us investigate and fix any bugs.

### How to find _logcat_ messages

There are two ways to get a _logcat_ message. The usual way will be to install an app on your device which knows how to access the _logcat_ information. Another way is to install the Android SDK on your computer and get the _logcat_ messages over USB or WiFi. 

#### Using an app on your device

For those who don't want to install software on their computers in order to get the _logcat_ messages, you can download an app such as:

* [aLogCat](https://f-droid.org/packages/org.jtb.alogcat/)
* [Logcat Reader](https://f-droid.org/packages/com.dp.logcatapp/)
* [Logs](https://f-droid.org/packages/com.tananaev.logcat/)

The general idea is to open the app, ask it to start recording _logcat_ messages, and then try and cause F-Droid to crash. Once it crashes, the _logcat_ app will save the error messages. These messages can then be copied and pasted in the [F-Droid issue tracker](https://gitlab.com/fdroid/fdroidclient/issues).

On Debian-ish things, try `apt-get install pidcat`, it has colorization and tab completion even!

#### Using the Android SDK

If you have the [Android SDK](https://developer.android.com/sdk/index.html) installed on your computer, then you will be able to use the [adb](https://developer.android.com/tools/help/adb.html) (command line) or [DDMS](https://developer.android.com/tools/debugging/ddms.html) (graphical app) tools when your phone is plugged in via USB and has “Debugging” enabled from the Android settings.

Once you have the SDK installed, and are able to use the adb tool, then run the following command:

    adb logcat

Depending on how many apps you have installed/running, it might be a little bit noisy. If you don't want to post all of that noise online (there is a slight chance that it contains information you don't want on the internet - if apps are logging private information to the log), then you can filter to only error messages with:

    adb logcat *:E

This information can then be posted to a GitLab issue to help developers diagnose the issue. When posting to GitLab, surround the log in three backticks (```) before, and three backticks after to format it correctly.
