---
layout: page
title: FAQ - Client

---

* Do not remove this line (it will not be displayed)
{:toc}

### The client shows a newer version. Why didn't it notify me of an update?

Assuming you have update notifications switched on (in Preferences) this
probably means the newer version is not *recommended* for your device.

In the list of versions in the client, the *recommended version* is
identified by a '\*'. This is the version which is closest to the
*current version* &ndash; the version that the developers of the
application publish to Google Play or their website, or tag in their
source code repository. There may be newer versions than this in the
list &ndash; they could be, for example, test or beta versions. You can
install these, but update notifications are not shown because the
Version Code (Android's scheme for version numbering) is greater than
the _CurrentVersionCode_.

For third-party repositories, it may also be the case that the
maintainers neglected to update the current version in their
repository's metadata.


### Why does F-Droid need these permissions?

F-Droid is an app store, that means it is already entirely responsible
for finding, downloading and installing apps. That means it already has
all permissions, in effect. For example, a malicious app store with no
permissions could modify every app as it installs it, granting itself
all permissions via those modified apps. This is why it is so important
that an app store is Free Software and publicly audited. F-Droid is
both. That said, F-Droid declares the permissions it actually uses so
that it is honest and transparent about what it is doing.

Here are the permissions that F-Droid current uses:

Download apps from f-droid.org and other app repositories

    android.permission.INTERNET

Start itself automatically at boot time so that it can receive updates:

    android.permission.RECEIVE_BOOT_COMPLETED

For app swap to get current WiFi status, and prompt the user to enable
WiFi when swapping:

    android.permission.ACCESS_NETWORK_STATE
    android.permission.ACCESS_WIFI_STATE
    android.permission.CHANGE_WIFI_MULTICAST_STATE
    android.permission.CHANGE_NETWORK_STATE
    android.permission.CHANGE_WIFI_STATE

For app swap to see the Bluetooth state, and prompt the user to enable
Bluetooth when swapping:

    android.permission.BLUETOOTH
    android.permission.BLUETOOTH_ADMIN

Read app repository URLs via NFC, for both swap and regular app
repositories:

    android.permission.NFC

Temporarily store downloaded files on the SD Card:

    android.permission.WRITE_EXTERNAL_STORAGE

Use F-Droid Privileged Extension which gives F-Droid system
&lt;code&gt;priv-app access. This improves security by
allowing automatic app updates as well as letting the user leave the
"Unknown Sources" setting off:

    org.fdroid.fdroid.privileged.USE_SERVICE

Use root access to install F-Droid Privileged Extension as a system
&lt;code&gt;priv-app:

    android.permission.ACCESS_SUPERUSER


### What is expert mode?

Enabling the 'Expert Mode' setting in Preferences will make the client
display additional information which is probably not useful to most
people. This includes things like package IDs and signature hashes. Some
extra configuration options also appear.


### I can download apps, but then "Install" is disabled. Why?

Some users have apps such as Twilight installed, which draw directly to
the screen regardless of what app is shown. For security reasons,
Android wisely doesn't allow apps to be installed when such apps are
running. If it did, then people could create apps that draw a fake
"Install" button over the top of the real one, resulting in users
installing unwanted apps. The solution is to disable such apps before
installing via F-Droid.

See [Issue 151](https://gitlab.com/fdroid/fdroidclient/issues/151) or
[this Google+
comment](https://plus.google.com/116713673773180618201/posts/UvW3tgSgdUp)
for more details.


### Why doesn't the client show the number of installs/downloads for each app?

To show how many people had installed an app, we would have to be spying
on them - in other words, keeping track of what apps people install and
uninstall on their devices, and sending that data back to ourselves. We
don't do that, and we're not going to do it.

Theoretically, the number of downloads is available via our web server
logs. However, this would be a meaningless figure because:

1.  I might download an app, and decide not to install it
2.  I might download and install it, then uninstall it immediately
    because I don't like it
3.  I might download my app 1,000,000 times to make it look popular

Additionally, on a technical level, we don't even track that
information. While the back-end server does track hits on each APK,
these are actually served up by multiple front-end servers that cache.
This means one counted hit could represent one download, or a million.
Theoretically we could resolve this, but we are not interested enough to
do so.

Finally, even assuming any of this information were available, what does
it actually mean? Are you going to use an app just because lots of
others do, or ignore it because few others have discovered it yet? Is
this a sensible way to decide whether something is useful to you or not?
Perhaps you should just try it.


### How do I send a Repo configuration using NFC?

Starting in v0.59, the F-Droid client supports sending repo
configurations via NFC. For this to work, both the sending and receiving
device must have NFC and be running Android 4.0 or newer.

1.  select **Repositories** in the menu on the main screen
2.  click on the repo that you want to send
3.  put the devices together until you get the NFC zoom prompt
4.  touch the screen with the selected repo
5.  click **OK** on the receiving device


### How can I send the F-Droid app using NFC or Android Beam?

Starting in v0.59, the F-Droid client supports sending the F-Droid app
itself to another device to set it up for the first time. For this to
work, both the sending and receiving device must have NFC, Android Beam,
and be running Android 4.1 or newer.

1.  go to the F-Droid main screen
2.  put the devices together until you get the NFC zoom prompt
3.  touch the screen with F-Droid installed
4.  keep the devices near each other until the beam completes
5.  on the receiving device, click the Android Beam notification and
    install F-Droid

### How can I send apps via Bluetooth or WiFi?

This is done using the 'Nearby' Tab in F-Droid (previously called 'Swap').
See [here](../../tutorials/swap) for a walkthrough.

### What is the security model that F-Droid uses?

The F-Droid security model started out with HTTPS connections and signed
metadata. It has been evolving, inspired by [Debian](https://wiki.debian.org/SecureApt), [The Update
Framework](https://github.com/theupdateframework/tuf/blob/develop/docs/tuf-spec.txt),
and other things. You can read about details here: [Security Model](../Security_Model).
