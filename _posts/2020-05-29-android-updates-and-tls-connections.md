---
layout: post
title: "Android updates and TLS connections"
author: "ByteHamster"
authorWebsite: "https://github.com/ByteHamster"
---

Android device vendors are known for their short support periods. They only provide updates for a limited time or even ship devices with old Android versions. Developers then have to deal with a fragmented distribution of Android versions. Android 4.x is still used by around 2% of the active devices on Google Play. Old phones usually still have decent performance and updating them with Custom ROMs makes them well-suited even until today. Unfortunately, not all devices support Custom ROMs and not all users want to deal with the trouble of installing one.

[AntennaPod](https://antennapod.org/) is an open-source podcast manager for Android that I maintain. AntennaPod does not rely on a centralized server but fetches the podcast feeds directly using the device. This is pretty nice for user's privacy because nobody gets a full list of your subscriptions. Unfortunately, more and more users with old Android versions experience problems with some podcast feeds. The reason is that servers are updated to more recent TLS versions that are not available on those devices. Upgrading the TLS version of servers is definitely a good thing because it makes the communication more secure. That's why most browsers ship their own stack that they can update independently of the device vendors. Unfortunately, all other apps that are dependent on connections to many servers out of their control, like AntennaPod, still experience issues. Users then see download errors like the following: `Failure in SSL Library, usually a protocol error`. This is pretty bad because it prevents users from listening to podcasts. While this is basically the device vendor's fault, it ultimately backfires on app developers.

`TLSv1.1` and `TLSv1.2` are supported starting with Android 4.1 and were enabled by default in Android 5.0. There also is a number of Cipher suites and certificates that are not supported in Android 4.x. While this problem currently only affects Android 4.x users, more will follow in the future as servers are upgraded to `TLSv1.3`. `TLSv1.3` was first shipped with Android 10, which runs on about 8% of the active devices on Google Play. You can find more details about the SSL support in Android on the [SSLSocket reference page](https://developer.android.com/reference/javax/net/ssl/SSLSocket). Developers now have to deal with the fact that vendors neglect software updates.

This is a known problem, so Google published a library called `ProviderInstaller`. It's pretty easy to use (`ProviderInstaller.installIfNeeded(context);`) and fixes all those problems instantly. Because the provider is kept up-to-date independently of the app using Google Play Services, app developers do not need to worry about this anymore.

This sounds too good to be true, doesn't it? Well, Google's `ProviderInstaller` has a pretty big drawback. The library is closed-source, so it can not be used for apps published on F-Droid. AntennaPod currently builds with two different flavors: one that is 100% free software for F-Droid and one with the `ProviderInstaller` library for the Google Play Store. This means that the F-Droid users are left behind. They still experience connection problems to some servers and consider this a bug in AntennaPod.

An alternative that works with F-Droid is to include the open-source library [`Conscrypt`](https://github.com/google/conscrypt/). Bundling the library in AntennaPod was first proposed by @Slinger in a [pull request for AntennaPod](https://github.com/AntennaPod/AntennaPod/pull/4077). While bundling `Conscrypt` with an app is just as easy as using Google's `ProviderInstaller`, it has two major disadvantages:

* App developers are forced to update the provider regularly. This is additional work for the maintainers and might cause trouble with apps that have a slow development cycle.
* Bundling `Conscrypt` increases the apk size. In case of AntennaPod, this means that the app gets around 4 MB bigger, which is a 40% increase just for this mostly invisible change. Now consider that every app would have to do that in order to get an updated TLS stack. If every app on F-Droid that deals with networking needs to bundle additional 4 MB of TLS libraries, this would increase storage usage noticeably.

Fortunately, there is a solution for this! The idea is to write an open-source provider application (just like Google's provider) that does nothing but bundling `Conscrypt` and providing a stable API that allows other apps to load it. It can then be updated independently of apps like AntennaPod or F-Droid. The provider app could simply have a class with something like this:

```java
public static void install() {
    Security.insertProviderAt(Conscrypt.newProvider(), 1);
    Log.d(TAG, "Provider installed.");
}
```

We could then develop an open-source library that uses the `ClassLoader` to include the `Conscrypt` library from the provider app.

```java
Context targetContext = context.createPackageContext("com.bytehamster.providerinstaller",
        Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
ClassLoader classLoader = targetContext.getClassLoader();
Class installClass = classLoader.loadClass("com.bytehamster.providerinstaller.ProviderInstallerImpl");
Method installMethod = installClass.getMethod("install", new Class[]{ });
installMethod.invoke(null);
installed = true;
```

Code samples are also available (and a bit more detailed) on [GitHub Gist](https://gist.github.com/ByteHamster/f488f9993eeb6679c2b5f0180615d518).

Obviously, just including code from another app is a security risk. By including the provider, you execute foreign code in the context of your application. How do you verify that the provider is not malicious? There are some ways to verify that the provider can be trusted:

* Let a trusted application be the provider. The F-Droid application itself could bundle the provider, keep it updated and provide the stable API. Apps could then hard-code the F-Droid package name and verify its signature. The problem with this approach is that users who build F-Droid themselves or use alternatives like [G-Droid](https://f-droid.org/de/packages/org.gdroid.gdroid/) could not use the updated libraries.
* The library could query the Android system for compatible `Conscrypt` provider apps and include one of them. To make sure that this is secure, it would be possible to only include the provider if it is a system app. Then the F-Droid privileged extension could bundle and provide `Conscrypt`. Many F-Droid users probably do not use the privileged extension though, so we could still not reach all users.
* To me, the best solution seems to have a standalone app (like `org.fdroid.securityprovider`) that provides `Conscrypt`. This was also discussed on the [F-Droid Forum](https://forum.f-droid.org/t/lack-of-tls-1-2-breaking-apps-in-older-androids/9823) and originally suggested by `@bubu`. A trusted entity like F-Droid could build the provider and sign it with their keys. Those could then be verified by the calling apps that want to include `Conscrypt`.

I would love to see some movement in this direction. We should definitely explore the possibilities of a fully open-source security provider app. Unfortunately, I am pretty busy with maintaining AntennaPod. I am therefore not able to maintain the library and installer app. There is a proof-of-concept available on [GitHub Gist](https://gist.github.com/ByteHamster/f488f9993eeb6679c2b5f0180615d518) but it misses security checks. Also, it would probably be good to add some simple ways to prompt users to install the provider on TLS failures. If you are interested in making an open-source provider possible, have a look at the [F-Droid Forum](https://forum.f-droid.org/t/lack-of-tls-1-2-breaking-apps-in-older-androids/9823).

Some notes:

* This post was written from an app developer's perspective. I try to make AntennaPod work best for all users, including those with Android 4.x. From a user's perspective, you should think about whether you still want to use old Android versions like 4.x. Android 4.4 was released in 2014, which is 6 years ago. Many critical security issues have been fixed since then. Exposing such an old device to the Internet might be a pretty big security risk, independently of the TLS libraries that are included in apps.
* Before looking into this, I did not know that you can use `ClassLoader` to execute other app's code. This is pretty nice and can be used for things like plugins. I would love to see what other developers build with that.
