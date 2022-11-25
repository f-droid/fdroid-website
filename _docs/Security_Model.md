---
layout: page
title: Security Model

---

The security architecture is based on integrating models proven by
[Debian](https://wiki.debian.org/SecureApt) and [The Update
Framework](https://github.com/theupdateframework/specification/blob/master/tuf-spec.md)
 into what the Android OS already provides.  The way F-Droid operates is greatly inspired by de facto security model of how reputable GNU/Linux distros like Debian, Fedora, Ubuntu, etc. operate.  There is a big emphasis on operating in the public and making everything publicly available. We include source tarballs and build logs when we publish binaries.  These are archived as long as possible, for retroactive review.  And all of this is mirrored in many places across the internet by many different parties.

-   a repo is defined by having unique signing key, first and foremost
-   [HTTPS connections by default](https://gitlab.com/fdroid/fdroidclient/blob/v0.100.1/app/src/main/res/values/default_repo.xml#L11)
-   server only works over HTTPS, [HTTP](http://f-droid.org) is a redirect
-   [Android enforces](https://developer.android.com/studio/publish/app-signing.html#considerations) that all apps have a valid signature over the entire contents of the APK file 
-   [Android verifies updates](https://developer.android.com/studio/publish/app-signing.html#considerations) based on the signature of the installed app
-   [file integrity](https://gitlab.com/fdroid/fdroidclient/blob/v0.101-alpha2/app/src/main/java/org/fdroid/fdroid/installer/ApkCache.java#L57) protected by [signed metadata](https://gitlab.com/fdroid/fdroidclient/blob/v0.101-alpha2/app/src/main/java/org/fdroid/fdroid/RepoUpdater.java#L212)
-   As of [_index-v2_](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1092), files from the repo are verified based on SHA-256, including icons, screenshots, etc.
-   _index-v2_ uses any algorithm supported by [_apksigner_](https://gitlab.com/fdroid/fdroidserver/-/merge_requests/1134) and [_android-23_](https://developer.android.com/reference/java/security/Signature) and newer, and relies on OpenJDK's and Google's maintenance of the currently valid signing algorithms.  When _index-v2_ was launched, the signature algorithm in use was `SHA256withRSA` and the digest algorithm was `SHA-256`.  _index-v1_ is signed by `SHA1withRSA`.  As of this writing, SHA1 are still considered strong against [second preimage attacks](https://crypto.stackexchange.com/a/48291), which is what is relevant for index JARs.
-   Production signing is handled by [reproducible builds](https://tests.reproducible-builds.org/debian/rb-pkg/unstable/amd64/android-platform-tools-apksig.html) of _apksigner_ from Debian.
-   signed metadata includes hashes of [the app](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L460) and its [signing key](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L558)
-   [signed metadata generated on a separate machine](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L989) (which is fully offline for f-droid.org and guardianproject.info)
-   [public key for verifying metadata signatures built into F-Droid
    client
    app](https://gitlab.com/fdroid/fdroidclient/blob/v0.100.1/app/src/main/res/values/default_repo.xml#L13)
-   signed metadata includes
    [timestamp](https://gitlab.com/fdroid/fdroidclient/commit/02b2090e530ab5d22b522d978728f34bb332b390)
    and
    [expiry](https://gitlab.com/fdroid/fdroidserver/blob/0.6.0/fdroidserver/update.py#L775)
-   easy Tor support via Settings
-   [client-side HTTP “etag” cache check](https://gitlab.com/fdroid/fdroidclient/issues/562)
    so the ETag cannot be abused to track users
-   list of official mirrors included in signed metadata, then the
    client
    [chooses mirrors](https://gitlab.com/fdroid/fdroidclient/issues/35)
    based on availability and freshness based on local criteria like
    whether Tor is in use

While the current setup is already a solid platform, there are a
number of improvements that make sense to implement:

-   better handling of index expiry aka "max age"
-   [pinned TLS certificate built into the client
    app](https://gitlab.com/fdroid/fdroidclient/commit/0429b3f7dd4a6037fa11df64bfdd176ea378e6bf)

In order to defend against an attacker that holds the signing keys for
the app repository, there must be a trustworthy source of information to
compare against. Reproducible builds means that anyone with the same
source code will produce the exact same binary. When paired with an
auditing system, it is easy to catch malware inserted in the build
process, rather than the source code, like XCodeGhost. Reproducible
builds also makes it possible to have all builds of a release binary
have the exact same hash. Then any app repository can build apps only
from source code, and have a source of verification data from any other
app repository building the same app. Building software from source has
become cheap enough that many companies like gitlab.com and Travis CI
are offering free, automated build services in the cloud. Since the
whole F-Droid toolset is free software and designed to be easy to setup,
the barriers to setting up automatic auditing are quite low. People in
separate areas of the world with different risk profiles can run
[verification servers](../Verification_Server) to provide more
trustworthy information.

The security model of the [Build Server Setup](../Build_Server_Setup)
and the [Signing Process](../Signing_Process) are documented
separately.


## App signing

* Apps can be distributed using the [developer's own](../Reproducible_Builds) signatures when the builds are fully reproducible.
* By default, the "publish" server will generate and manage a signing key for each individual app.  These signing keys are only shared between apps when specifically configured to do so using the [_keyaliases_](https://gitlab.com/fdroid/fdroidserver/-/blob/886394c9a4909/examples/config.yml#L156) mechanism in _config.yml_.
* All apps are signed by [the key devoted to that app](https://gitlab.com/fdroid/fdroidserver/-/blob/2.1.2/fdroidserver/publish.py#L420) unless the upstream [specifically](https://gitlab.com/fdroid/fdroiddata/-/merge_requests/10240) requests multiple apps be signed by the same key, and the _fdroiddata_ maintainers approve it.
* For _f-droid.org_, all app signing is done on a dedicated, air-gapped, offline machine.
* At any time, the developer's own signatures may be added their app(s) in _f-droid.org_ once reproducible builds have been achieved.  Additionally, releases signed by the _f-droid.org_ key will continue to be shipped.
* In the official F-Droid client app, the developer's own signature is the default for fresh installs.
* We encourage app developers and maintainers to think about whether they want to use a special Application ID for the app when published in _f-droid.org_ to avoid conflicts with other versions.  One common pattern is to add `.fdroid` to the end of the Application ID via a Gradle Build Flavor.


## Initial Installs

Most users of F-Droid download the APK from _f-droid.org_ and install
it.  This is a potential vector of attack that built-in app stores do
not have.  Therefore, many additional security precautions are taken
to make it as hard as possible to exploit this vector.

* included on the
  [HSTS preload list](https://hstspreload.org/?domain=f-droid.org), so
  major browsers will only ever use HTTPS for all connections to
  _f-droid.org_
* a [strong](https://observatory.mozilla.org/analyze/f-droid.org#third-party) TLS/HTTPS configuration
* a [strong](https://observatory.mozilla.org/analyze/f-droid.org) HTTP Content Security Policy
* [PGP-signature]({{ site.fdroid_apk_download_url }}.asc) on the initial
  install [download link]({{ site.fdroid_apk_download_url }})
* automated
  [regular](https://gitlab.com/fdroid/fdroid-website/-/jobs/47503948)
  and [random](https://verification.f-droid.org/check-fdroid-apk)
  [auditing](https://gitlab.com/fdroid/fdroidserver/blob/dfbe114af3c4cef15ce3aa5e979d9f4684f2acbc/tests/check-fdroid-apk)
  that [F-Droid.apk]({{ site.fdroid_apk_download_url }}) has not been tampered with
* F-Droid Limited controls many potential phishing domains like
  [fdroid.org](https://whois.icann.org/lookup?name=fdroid.org),
  [f-droid.com](https://whois.icann.org/lookup?name=f-droid.com), and
  [f-dro1d.org](https://whois.icann.org/lookup?name=f-dro1d.org). (donations
  of more are welcome!)
* website is
  [statically generated](https://gitlab.com/fdroid/fdroid-website) to
  greatly reduce the attack surface
* website is fully functional when JavaScript is disabled in the
  browser, eliminating all possibility of XSS attacks


### F-Droid as built-in app store

When F-Droid is built into Android, either as part of the ROM or by
flashing an
[OTA update]({{ site.baseurl }}/packages/org.fdroid.fdroid.privileged.ota/),
it no longer needs "Unknown Sources" enabled to function.  This is the
preferred method of operation, so we aim to make it as easy as
possible for users to run F-Droid this way.  Flashing the OTA package
for F-Droid
[Privileged Extension](https://gitlab.com/fdroid/privileged-extension/#how-do-i-install-it-on-my-device)
has the same or lower risk profile as installing the standard "gapps"
package that many people flash onto custom ROMs. So this delivery
method does not increase the risk profile of those users.

On top of this, F-Droid makes it as easy as possible to
[build it into](https://gitlab.com/fdroid/privileged-extension/#how-do-i-build-it-into-my-rom)
ROM projects.  It is already included in
[CalyxOS](https://calyxos.org/),
[Replicant](https://www.replicant.us/),
[LineageOS for microG](https://lineage.microg.org/) and
[Fairphone Open](https://code.fairphone.com/projects/fp-osos/).


### Protecting against malicious contributor-generated data

The app descriptions are submitted by all sorts of people, and they
can also be taken from the app's source repository.  This data is
ultimately delivered to the Android client or the user's browser via
_f-droid.org_.

* the Android client never runs CSS, JavaScript, or dangerous HTML
tags since it displays HTML via
[`android.text.Html.fromHtml()`](https://gitlab.com/fdroid/fdroidclient/blob/1.3.1/app/src/main/java/org/fdroid/fdroid/views/AppDetailsRecyclerViewAdapter.java#L441)
with image loading disabled
* the _f-droid.org_ website protects against malicious and
CSS/HTML/JavaScript injection with a
[strict HTTP Content Security Policy](https://observatory.mozilla.org/analyze/f-droid.org).
* Repomaker filters the texts through Mozilla's
[_bleach_](https://github.com/mozilla/bleach) and has a good
[HTTP Content Security Policy](https://observatory.mozilla.org/analyze.html?host=repomaker.grobox.de).


## Security Audits

1. There was a quick, informal
   [security audit](https://dev.guardianproject.info/projects/bazaar/wiki/Initial_FDroid_Audit_by_pd0x)
   ([_archived_](https://web.archive.org/web/20170317154208/https://dev.guardianproject.info/projects/bazaar/wiki/Initial_FDroid_Audit_by_pd0x))
   done in 2013 by then graduate student Daniel McCarney aka _pd0x_.

2. The first "Bazaar" project funded by [Open Tech Fund](https://opentech.fund) included an
   [external public audit]({{ site.baseurl }}/2018/01/20/upcoming-security-audit.html)
   from [Cure53](https://cure53.de)

3. The second "Bazaar2" project funded by Open Tech Fund included an
   [external public audit]({{ site.baseurl }}/2018/09/04/second-security-audit-results.html)
   from [Radically Open Security](https://radicallyopensecurity.com/)
