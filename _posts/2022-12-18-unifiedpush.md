---
layout: post
title: "UnifiedPush: a decentralized, open-source push notification protocol"
author: "UnifiedPush Team"
authorWebsite: https://unifiedpush.org
---

A modern Android smartphone relies on a lot of services, from app stores and calendars to messaging and push notifications. Most of them have open alternatives, but until now, the only option for push notifications was Google's proprietary service, *Firebase Cloud Messaging* (FCM). **UnifiedPush is a new alternative that allows you to get push notifications without being tied to a single company**.

Push notifications are essential to the modern mobile experience because they allow apps to communicate with users in real-time, even when not actively in use.
Relying on Google-provided push notifications is a concern for both privacy and independence. The proprietary FCM library cannot be included in F-Droid apps and relies on having Google services. As a result, it is common to see FOSS applications adopt a persistent direct connection between the application and the server as an alternative.


## The limitations of direct app-server connections

While it is technically possible for each application to connect to its own server and receive notifications directly, there are several reasons why this approach may not be practical or effective.

Establishing and maintaining a direct connection between an app and a server can be resource-intensive, which can strain the device's battery, CPU, and network resources.

* To minimize resource load, the operating system (OS) tries to suspend applications that are not actively in use. However, if each app actively maintains a server connection, the OS cannot suspend them.
* Multiple apps pinging their own servers at variable intervals can prevent the device from going into a low-power sleep mode, which can drain the device's battery faster.
* Giving one special app the ability to make priority connections minimizes these problems and allows for the OS to efficiently suspend other applications and go to sleep, saving resources and reducing battery consumption.
* As a developer, managing background services and optimizing connections can be complex and time-consuming. By using a push notification service, you can offload this responsibility to a dedicated app, allowing you to focus on other aspects of your app.

## How do I start with UnifiedPush, as a user?

Applications that support UnifiedPush can receive notifications via a dedicated UnifiedPush application that maintains a single server connection to receive all notifications. We call this "UnifiedPush application" a *distributor*; it distributes push notifications to other apps on the device. You can choose which distributor you want to use, self-host the server part, or even create your own. For more information on distributors, check out the [full list](https://unifiedpush.org/users/distributors/).

To use UnifiedPush on an application that supports it, you have to install and configure your distributor. You can use [UP-Example](https://f-droid.org/en/packages/org.unifiedpush.example/) as a simple test app.

![An animated SVG that shows how all distributors and apps are interchangeable and still work together through the UnifiedPush protocol]({% asset posts/2022-12-18-unifiedpush/animation-options.svg %})  
*All distributors are compatible with all apps*

### TL;DR on Android

The easiest way to set UnifiedPush up with an [application that supports it](https://unifiedpush.org/users/apps/) is to:

1. Install the [ntfy](https://ntfy.sh/#subscribe-phone) Android application; this is your distributor
2. Open it, and disable battery optimization for it
3. Turn on UnifiedPush in the application; it will detect ntfy automatically. (This step depends on the app's UX)


![A screenshot of the distributor selection screen showing Gotify-UP, Google Services, ntfy, UP-FCM Distributor, NextPush, NoProvider2Push]({% asset posts/2022-12-18-unifiedpush/distributor-selection.png %}){: style="max-height:50%;" }  
_When there are multiple distributors available (yes, I know I have too many :P), you can pick between them. When there's just one, it is automatically selected._

## How to add UnifiedPush support to my app, as a developer?

To add UnifiedPush support to your application, you first need to ensure that your server is UnifiedPush compatible: it must be able to send notifications to different endpoints, which are URLs pointing to various servers used by users. If your application uses a gateway to work with Google push notifications, modifying the gateway can make it compatible with UnifiedPush.

On the mobile app side, once the user enables UnifiedPush, you have to check for installed distributors on the user's device. The app should then prompt the user to select the distributor they want to use. Afterward, you can register with it.

The selected distributor will then send a new endpoint, which the application should forward to its server. Then, the app prepares to receive data sent to that endpoint by registering an Android BroadcastReceiver. This BroadcastReceiver handles the messages coming from your server (often a ping to fetch the notifications).

It is important to register the application with the selected distributor every time the application starts, in case they get out of sync. If the application receives the same endpoint again, it does not need to re-register it.

Most of this is handled by the UnifiedPush library. You can find more detailed instructions on [our documentation website](https://unifiedpush.org/developers/android/).

If you need help with implementing UnifiedPush in your app, we are happy to answer any questions you have on our [Matrix chat](https://matrix.to/#/#unifiedpush:matrix.org).

*Note: This blog post focuses on Android; instructions to add UnifiedPush support on a Linux application can be found [on our website](https://unifiedpush.org/developers/go_c/).*

## How does UnifiedPush work under the hood?

At its core, UnifiedPush is a specification. That specification is split into two halves:

* On the device (client) side, it defines an Application Programming Interface (API) to allow **any end-user application** (ex. your messaging app) to communicate with **any distributor application** (ntfy, NextPush, etc.)
* On the server side, the API describes how the **application server** (Matrix homeserver, Mastodon instance, etc.) sends messages to the **push server** (ntfy server, Nextcloud server, etc.).

Our client libraries and the reference proxies assist in implementing both sides of the specification, respectively.

To obtain a UnifiedPush endpoint (capability URL to send notifications to), the end-user application registers with the UnifiedPush distributor, which maintains a constant connection with the push server. Upon registration, the distributor provides the application with a unique URL pointing to the push server. This endpoint URL is then transmitted by the application client to the application server.

When the application server needs to send a push message to the end-user application, it sends the message to the push server with a simple HTTP POST request. The push server then forwards the push message to the distributor, which delivers it to the end-user application.

One key feature of UnifiedPush is that the communication between the push server and the distributor is not specified. This means that a variety of technologies can be employed, such as WebSockets, Server-Sent Events, XMPP, raw TCP, or even SMS, whatever works best for the user.

![An animated SVG showing a message moving through all the steps of UnifiedPush from the Application Server to the Push Server to (on the phone) Distributor app and the end-user application, which then wakes up and emits an Android notification]({% asset posts/2022-12-18-unifiedpush/animation-flow.svg %})

The distributor uses platform-specific IPC mechanisms, such as Broadcast Intents on Android or D-Bus on Linux, to wake the app and allow it to handle the push message. The app can then process the data and decide whether to show a notification based on the content. It is important to note that UnifiedPush does not handle the display of user-visible notifications; it only delivers data to the app. Consequently, apps can support notification features in various platforms without involvement from UnifiedPush or the server.

In cases where the application server does not natively support UnifiedPush, a Push Gateway can convert application-specific notifications to the UnifiedPush server protocol. Some popular Push Gateways, such as the one for Matrix, are integrated directly into push servers for self-hosting convenience. In addition, Rewrite Proxies are used in rare cases where the push server does not support UnifiedPush, such as the FCM distributor sending UnifiedPush-over-FCM.

![A static image showing all the components described above linking to one another]({% asset posts/2022-12-18-unifiedpush/detailed-component-diagram.png %})
_Push Provider = Push Server_

## Compatibility between UnifiedPush and WebPush

Now, you might be looking at the elephant in the room: WebPush (RFC8030). WebPush is the open standard that browsers use for their push notifications. And the good news is that UnifiedPush is WebPush compatible ... mostly.

Basically, application servers that support WebPush but *do not need its advanced features* and *do not restrict push to only popular WebPush servers* (those from browser vendors) should work without problems with UnifiedPush providers. We are working on solutions to ensure better and more stable WebPush support.

## Future plans

* The more apps that adopt UnifiedPush, the more useful it becomes. Currently, UnifiedPush is supported by many Matrix and Mastodon apps. We are also working on getting open-source versions of popular apps such as Telegram and Signal to support UnifiedPush.
* Improving WebPush support will also help to increase the number of apps that can use UnifiedPush. We are working towards better WebPush compatibility with UnifiedPush.
* What about built-in distributors in custom Android ROMs like Lineage OS or /e/OS (murena)? Their support could hugely accelerate UnifiedPush-support in the De-Googled community.
* Linux platforms can also benefit from UnifiedPush. Improving the Linux specification and increasing its adoption will help improve battery life and reactivity.
* As UnifiedPush is very flexible, some platforms could achieve even greater efficiency gains by using low-power hardware for the distributor: keeping it on the modem or a low-power core while the phone is asleep.

---

At the end of the day, if you use a Matrix or Mastodon app or one of the other [supported apps](https://unifiedpush.org/users/apps/) on Android, there's a good chance that you can use UnifiedPush to get your push notifications without relying on Google. You can start using UnifiedPush today by just installing [ntfy](https://ntfy.sh/#subscribe-phone) or [choosing another distributor](https://unifiedpush.org/users/distributors/).

If you are an app developer interested in your app receiving push notifications when installed from F-Droid and allowing your users to have independent, self-hosted infrastructure, check out UnifiedPush and feel free to [talk to us](https://matrix.to/#/#unifiedpush:matrix.org) if you have any questions!

