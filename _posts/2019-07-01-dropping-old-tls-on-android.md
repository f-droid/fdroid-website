---
layout: post
title: "Dropping old TLS on Android"
author: "F-Droid"

---

Transport Layer Security (TLS) is the protocol that powers most of the
internet these days.  It gives HTTPS the S for "Secure".  F-Droid uses
it to keep the connection to repos private.  After many years of slow
updates and an increasing number of vulnerabilities, there is finally
critical mass to stop using the old, broken versions.  TLS version 1.2
is not vulnerable and is supported basically everywhere.  TLSv1.2 was
finalized in 2008, so this is very far from the bleeding edge.
TLSv1.0 and TLSv1.1 are due to be officially deprecated by the IETF,
the standards body that actually creates the TLS standard.  The major
browser vendors have all promised to drop them in 2020.

Since F-Droid uses
[NetCipher](https://guardianproject.info/code/netcipher), TLSv1.2 is
supported all the way back to [Android
4.1](https://developer.android.com/reference/javax/net/ssl/SSLSocket#protocols)

One way to enforce TLSv1.2 support would be to configure the
f-droid.org webserver to stop supporting TLSv1.0 and TLSv1.1, like we
have with SSLv2 and SSLv3.  We prefer to do this on the client side
instead, so that old versions of F-Droid and old devices without
TLSv1.2 (added in Android 4.1) will continue to work with f-droid.org.
Also, doing it client-side means that connections to all repos will
gain this protection without changing the repos server setups.

With the _NetCipher_ approach, the latest versions of F-Droid will
never use TLS older than v1.2 since they will refuse to connect unless
TLSv1.2 is available.  Since _f-droid.org_ can still safely support
TLSv1.0 and TLSv1.1, older clients and Android devices will still be
able to connect, even if they do not support TLSv1.2.  It is win-win
for everyone.

This will mean that any repo will need to support TLSv1.2 to work with
F-Droid client from here on out. If a webserver does not support
TLSv1.2, it is really too old to be used safely anyway.  Even the
oldest supported Red Hat Enterprise Linux release (6) supports
TLSv1.2, and that was released in 2010.
