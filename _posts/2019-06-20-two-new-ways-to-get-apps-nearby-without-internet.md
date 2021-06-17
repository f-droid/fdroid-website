---
layout: post
title: "Two new ways to get apps nearby, without internet"
author: "eighthave"

---


There are many reasons why it is often better to do things without the
internet:your data plan is expensive, there is limited coverage in the
area, there is an internet outage or shutdown, or even something is
private and should not be online at all.  Or even, if you are setting
up a new device, you can easily send all your existing apps over to
the new device.  This is why F-Droid has included the "Nearby Tab" for
swapping apps and files without internet.  F-Droid v1.7 includes a
major overhaul of the existing functionality, so it should work a lot
better now, especially when using Wi-Fi.  Two new "nearby" methods
were added on top of that, to provide effective ways of exchanging
apps between devices.

The first is "hotspot" mode, where one device is acting as a Wi-Fi
Access Point.  Android does not make it easy to do, since apps cannot
always known what the state of the Wi-Fi is.  Thanks to the
[_accesspoint_](https://github.com/mvdan/accesspoint) library from
long time F-Droid contributor @mvdan, it can do a lot more.

<p align="center">
<img width="225" src="{% asset posts/2019-06-20-two-new-ways-to-get-apps-nearby-without-internet/0-usb-otg.jpg %}" />
<img width="180" src="{% asset posts/2019-06-20-two-new-ways-to-get-apps-nearby-without-internet/1-handle-usb.png %}" />
<img width="180" src="{% asset posts/2019-06-20-two-new-ways-to-get-apps-nearby-without-internet/2-click-to-scan.png %}" />
</p>

The second is using SD Cards and USB On-The-Go (OTG) flash drives as a
source of F-Droid repos.  Flash drives can provide a very high
bandwidth method for transferring files, when they are easy to move
from device to device.  Our goal is to make the whole user experience
as smooth as possible, so people can regularly move data with these
affordable, widespread data buckets.  USB-OTG and SD Cards can host
standalone repos as well as mirrors of existing repos.  Those repos
need to be copied to the flash drive first, like from a laptop.  That
can be done using `fdroid mirror`, for example:

```console
$ cd /media/user/F-DROIDORG
$ fdroid mirror https://guardianproject.info/fdroid
$ wget https://guardianproject.info/fdroid/repo/index-v1.jar
$ mv index-v1.jar fdroid/repo/
```

USB OTG support is new and alpha.  It works, but needs a lot of polish
on the user experience.  For example, it should show the scanning
progress.  Also, Bluetooth is still flaky on many devices, some of that
comes from the devices poor support for generic data service over
Bluetooth.

