---
layout: post
title: "Second Security Audit Results"
author: "eighthave"
authorWebsite: "https://forum.f-droid.org/u/hans"

---

The second full security audit of F-Droid is complete.  We are
satisfied with the results, which confirmed again that the core
security model and standard operations are solid.  The audit pointed
out issues in the core build process where we currently rely on manual
review by trusted contributors to protect us.  This audit also did
show that we still have work to do to achieve our goal of keeping the
Android client secure even when connected to a malicious server, for
example, if an untrusted repository is manually added that was created
by its operator to exploit.  The full audit report is available:
[report_otf_fdroid.pdf](https://www.radicallyopensecurity.com/report_otf_fdroid.pdf)
[_(cached copy)_]({% asset posts/2018-09-04-second-security-audit-results/report_otf_fdroid.pdf %}).

The audit was conducted by
[Radically Open Security](https://www.radicallyopensecurity.com),
which is a natural partner for F-Droid since they share a focus on
free software and open processes.  Thanks to
[Open Tech Fund](https://opentech.fund) for finding the auditor and
covering the costs of hiring them.

For more information about F-Droid's security practices, see the
documentation about the
[Security Model]({{ site.baseurl }}/docs/Security_Model/).


## Reducing trust requirements

One key part of this audit was to push us further into reducing the
level of trust required of the various pieces and participants in all
the processes in F-Droid.  Client/server systems are usually built
around the assumption that the server operator is fully trusted.
There are many trusted contributors working on F-Droid, and the people
working on the core parts have a long and good track record.
Nevertheless, it is very valuable to have a system that does not
require trusting people and their computers.  We aim to push all
pieces of the F-Droid ecosystem to work according to the
[principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege).

New apps and updates are submitted to
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) via merge request
and _git_ commits.  Those changes are then stored forever in the _git_
history.  In the past, the code trusted everything in _fdroiddata_,
since the commits are reviewed by humans for any malicious bits.
This model has a very good track record in F-Droid as well as many
other projects developed in the open by many people.  Debian is a
great example of this, since almost a thousand Debian Developers have
commit privileges which could give them root on every machine running
Debian.

This audit helped us ask the question: what kind privileges can be
restricted or removed without changing the way contributors work?  It
also caught a number of issues where the code trusted the inputs from
_fdroiddata_, where it had been committed and reviewed by humans, but
that could then point to other code which could contain the exploits.

Reducing the trust given to various pieces reduces the stresses of
contributing, and allows us as a community to open more things up to
all sorts of contributors.  If a contributor feels that their review
is the last line of defence against exploiting F-Droid, that adds a
lot of stress to the review.


## Privileged Extension

There were no issues found in the Privileged Extension code or the
interaction between F-Droid client and Privileged Extension.


## F-Droid client

* [4.1.19 OTF-019 — Potential SQL Injection]({{ site.baseurl }}/docs/Second_Audit_Report/#f35-potential-sql-injection)
* [4.1.24 OTF-024 — (fdroidclient) Raw SQL Query Executions]({{ site.baseurl }}/docs/Second_Audit_Report/#f47--fdroidclient-raw-sql-query-executions)

- right now, repos are trusted inputs verified by signatures.  This kind of finding helps us make it so less trust is required when using third party repos


* [4.1.26 OTF-026 — (fdroid Client) Insecure Implementation of SSL]({{ site.baseurl }}/docs/Second_Audit_Report/#f52--fdroid-client-insecure-implementation-of-ssl)

This finding is labeling a standard practice in Android as insecure:
"It is possible to install an SSL certificate on a device and run the
application to capture its traffic on the proxy."  Android does not
make it easy to accidentally include a certificate on the device, and
it also puts up a constant notification when one is in place.  We
believe that following this recommendation would not noticeably
improve real world security.  It would eliminate legitimate use cases
of installing a certificate on the device to inspect the traffic.  For
example: company firewalls that must inspect traffic to comply with
regulations; or, auditing real world traffic of F-Droid during normal
operation.


* [4.1.20 OTF-020 — Unverified URI redirect]({{ site.baseurl }}/docs/Second_Audit_Report/#f41-app-uses-data-from-clipboard)

This could only be exploited to change the URL that is shown in the
TOFU prompt to the user.  The user is responsible for confirming what
is listed in that prompt.  It should be fixed, but does not seem
urgent.  It will be included when we overhaul the whole "App Repo"
process.


* [4.1.23 OTF-023 — (fdroidclient) App Is Signed With _SHA1withRSA_, Known to Have Collision Issues]({{ site.baseurl }}/docs/Second_Audit_Report/#f46--fdroidclient-app-is-signed-with-sha1withrsa-known-to-have-collision-issues)
* [4.1.27 OTF-027 — (Privilege Extension) Mobile application package signed with weak algorithm _SHA1withRSA_]({{ site.baseurl }}/docs/Second_Audit_Report/#f53--privilege-extension-app-is-signed-with-sha1withrsa-known-to-have-collision-issues)

This is an issue in Android itself. If an APK is signed with SHA256,
that APK will not work on Android < 4.3.  Using a larger RSA signing
key would also be ideal.  But since migrating signing keys is not
supported in Android, it would be a very difficult project.  F-Droid
includes other layers of protection for validating APKs, including GPG
signatures on APKs as well as the whole secure F-Droid distribution
mechanism.


* [4.1.35 OTF-035 — Hardcoded root CA keys]({{ site.baseurl }}/docs/Second_Audit_Report/#f36-no-mechanism-to-remove-root-ca-keys)

The HTTPS pinning mechanism could definitely be improved.  Since HTTPS
pinning is not essential to secure operation, it has never been a high
priority.  The integrity of the files server remains protected by the
signature on the index files.  For _f-droid.org_ and the Guardian
Project repo, the keys to check those signatures are built into the
client.


### Nearby/Swap

* [4.1.9 OTF-009 — Applicatioin uses TrustOnFirstUse (TOFU) Usage unverified signing certificate]({{ site.baseurl }}/docs/Second_Audit_Report/#f39-trustonfirstuse-tofu-usage)
* [4.1.10 OTF-010 — (fdroid Client) Exploiting "Nearby Swap" Feature to Show Malicious Prompt to Users or Redirect to Malicious Sites]({{ site.baseurl }}/docs/Second_Audit_Report/#f49--fdroid-client-exploiting-nearby-swap-feature-to-show-malicious-prompt-to-users-or-redirect-to-malicious-sites)
* [4.1.17 OTF-017 — Use of Insecure Communication Mechanism - BluetoothClient.java]({{ site.baseurl }}/docs/Second_Audit_Report/#f31-bluetoothclient-java-insecure-rfcomm-socket-is-used-for-bluetooth-connection)
* [4.1.18 OTF-018 — Use of Insecure Communication Mechanism - BluetoothServer.java]({{ site.baseurl }}/docs/Second_Audit_Report/#f32-bluetoothserver-java-insecure-rfcomm-socket-used-for-bluetooth-connection)
* [4.1.25 OTF-025 — (fdroid Client) Snooping in Between Clients in "Nearby Swap"]({{ site.baseurl }}/docs/Second_Audit_Report/#f48--fdroid-client-snooping-in-between-clients-in-nearby-swap-)

[4.1.10 OTF-010]({{ site.baseurl }}/docs/Second_Audit_Report/#f49--fdroid-client-exploiting-nearby-swap-feature-to-show-malicious-prompt-to-users-or-redirect-to-malicious-sites)
was a serious issue that was fixed as soon as it was found, thanks to
Radically Open Security's open audit process.  It made it possible to
put up phishing prompts via the swap process, but could only be
exploited from the same network that the target device is on.

The security of the nearby swap is built largely on the limited scope
of attacks, since it works only via Bluetooth or via local Wi-Fi
restricted to the current subnet.  It is also only active for a very
limited time, while the user is directly using it.  Then, for file
integrity, the index signing key is trusted on the first use, then all
files are verified against the verified index.  While the security of
the process can definitely be improved, it was designed to replace
other much less secure methods that are widespread.

Ideally, all Bluetooth connections would use the native Bluetooth
encryption and all IP connections would use HTTPS.  The usability
issues related to adding support for those would probably make the
nearby/swap feature almost useless without a very substantial chunk of
work.


## _fdroidserver_

### Moving towards least privilege

* [4.1.4 OTF-004 — Infoleak in Fdroidserver Checkupdates.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f25-infoleak-in-fdroidserver-checkupdates-py)
* [4.1.5 OTF-005 — Code Injection in Fdroidserver Checkupdates Through Eval'ed User Supplied Data]({{ site.baseurl }}/docs/Second_Audit_Report/#f26-code-injection-in-fdroidserver-checkupdates-py-through-eval--ed-user-supplied-data)
* [4.1.6 OTF-006 — Code Injection Via Malicious Appid in Fdroidserver Build.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f27-code-injection-via-malicious-appid-in-fdroidserver-build-py)
* [4.1.34 OTF-034 — Maliciously Crafted Appid Code Injection in Fdroidserver Build.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f24-maliciously-crafted-appid-code-injection-in-fdroidserver-build-py)

The build metadata files are used to describe an app and it's build
process.  They are usually created by trusted parties (e.g. the person
running the repo) or reviewed via merge requests.  These findings
would only have caused problems for repos that included metadata files
from untrusted sources without reviewing them.  For _f-droid.org_, the
metadata files can only be downloaded to the production servers via
git commits in [fdroiddata](https://gitlab.com/fdroid/fdroiddata).  No
attempts to exploit these have been seen in the git history nor merge
requests.  Most of these issues only affect the app building process,
e.g. `fdroid build`.  Repos made from binary APKs and `fdroid update`
would only be affected by [4.1.3 OTF-003]({{ site.baseurl }}/docs/Second_Audit_Report/#f23-code-injection-in-fdroidserver-metadata-yaml-parsing).


### Removing weaknesses that could be chained into exploits

The data formats that were used allow for code execution from
serialized code.  The build metadata files are now loaded with with
code serialization disabled, the _apkcache_ file was switched from
_pickle_ to JSON, and we will switch the _config.py_ file to YAML with
safe loading.

* [4.1.3 OTF-003 — Code Injection in Fdroidserver Metadata Yaml Parsing]({{ site.baseurl }}/docs/Second_Audit_Report/#f23-code-injection-in-fdroidserver-metadata-yaml-parsing)
* [4.1.31 OTF-031 — Dangerous Deserialization Using Python Pickle in Fdroidserver:update.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f16-dangerous-deserialization-using-python-pickle-in-fdroidserver-update-py)


### Denial of Service

A few issues were found that allow contributors with trusted access to
stop parts of the system from working.

* [4.1.12 OTF-012 — Key Alias Collisions Can Lead to DoS of Publishing in Fdroidserver]({{ site.baseurl }}/docs/Second_Audit_Report/#f13-key-alias-collisions-can-lead-to-dos-of-publishing-in-fdroidserver) ([issue #553](https://gitlab.com/fdroid/fdroidserver/issues/553))
* [4.1.13 OTF-013 — Image Bomb Can Lead to DoS in Fdroidserver:update.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f15-image-bomb-can-lead-to-dos-in-fdroidserver-update-py)
* [4.1.15 OTF-015 — Parsing Untrusted XML Data in Fdroidserver]({{ site.baseurl }}/docs/Second_Audit_Report/#f20-parsing-untrusted-xml-data-in-fdroidserver)


### Experimental drozer integration

As part of the Bazaar2 funding, an experimental feature for
integrating Drozer into the fdroid release project was built.  This
feature is still alpha and is not deployed on any production setup.
These issues are real issues, but there are no plans to fix them
currently since there are no plans to move forward with the Drozer
integration.  We welcome contributions by those who want to see that
happen.

* [4.1.2 OTF-002 — Shell Code Injection Via Malicious Appids Into Fdroidserver]({{ site.baseurl }}/docs/Second_Audit_Report/#f14-shell-code-injection-via-malicious-appids-into-fdroidserver)
* [4.1.14 OTF-014 — Insecure Usage of Temporary File/Directory in Fdroidserver Docker/drozer.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f17-insecure-usage-of-temporary-file-directory-in-fdroidserver-docker-drozer-py)
* [4.1.32 OTF-032 — Starting a Process With a Partial Executable Path]({{ site.baseurl }}/docs/Second_Audit_Report/#f19-starting-a-process-with-a-partial-executable-path)


## _f-droid.org_ website

* [4.1.7 OTF-007 — Javascript Injection Into HTMLified Descriptions in Fdroidserver Metadata]({{ site.baseurl }}/docs/Second_Audit_Report/#f29-javascript-injection-into-htmlified-package-descriptions-in-fdroidserver-metadata-py)
* [4.1.11 OTF-011 — Weak Regexps Filtering XSS and Unwanted HTML Tags in Fdroidserver/lint.py]({{ site.baseurl }}/docs/Second_Audit_Report/#f12-weak-regexps-filtering-xss-and-unwanted-html-tags-in-fdroidserver-lint-py)

Moving the whole website from Wordpress to a statically generated site
paid large security dividends, there were no actionable issues found
with the website.  While both findings are correct in that malicious
Javascript could be injected into descriptions, both the _f-droid.org_
website and Android client do not let Javascript run from the
descriptions.  The _f-droid.org_ website protects against malicious
Javascript injection with a
[strict HTTP Content Security Policy](https://observatory.mozilla.org/analyze.html?host=f-droid.org).
F-Droid client never runs CSS, Javascript, or dangerous HTML tags
since it displays the HTML via
[`Html.fromHtml()`](https://gitlab.com/fdroid/fdroidclient/blob/1.3.1/app/src/main/java/org/fdroid/fdroid/views/AppDetailsRecyclerViewAdapter.java#L441)
with image loading disabled.

Ideally, the index generation process in `fdroid update` would have
robust CSS/HTML/Javascript checks so malicious injection is prevented
by both the index providers and consumers.  This would increase the
"herd immunity" of everyone working with data generated using any of
the F-Droid tools.


* [4.1.37 OTF-037 — Untrusted External Links]({{ site.baseurl }}/docs/Second_Audit_Report/#f38-untrusted-external-links)

The links are only displayed in the "Links" section.  Since there is a
human review of those URLs, and those URLs are committed to git, we
have left those to be open without validation. There are also other
URLs like home page, issue tracker, etc.  I suppose we should show the
full URL in the UI if they don't match a well known pattern.  Google
Play also includes a link to a website that the app author provides.

One idea for improvement here would be to scan these URLs with the
Google Safe Browsing API.


## Repomaker

Repomaker is a web tool to make it really easy to set up your own
F-Droid repositories.  It is a new project that should still be
considered beta.  There was one issue with high severity
([CVE-2018-7753](https://nvd.nist.gov/vuln/detail/CVE-2018-7753))
found in an upstream library, Mozilla's
[_bleach_](https://github.com/mozilla/bleach).  It was reported to
Mozilla and promptly fixed.  There were three other low impact
findings which have been fixed.

* [4.1.1 OTF-001 — Evasion of Bleach Sanitizer in Repomaker]({{ site.baseurl }}/docs/Second_Audit_Report/#f8-evasion-of-bleach-sanitizer-in-repomaker)
* [4.1.29 OTF-029 — Tabnabbing in Repomaker]({{ site.baseurl }}/docs/Second_Audit_Report/#f1-tabnabbing-in-repomaker)
* [4.1.30 OTF-030 — Repomaker:apk:_def_get_type Allows for Mime Type Mismatches]({{ site.baseurl }}/docs/Second_Audit_Report/#f9-repomaker-apk-_def_get_type-allows-for-mime-type-mismatches)
* [4.1.31 OTF-031 — Unsafe HTML Rendering of Arbitrary Input]({{ site.baseurl }}/docs/Second_Audit_Report/#f10-unsafe-html-rendering-of-arbitrary-input)


## Findings that are not relevant or too pedantic

These are issues which are not technically wrong, but are not relevant
in the context of how F-Droid is using the code.

* [4.1.8 OTF-008 — Unvalidated User Input Included in Response]({{ site.baseurl }}/docs/Second_Audit_Report/#f33-bluetoothserver-java-request-uri-included-in-response)

The _BluetoothServer_ is only ever used to serve files to F-Droid
client's Bluetooth handling, which is nothing like a browser and
definitely does not execute HTML/CSS/Javascript or display websites.
It would not be possible to ever display this information in a browser
without custom code in to receive it.


* [4.1.16 OTF-016 — Missing file type and size validation]({{ site.baseurl }}/docs/Second_Audit_Report/#f34-bluetootheserver-java-file-in-response-without-size-of-type-check)
* [4.1.34 OTF-034 — Missing file type and size validation]({{ site.baseurl }}/docs/Second_Audit_Report/#f30-downloader-download-file-type-and-size-are-not-verified)

The download process only downloads files to a private directory.  The
file validation happens during the install process for all files.
After download, the install process validates the SHA-256 against what
is in the signed file index.


* [4.1.21 OTF-021 — File Deleted Unconditionally]({{ site.baseurl }}/docs/Second_Audit_Report/#f43-file-deleted-unconditionally)

This code is only used to make JAR signatures on the _index.jar_ for
the nearby/swap process.  Android protects critical files from
deletion with file permissions.  Only the _index.jar_ file is ever
handled by the zipsigner code.


* [4.1.22 OTF-022 — Secure Temp File Usage Recommended]({{ site.baseurl }}/docs/Second_Audit_Report/#f44-secure-temp-file-usage-recommended)

The NanoHTTPD built-in webserver is only ever used to serve public
information.  Also, the parts of the code in the NanoHTTPD library
that creates temp files is likely never used in F-Droid.


* [4.1.36 OTF-036 — Use of weak methods for data protection]({{ site.baseurl }}/docs/Second_Audit_Report/#f37-use-of-rot13-and-base64-encoding)

Obfuscation here is used not as a security mechanism, but rather as a
lightweight anti-piracy mechanism.  The obscured information
ultimately need to be available to the app to use it, so there would
always be a way to extract the obscured information, as we have seen
in the decades of software copy protection arms races.


* [4.1.38 OTF-038 — Weak pattern matching filter]({{ site.baseurl }}/docs/Second_Audit_Report/#f42-stronger-regular-expression-recommended)

Filenames in Java are not executed by a shell.  Only the `/` character
is problematic with filesystems and file handling code.  Ideally, all
files produced by F-Droid software would end up safe no matter where
or how they are used, but it seems that the only manageable way to
sanitize files is on the endpoints that are consuming the files
(e.g. _fdroidclient_ or _f-droid.org_).
