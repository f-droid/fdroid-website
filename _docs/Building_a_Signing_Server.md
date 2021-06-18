---
layout: page
title: Building a Signing Server

---

The Android APK signing model sets the expectation that the signing
key will be the same for the entire lifetime of the app.  That can be
seen in the recommended lifetime of an Android signing key:
[20+ years](https://developer.android.com/studio/publish/app-signing.html#considerations).
On top of that, it is difficult to
[migrate an app to a new key](https://guardianproject.info/2015/12/29/how-to-migrate-your-android-apps-signing-key/).
Since the signing key is an essential part to preventing APKs from
impersonating another, Android signing keys must be kept safe for the
entire life of the app.

The F-Droid repo signing keys follow a very similar model: the signing
key is the essential way to safely identify an F-Droid repo. So the
same considerations apply to F-Droid repo signing keys as to APK
signing keys.  This also provides some really useful benefits.  Since
the integrity of the repo index file and the APKs are guaranteed by
the repo signature, the files can be delivered via whatever method is
most convenient, and their integrity will be automatically verified by
the F-Droid client app, the _f-droid.org_ deploy process, and Repomaker.

This means the security burden is shifted from the online, public
webserver to a private signing machine.  Just keeping that machine out
of the public eye goes a long way towards improving security.  There
are a number of additional measures that can be taken to further
improve the security of the signing process.  Here are some
approaches, starting with the easiest and least security, and going on
to more secure setups that require more work to setup and run.
Signing is not an resource intensive process, so any machine will
work, even a 10 year old, basic laptop.  We recommend using a minimal
[Debian](https://www.debian.org) install, and rebuilding the machine
from scratch.


### Automated Signing Server with HSM

For a fully automated signing setup, the machine running the signing
needs to be online and running. Ideally this machine would have no
remote access, at the very least remote access should be very
carefully controlled and monitored.  A laptop makes it easy to work
with even when remote access is disabled, since it provides a built-in
keyboard and monitor.  If remote access is required, then any basic PC
will work fine.  Using a Hardware Security Module (HSM) to store the
keys prevents them from being stolen if the server is broken into.  An
attacker could only run the signing process on that server.

Ideally, this machine would only be accessible via Tor.  That hides
the physical location of the server, and hides the traffic from
network.  This makes it much harder attackers to find the actual
machine to attack.

For the HSM, we recommend using [Nitrokey](https://www.nitrokey.com/)
hardware, since they are free software/hardware, and provide a wide
range of options.  Use a separate machine to put the signing keys on
HSM.  A good HSM will keep an audit trail of how many signatures have
been made, so that information could be used to create an automatic
auditing process to raise alarms if too many signatures have been
made.  That could mean that this server was breached and used to sign
unauthorized packages.

Another possibility is to use a setup like [Fedora](https://pagure.io/sigul)'s
[Sigul](http://www.devops-blog.net/koji/gpg-signing-rpms-with-sigul-signing-server-koji-integration)
that involves three machines.


### Basic laptop dedicated to signing

Start with a laptop that can be wiped clean and rebuilt from scratch.
What is most important is that only the essential software is
installed on it, and nothing else.  Do not include any browser at all,
for example, since that is the most common vector of attack.  No
remote access setup (e.g. SSH or VNC) should be installed or
configured.  To sign apps and repos, someone would take out this
laptop, connect it to the network, and run the signing process.  The
signed results can then be published via the network connection.  When
the signing is complete, the machine can be turned off and
disconnected and kept in a safe place.

This could be made quite automatic with some custom scripts.  The
person running the process would only need to take out the machine,
connect it, turn it on, wait until the process completes, then put it
all away again.


### Fully offline signing laptop with USB thumb drives

This process is based on the same basic, stripped down laptop as the
previous example.  But this time, the networking should be entirely
disabled before the install process.  For example, it is easy in many
laptops to physically remove the WiFi card.  Therefore, it makes sense
to use a laptop that does not include an ethernet jack, which are
usually not possible to remove.  Otherwise, blocklisting all kernel
modules related to neworking can suffice.  Since this machine is fully
offline, the extra work of using an HSM is not as important, but it
can't hurt to include it.

Download the full "CD" or "DVD" image of Debian to run the install.
Be sure to [verify](https://www.debian.org/CD/verify) the GPG
signatures and the SHA-256 hashes.  In order to update the offline
machine, an "[apt offline](https://www.debian.org/doc/manuals/apt-offline)"
setup is required.

To be extra careful, all of the software used should be verified.
Chromebooks are nice, cheap laptops that run Linux natively.  They
also use Coreboot for the BIOS.

* Buy a computer off the shelf with cash, avoid having it shipped, especially across borders
* Buy a Debian-supported [Chromebook](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/acer-c720-chromebook) with removeable WiFi hardware, and needs no binary blobs
* Install a reproducibly built Coreboot binary
* Install from a reproducibly built Debian image, wiping out Chrome OS entirely
  

## The Physical Environment

The last thing to consider is the physical location where signatures
happen, and where essential equipment is stored.  The signing
environment must be physically secure. Otherwise, there is no way to
prevent laptops or HSMs from being lost or used to sign inappropriate
content.  For the offline machines, keeping them in a locked room is a
good start.  For an online machine, forcing all network traffic and
remote access over Tor hides the physical location of the machine from
network observers.

For high risk signing keys, using multiple layers of defense is
important:

* Restricted physical access to HSMs or smart cards
* Security cameras
* On-site security guards
* Visitor logging
* A tools-resistant server safe for online code-signing servers

The signing server should be physically separate from the rest of the
infrastructure.  And the logs, machine, and network should be
periodically audited.


## Difficult decisions

Ideally all of these practices would be put into place, but each of
these security measures comes at a cost of difficulty, expense, and
complexity.  They can also delay the process of getting regular
updates out.  So there are risks of implementing too strict security
policies, much like the risks of not implementing enough.
