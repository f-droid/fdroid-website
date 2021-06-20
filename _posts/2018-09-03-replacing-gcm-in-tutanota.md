---
layout: post
title: "How Tutanota replaced Google’s FCM with their own notification system"
author: "Ivan"
authorWebsite: "https://tutanota.com/blog/posts/welcome-ivan"
---

As mentioned in [This Week In F-Droid 17](https://f-droid.org/en/2018/08/16/twif-17-the-reproducible-builds-and-encrypted-e-mail-edition.html), Tutanota is now on F-Droid.

In this special post [Ivan](https://tutanota.com/blog/posts/welcome-ivan) from
Tutanota, tells us the story.

Hi, I'm Ivan and I am developing Tutanota to help build the web of the future
where our right to privacy is being respected. I believe that privacy should
not be a luxury for the rich and tech-savvy, it should be a basic human right.

GCM (or, how it’s called now, FCM, Firebase Cloud Messaging) is a service owned by Google. We at [Tutanota](https://tutanota.com/) used FCM for our old Android app. Unfortunately, FCM includes Google's tracking code for analytics purposes, which we didn’t want to use. And, even more important: For being able to use FCM, you have to send all your notification data to Google. You also have to use their proprietary libraries. Because of the privacy and security concerns that naturally go along with this, we did not send any info in the notification messages with the old app (which, understandably, led to complaints by our users). Therefore, the push notification in the old app only mentioned that you received a new message without any reference to the email itself or to the mailbox the message has been placed in.

<!--more-->

FCM is quite convenient to use, over the years Google made changes to Android which made it harder not to use their service for notifications. On the other hand, giving up Google's notification service would free us from requiring our users to have Google Play Services on their phones.

#### The challenge to replace Google’s FCM

The Tutanota apps are Libre software, and we wanted to [publish our Android app on F-Droid](https://tutanota.com/blog/posts/open-source-email). We wanted our users to be able to use Tutanota on every ROM and every device, without the control of a third-party like Google. We decided to take on the challenge and to build our own push notification service.

When we started designing our push system, we had several goals in mind:

* it must be secure
* it must be fast
* it must be power-efficient

We’ve made a research on how others (Signal, Wire, Conversations, Riot, Facebook, Mastodon) have been solving similar problems. We had several options in mind, including WebSockets, MQTT, Server Sent Events and HTTP/2 Server Push.

#### Replaced FCM with SSE

We settled on the SSE (Server Sent Events) because it seemed like a simple solution. By that I mean “easy to implement, easy to debug”. Debugging these types of things can be a major headache so one should not underestimate this factor. Another argument in favour of SSE was relative power efficiency: We didn’t need upstream messages and a constant connection was not our goal.

#### So, what is SSE?

SSE is a web API which allows a server to send events to the connected clients. It is a relatively old API which is, in my opinion, underused. I’ve never heard about SSE before looking at the [federated network Mastodon](https://joinmastodon.org/): They use SSE for real-time timeline updates, and it is working great.

The protocol itself is very simple and resembles good old polling: The client opens a connection, and the server keeps it open. The difference from classical polling is that we keep this connection open for multiple events. The server can send events and data messages; they are just separated by new lines. So the only thing the client needs to do is to open a connection with big timeout and read the stream in a loop.

SSE fits our needs better than WebSocket would (it is cheaper and converges faster, because it’s not duplex). We’ve seen multiple chat apps trying using WebSocket for push notifications and it didn’t seem power efficient.

We had some experience with WebSocket already, and we knew that firewalls don’t like keepalive connections. To solve this, we used the same workaround for SSE as we did for WebSocket: We send “heartbeat” empty messages every few minutes. We made this interval adjustable from the server side and randomised to not overwhelm the server.

#### Multi-account support poses extra challenges

It should be noted that the Tutanota app has multi-account support, and this posed a challenge for us: We wanted to keep only one connection open per device. After a few iterations, we’ve found the design that satisfied us. Each device has only one identifier. When opening the connection, the client sends the list of users for which it wants to receive notifications. The server validates this list against user records and filters out invalid ones.

Users may delete a notification token from their Settings but it would not affect other logins on this device. In addition to that, we had to build a delivery tracking mechanism when a notification is received. Unfortunately, we discovered that our server is unable to detect when a connection is broken so we had to send confirmations from the client side.

To receive notifications, we leverage Android capabilities. We run a background service which keeps the connection to the server open, similar to what the FCM process does. Another difficulty was caused by the Doze mode, introduced in Android M. The Doze, which is turned on after a period of inactivity, among other things prevents background processes to access the network. As you can imagine, this prevents our app from receiving notifications.

We mitigate this problem by asking users to make an exemption from battery optimisations for our app. It worked fairly well. The similar problem, but unrelated to Doze is vendor-specific battery optimisations. In order to prolong the battery life of their devices phone manufacturers, like Xiaomi, enable strict battery optimisations by default. Luckily users can disable them, but we must communicate this better.

Another problem was caused by the Android O changes. One of them is background process restrictions: Unless your app is visible to the user, your background processes are going to be stopped and you’re unable to launch new ones.

Initially we thought that we can solve this by showing a persistent notification with minimal priority, which is visible in the notification gutter, but not in the status bar. This didn’t work for Oreo: If you try to launch a background service and use priority minimum for its notification, the notification priority is upgraded to a higher priority (visible all the time) and, in addition to that, the system shows another persistent notification: “App X is using battery”.

We initially planned to explain users how they can hide these persistent notifications but that wasn’t a great user experience so we had to find a better solution. We leveraged Android Job mechanism to launch our service periodically (at least every 15 minutes), and we also try to keep it alive afterwards. We don’t hold WakeLocks manually – the system does this for us. We were able to ditch persistent notifications altogether. Even if notifications sometimes have a small delay, it will always be received and emails are there instantly.

In the end, we had to do some work but it was totally worth it. Our new app is still in beta but thanks to non-blocking IO, we’ve been able to maintain thousands of simultaneous connections without problems. We freed our users from Google Play Services requirement. Finally, everyone is able to [get the Tutanota app on F-Droid](https://f-droid.org/packages/de.tutao.tutanota/). The system now combines both: good power efficiency and speed.

#### Final thought: Every user should be able to choose a "Notification Provider" for every app

Wouldn’t it be great if the user could just pick a “push notifications provider” in the phone settings and OS managed all these hard details by itself? So every app, which doesn’t want to be policed by the platform owner, didn’t have to invent the system anew? It could be end-to-end encrypted between the app and the app server. There’s no real technical difficulty in that, but as long as our systems are controlled by big players who do not allow this, we have to solve it by ourselves.
