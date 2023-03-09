---
title: VPN trust requires free software
author: eighthave
layout: post
---

VPNs have become popular and are often touted as a tool to improve privacy.  While this is sometimes true, it is important to tread carefully when choosing an VPN.  A good place to start is looking at which VPN providers meet the [requirements](https://guardianproject.info/2023/02/28/steps-towards-trusted-vpns/) for running a trustworthy VPN service.  A trustworthy VPNs must be free software, that is non-negotiable.  First, inspection is required in order trust software.  Having the source is the only way to see all the things the software is doing.  F-Droid reviews the apps that we ship on this website, which lets us spot potential issues and anti-features.  And we are happy to hear that reputable VPN providers make the effort to get their apps on f-droid.org to build trust with their users.  From there, [Reproducible Builds]({{ site.baseurl }}/docs/Reproducible_Builds) provides a strong link between the source code and the actual app binaries that run on the device.

The best VPNs are the ones that use free software both for the client app, and for running the services.  Indeed all OpenVPN, Shadowsocks, and WireGuard VPNs are based on free software since those standards are defined by free software projects.  F-Droid looks into this as part of the reviews, and marks apps with relevant Anti-Features, like the [Non-Free Network Services](https://f-droid.org/docs/Anti-Features/#NonFreeNet) mark if the server side is not free software.  And there are a number of free software projects that make it a lot easier to setup and run a VPN or proxy services.  Here are some that are on f-droid.org:

* [Bitmask](https://f-droid.org/packages/se.leap.bitmaskclient/) is a generic client for the [LEAP](https://leap.se/) VPN setup which powers [Calyx VPN](https://f-droid.org/packages/org.calyxinstitute.vpn/), [Riseup VPN](https://f-droid.org/packages/se.leap.riseupvpn/), and more.
* [eduVPN](https://f-droid.org/packages/nl.eduvpn.app/) is a VPN client for [Let's Connect](https://www.letsconnect-vpn.org/) VPN setup which powers [eduVPN](https://www.eduvpn.org/).
* [OpenVPN for Android](https://f-droid.org/packages/de.blinkt.openvpn/) is a generic OpenVPN client for any VPN provider that offers it.
* [Outline](https://f-droid.org/packages/org.outline.android.client/) is an offering designed to let anyone run their own VPN based on Shadowsocks.
* [WireGuard](https://f-droid.org/packages/com.wireguard.android/) is a generic [WireGuard](https://www.wireguard.com/) client for any provider that offers it.

So far, none of the VPN providers have taken the plunge into fully supporting reproducible builds. There is some progress: some of the releases of [WireGuard](https://verification.f-droid.org/com.wireguard.android.json), [Tailscale](https://verification.f-droid.org/com.tailscale.ipn.json), and [Mysterium VPN](https://verification.f-droid.org/network.mysterium.vpn.json) have been reproduced on our verification server.  But these apps are not setup for the full reproducible publishing setup, which confirms that the f-droid.org version matches the upstream developer's version exactly, then publishes with the upstream signature.  The F-Droid community is helping more and more apps achieve reproducible builds, which VPN app will be the first?

There are also a number of apps that are dedicated to a given provider.  Although there are generic clients available, there are good reasons for a free software provider to ship a custom app.  First, it can make configuration dead simple.  Calyx VPN and Riseup VPN have no accounts at all, so just install the app, and turn on the VPN.  Second, it allows the provider to include multiple methods of connecting and automatically switch between them, depending on what works best.  We decide which apps to include based on what is best for the users.  A VPN client that offers no additional functionality and just serves as a rebrand of an existing client does not serve users well.  In order for an app from a specific provider to be included, it must provide real value to our users.  Here is a list of some related examples:

* [IVPN](https://f-droid.org/packages/net.ivpn.client/)
* [Lavabit Encrypted Proxy](https://f-droid.org/packages/com.lavabit.pahoehoe/)
* [Mullvad VPN](https://f-droid.org/packages/net.mullvad.mullvadvpn/)
* [Mysterium VPN](https://f-droid.org/packages/network.mysterium.vpn/)
* [ProtonVPN](https://f-droid.org/packages/ch.protonvpn.android/)
* [Purism Librem Tunnel](https://f-droid.org/packages/one.librem.tunnel/)

We also get lots of direct messages asking us to include various proprietary VPN apps, or promote various VPN services for a fee.  That is of course a non-starter.  The first step is free software.
