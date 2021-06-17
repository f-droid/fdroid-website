---
layout: post
title: "OpenPush - A Free, Decentralized Push Messaging Framework for Android"
author: "Bubu"
authorWebsite: "https://bubu1.eu"
---

Push messages are an essential part of connected mobile devices. They are also one of the critical missing pieces in the open source Android ecosystem. Until now, free Android apps would either need to implement their own push notification system, do without any push messaging or use the proprietary Google Cloud Messaging service.

We expect both a long battery life and instant notifications from our mobile devices. When implementing your own mobile push functionality you can usually optimize for either of these goals. This is especially true if the user is running multiple applications which each come with their own persistent on-going connection for push notifications. Wanting to combat the battery drain associated with maintaining multiple connections Google introduced the Google Cloud Messaging (GCM) framework which recently has become Firebase Cloud Messaging (FCM). Firebase Cloud Messaging relies on the availability of the proprietary Google Play Services Framework on an Android device. Using FCM also requires the inclusion of the proprietary FCM client library into open source Android apps like Signal, Wire or even Firefox, which makes them effectively non-free software which cannot be distributed via the fully free F-Droid software repository. Additionally all push notifications delivered via FCM need to pass through Google's servers leaving a metadata trace, even if it's an empty wakeup event or if the content of the message is encrypted.

Decentralized, self-hosted systems like Matrix, Nextcloud or RocketChat currently still have a dependency on Google's infrastructure and Terms of Service for delivering push Notifications. The F-Droid versions of these apps need to fall back on more inefficient polling or even lack any support for notifications.

[OpenPush](https://bubu1.eu/openpush) is a self-hosted, free alternative push messaging implementation which can either run alongside or as a replacement to FCM. 

OpenPush was presented at [FOSDEM](https://fosdem.org/). The talk gives a general architecture overview as well as walks through the design and implementation challenges of a push messaging service.

<a class="video-preview" href="https://video.fosdem.org/2020/UA2.220/dip_openpush.webm">
    <img src="{% asset posts/2020-02-03-openpush-talk/video-preview.png %}" />
</a>

* Link to FOSDEM [talk page](https://fosdem.org/2020/schedule/event/dip_openpush/)
* Link to [slides](https://bubu1.eu/openpush/openpush_fosdem20.pdf)
* [Project Homepage](https://bubu1.eu/openpush)
