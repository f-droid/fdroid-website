---
title: Third Audit Results
author: eighthave
layout: post
---

We received an audit on the new "index-v2" work in  official Android client app + API (3 days) and the new front end webserver setup (1 day).  There were no findings for the webserver setup, so the analysis in this post deals with the F-Droid client app.  The audit was conducted by [Radically Open Security](https://www.radicallyopensecurity.com), which is a natural partner for F-Droid since they share a focus on free software and open processes.  Thanks to [NLnet](https://nlnet.nl) for finding the auditor and covering the costs of hiring them.  We are making the original report available for [download]({% asset posts/2022-12-22-third-audit-results/report_nlnet-ngip-trackingthetrackers.pdf %}).

This post was written in the spirit of transparency with technical detail about the risks of each vulnerability.  We welcome further scrutiny.  For more information about F-Droid's security practices, see the
documentation about the [Security Model]({{ site.baseurl }}/docs/Security_Model/).



## CLN-002 -- XML parsers might be vulnerable to XXE attacks

* Vulnerability type: Input validation
* Threat level: Elevated

The application's XML parser implementation might be vulnerable to XML External Entity (XXE) attacks.

#### Impact

If the XML parser has no restrictions for external and internal entities, then this might lead to arbitrary file disclosures or server-side request forgery (SSRF) vulnerabilities when XML input is parsed.

### Our Response

The original index file, the version 0 format, is an XML file generated as part of any repo.  It is available at either _index.xml_ or the more recent signed version at _index.jar_.  Recent versions of the client will always try _index-v1.jar_ first, which is a signed JSON format.  If that is not available, the client will fallback to _index.jar_.  _index.jar_ is also used for the "nearby" app swapping functionality.  All of these _index.jar_ files must pass the signature verification before the XML is parsed.

Successful exploitation of this would require either a) the attacker was able to get the target to add a malicious repo, or b) the attacker was able to get the repo signing keys and then break into an existing repo's server and replace the index files.  For example, a malicious actor could try to exploit someone via Nearby app swapping, so only get apps from people you trust.  The way that the client is set up to parse the XML was vulnerable, and would allow a successful attacker to read files that the F-Droid app can read

For f-droid.org and the Guardian Project repo, the index files are monitored, and changes to them are logged. So we can say with high confidence that _index-v1.jar_ was never removed, which is a prerequisite for exploiting this vulnerability.

F-Droid client v1.15.4 disables all support for XML External Entities. The v1.16-alpha0 no longer supports XML indexes at all, and all code related to the XML index parsing and generation was removed.  We will also be working on improving the security of adding repos as part of the [FFDW-DVD]({{ site.baseurl }}{% post_url 2022-02-05-decentralizing-distribution %}) funding.


## CLN-005 -- Vulnerable TLS versions accepted

* Vulnerability type: Insecure configuration
* Threat level: Elevated

The backend domains used by the application accept obsolete TLS 1.0 and TLS 1.1 protocols.

#### Impact

Use of TLS 1.0 and 1.1 make the communication susceptible to downgrade attacks, as they work on SHA-1 hash for the integrity of exchanged messages. The handshake authentication is also done on SHA-1, which makes it easier for an attacker to impersonate a server for MITM attacks. The PCI DSS (Payment Card Industry Data Security Standard) specifies that TLS 1.0 may no longer be used as of June 30, 2018, and also strongly recommends disabling 1.1, so this may impact compliance with regulations.

### Our Response

F-Droid places a high importance on maintaining compatibility as long as possible.  This is why we leave TLS 1.0 and TLS 1.1 enabled on our websites.  We believe there is no added risk for people who keep their software updated.  The F-Droid Client app does not allow TLS 1.1 or 1.0 connections.  TLS 1.3 provides good downgrade protection, TLS 1.2 less. Any reputable TLS implementation from the past years make it quite difficult to force a connection to use TLS 1.0 or 1.1.  [Recent browser releases](https://knowledge.broadcom.com/external/article/195935/major-web-browsers-removing-support-for.html) are entirely removing support for TLS 1.0 and 1.1 anyway.  That means that any browser or client version that connects over TLS 1.0 or 1.1 actually needs that to function.  A device running Android 1.6 should be able to install an old version of F-Droid, and have a working app store.

If you are on a device that still needs to use TLS 1.0 or 1.1, then there are already so many well known security vulnerabilities that this one is not particularly interesting.  If you would like to test whether your browser still supports TLS 1.0 or 1.1, click on the links below and see if they give you an error message.

* <a href="https://tls-v1-0.badssl.com:1010/" target="_blank">https://tls-v1-0.badssl.com:1010/</a>
* <a href="https://tls-v1-1.badssl.com:1011/" target="_blank">https://tls-v1-1.badssl.com:1011/</a>



## CLN-001 -- Encryption algorithms using insecure mode and padding scheme

* Vulnerability type: Weak Cryptography
* Threat level: Low

The encryption algorithms used in the app use an insecure mode and padding scheme.

#### Impact

If sensitive data is being encrypted using an insecure mode and padding, it might lead to data being stolen or recovered from the encrypted data.

### Our Response

This was only ever used to sign the app index file used in the Nearby app swapping, which only works over the local network.  The signature is on a short-lived file that is generated on the fly, and is almost always used in a one-to-one interaction.  A lot of other pieces would have to be in place for this to be exploited.  Plus it would require a fair amount of expense to crack the cryptography on the file that was signed seconds or minutes before, and probably will only be in use for around 10 minutes.  Any app updates received via Nearby swapping will still have the full protection of the APK signature.  For these reasons, it is also still safe to use the SHA1 algorithm, which is necessary here for compatibility.  This use case falls under the "[second preimage attack](https://crypto.stackexchange.com/questions/48289/how-secure-is-sha1-what-are-the-chances-of-a-real-exploit/48291#48291)" case, meaning that the attacker cannot affect the data before it is signed. Git can also still rely on SHA1 for this reason.

F-Droid client v1.15.4 and v1.16-alpha1 switched from `RSA/ECB/PKCS1Padding` to the standard `SHA1withRSA` algorithm for signing the Nearby _index.jar_.  The new "index-v2" for repositories added in v1.16-alpha0 uses `SHA256withRSA` as the signing algorithm.  The official client always starts by trying the latest index version in each repository, and v1.16 added downgrade protection so a repo that already offers index-v2 can't be downgraded to index-v1.

## CLN-003 -- Clear text traffic is enabled in the application

* Vulnerability type: Insecure configuration
* Threat level: Low

The base network config of the application allows clear-text traffic.

#### Impact

Allowing clear-text traffic impacts confidentiality, authenticity, and protection against tampering. An attacker performing a machine-in-the-middle attack can eavesdrop on transmitted data and modify it without being detected.

### Our Response

This Android feature for blocking clear text HTTP connections is a good feature that apps should use. 
Having this disabled is obviously not ideal, but it is something we had to do to support the local HTTP swap functionality, and also HTTP .onion addresses in the past (there is another workaround possible these days). So we have taken extra measures to enforce HTTPS:

* [All built-in repository URLs are hardcoded to HTTPS](https://gitlab.com/fdroid/fdroidclient/-/blob/audit-2022-09-05/app/src/main/res/values/default_repos.xml)

* [Popular cloud hosting for repos is forced to HTTPS](https://gitlab.com/fdroid/fdroidclient/-/blob/audit-2022-09-05/app/src/main/java/org/fdroid/fdroid/data/NewRepoConfig.java#L193)

* [The default user prompt for adding repos includes `https://`](https://gitlab.com/fdroid/fdroidclient/-/blob/audit-2022-09-05/app/src/main/java/org/fdroid/fdroid/views/ManageReposActivity.java#L101)

This vulnerability applies to the exact same context as CLN-001: Nearby app swapping.  So it is already a quite limited environment for malicious actors to operate in. This does not affect built-in repos at all, since they are hard-coded to HTTPS.  Plus good webserver setups like f-droid.org do not allow data to be sent over plain HTTP.



## CLN-004 -- HTTP Request URLs are logged

* Vulnerability type: Information leakage
* Threat level: Low

The Android app (org.fdroid.fdroid.debug ver. 1.14-alpha3-505-gc8514adb9-debug) logs URLs.

#### Impact

Logging sensitive information in the Android log is not a recommended practice as this information can (in some scenarios) be accessed by other applications on the same device. URLs can contain tokens or other sensitive data which might be logged, leading to the disclosure of that data to other apps.

### Our Response

Privacy is important, and we want to ensure that any potentially private information is not leaked, even at the cost of easier debugging or service analytics.  So we appreciate the auditor's level of attention in reporting this issue and have removed the URLs from the logging on release builds.

This vulnerability does not affect the security of operations.  Many web services put private tokens in URLs, and logging those would be like leaking clear text passwords.  All the well known repositories including f-droid.org are run as a static website, so there are [no user accounts]({{ site.baseurl }}{% post_url 2022-02-28-no-user-accounts-by-design %}).  The issue here is if someone got the "logcat" text, which is generally protected in Android, and apps cannot simply read the text anymore.  One potential leak scenario would be if someone installed a sensitive app, then uninstalled it.  That app install and uninstall would be listed in the log, available if the user was compelled to provide that log, or if the device was exploited to get access to protected data.

This [will be fixed](https://gitlab.com/fdroid/fdroidclient/-/issues/2500) in the final v1.16 release.


(_This work was funded by NLnet under an ongoing project known as [Tracking the Trackers](https://nlnet.nl/project/F-Droid-Trackers/) and [The Search for Ethical Apps](https://nlnet.nl/project/EthicalApps/) under the umbrella of [Guardian Project](https://guardianproject.info/2022/09/01/the-search-for-ethical-apps-lets-start-with-governments/)_)
